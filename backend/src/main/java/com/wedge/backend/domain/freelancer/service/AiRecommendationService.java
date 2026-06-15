package com.wedge.backend.domain.freelancer.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.wedge.backend.domain.freelancer.dto.AiRecommendationResponse;
import com.wedge.backend.domain.freelancer.entity.FreelancerProfile;
import com.wedge.backend.domain.freelancer.repository.FreelancerProfileRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestClient;

import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class AiRecommendationService {

    private final FreelancerProfileRepository freelancerProfileRepository;
    private final ObjectMapper objectMapper;

    @Value("${gemini.api-key}")
    private String apiKey;

    private static final String GEMINI_URL =
            "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent";

    public List<AiRecommendationResponse> getRecommendations() {

        List<FreelancerProfile> profiles = freelancerProfileRepository.findAll();
        Collections.shuffle(profiles);
        List<FreelancerProfile> candidates = profiles.stream().limit(30).toList();

        String profileText = candidates.stream()
                .map(p -> "id:%d, 제목:%s, 지역:%s, 가격:%d원, 경력:%d년"
                        .formatted(p.getId(), p.getTitle(), p.getRegion(),
                                p.getPrice() != null ? p.getPrice() : 0,
                                p.getCareerYears()))
                .collect(Collectors.joining("\n"));

        String prompt = """
                아래는 프리랜서 목록입니다.
                이 중에서 다양성을 고려해 6명을 추천하고, 각각 추천 이유를 한 문장으로 작성해 주세요.
                
                반드시 아래 JSON 배열 형식으로만 응답하세요. 다른 텍스트나 마크다운은 절대 포함하지 마세요.
                [
                  {"id": 1, "reason": "추천 이유"},
                  {"id": 2, "reason": "추천 이유"}
                ]
                
                프리랜서 목록:
                %s
                """.formatted(profileText);

        Map<String, Object> requestBody = Map.of(
                "contents", List.of(
                        Map.of("parts", List.of(
                                Map.of("text", prompt)
                        ))
                )
        );

        String response = RestClient.create()
                .post()
                .uri(GEMINI_URL + "?key=" + apiKey)
                .contentType(org.springframework.http.MediaType.APPLICATION_JSON)
                .body(requestBody)
                .retrieve()
                .body(String.class);

        return parseResponse(response, candidates);
    }

    private List<AiRecommendationResponse> parseResponse(
            String response, List<FreelancerProfile> candidates) {
        try {
            JsonNode root = objectMapper.readTree(response);
            String text = root
                    .path("candidates").get(0)
                    .path("content")
                    .path("parts").get(0)
                    .path("text")
                    .asText();
            text = text.replaceAll("```json", "").replaceAll("```", "").trim();

            JsonNode recommendations = objectMapper.readTree(text);

            Map<Long, FreelancerProfile> profileMap = candidates.stream()
                    .collect(Collectors.toMap(FreelancerProfile::getId, p -> p));

            return recommendations.findValues("id").stream()
                    .map(idNode -> {
                        Long id = idNode.asLong();
                        String reason = recommendations.get(
                                recommendations.findValues("id").indexOf(idNode)
                        ).path("reason").asText();
                        FreelancerProfile profile = profileMap.get(id);
                        return profile != null
                                ? AiRecommendationResponse.of(profile, reason)
                                : null;
                    })
                    .filter(r -> r != null)
                    .toList();

        } catch (Exception e) {
            return List.of();
        }
    }
}