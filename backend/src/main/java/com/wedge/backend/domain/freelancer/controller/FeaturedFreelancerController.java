package com.wedge.backend.domain.freelancer.controller;

import com.wedge.backend.domain.freelancer.dto.FeaturedFreelancerResponse;
import com.wedge.backend.domain.freelancer.service.FeaturedFreelancerService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Tag(name = "프리랜서", description = "프리랜서 조회 관련 API")
@RestController
@RequiredArgsConstructor
@RequestMapping("/api/freelancers")
public class FeaturedFreelancerController {

    private final FeaturedFreelancerService featuredFreelancerService;

    @Operation(
            summary = "메인 페이지 추천 프리랜서 조회",
            description = "최근 30일간 리뷰 수가 많은 순으로 프리랜서를 조회합니다. 부족한 인원은 찜 인기순으로 채워집니다."
    )
    @GetMapping("/featured")
    public ResponseEntity<List<FeaturedFreelancerResponse>> getFeaturedFreelancers() {
        return ResponseEntity.ok(featuredFreelancerService.getFeaturedFreelancers());
    }
}