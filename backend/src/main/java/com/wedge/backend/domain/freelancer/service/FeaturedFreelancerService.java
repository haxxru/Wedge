package com.wedge.backend.domain.freelancer.service;

import com.wedge.backend.domain.freelancer.dto.FeaturedFreelancerResponse;
import com.wedge.backend.domain.freelancer.entity.FreelancerProfile;
import com.wedge.backend.domain.freelancer.entity.Portfolio;
import com.wedge.backend.domain.freelancer.repository.FreelancerProfileRepository;
import com.wedge.backend.domain.freelancer.repository.PortfolioRepository;
import com.wedge.backend.domain.review.repository.ReviewRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class FeaturedFreelancerService {

    private static final int FEATURED_LIMIT = 12;
    private static final int RECENT_DAYS = 30;
    private static final long NON_EXISTENT_ID = -1L;

    private final ReviewRepository reviewRepository;
    private final FreelancerProfileRepository freelancerProfileRepository;
    private final PortfolioRepository portfolioRepository;

    @Cacheable("featuredFreelancers")
    public List<FeaturedFreelancerResponse> getFeaturedFreelancers() {

        LocalDateTime since = LocalDateTime.now().minusDays(RECENT_DAYS);

        List<Long> reviewBasedIds = reviewRepository
                .findTopFreelancersByReviewCountSince(since, PageRequest.of(0, FEATURED_LIMIT))
                .stream()
                .map(count -> count.getFreelancerProfile().getId())
                .toList();

        List<Long> finalIds = fillWithFallback(reviewBasedIds);

        if (finalIds.isEmpty()) {
            return new ArrayList<>();
        }

        Map<Long, FreelancerProfile> profileMap = freelancerProfileRepository
                .findByIdInWithMember(finalIds)
                .stream()
                .collect(Collectors.toMap(FreelancerProfile::getId, profile -> profile));

        Map<Long, String> imageMap = portfolioRepository
                .findByFreelancerProfileIdInOrderByFreelancerProfileIdAscSortOrderAscIdAsc(finalIds)
                .stream()
                .collect(Collectors.toMap(
                        portfolio -> portfolio.getFreelancerProfile().getId(),
                        Portfolio::getImageUrl,
                        (first, second) -> first
                ));

        return finalIds.stream()
                .map(profileMap::get)
                .filter(Objects::nonNull)
                .map(profile -> FeaturedFreelancerResponse.from(profile, imageMap.get(profile.getId())))
                .collect(Collectors.toCollection(ArrayList::new));
    }

    private List<Long> fillWithFallback(List<Long> reviewBasedIds) {
        int remaining = FEATURED_LIMIT - reviewBasedIds.size();
        if (remaining <= 0) {
            return reviewBasedIds;
        }

        List<Long> excludedIds = reviewBasedIds.isEmpty()
                ? List.of(NON_EXISTENT_ID)
                : reviewBasedIds;

        List<Long> fallbackIds = freelancerProfileRepository
                .findByIdNotInOrderByBookmarkCountDescCreatedAtDesc(excludedIds, PageRequest.of(0, remaining))
                .stream()
                .map(FreelancerProfile::getId)
                .toList();

        List<Long> combined = new ArrayList<>(reviewBasedIds);
        combined.addAll(fallbackIds);
        return combined;
    }
}