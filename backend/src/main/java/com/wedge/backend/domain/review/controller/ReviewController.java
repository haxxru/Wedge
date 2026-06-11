package com.wedge.backend.domain.review.controller;

import com.wedge.backend.domain.review.dto.ReviewResponseDto;
import com.wedge.backend.domain.review.service.ReviewService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/freelancers/{profileId}/reviews")
public class ReviewController {

    private final ReviewService reviewService;

    // 리뷰 목록 조회
    @GetMapping
    public ResponseEntity<List<ReviewResponseDto>> getReviews(
            @PathVariable Long profileId) {
        return ResponseEntity.ok(reviewService.getReviews(profileId));
    }
}