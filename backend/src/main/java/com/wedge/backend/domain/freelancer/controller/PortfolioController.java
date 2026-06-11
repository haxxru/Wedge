package com.wedge.backend.domain.freelancer.controller;

import com.wedge.backend.domain.freelancer.dto.PortfolioResponseDto;
import com.wedge.backend.domain.freelancer.service.PortfolioService;
import com.wedge.backend.domain.member.entity.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/freelancers/{profileId}/portfolios")
public class PortfolioController {

    private final PortfolioService portfolioService;

    // 포트폴리오 목록 조회
    @GetMapping
    public ResponseEntity<List<PortfolioResponseDto>> getPortfolios(
            @PathVariable Long profileId) {
        return ResponseEntity.ok(portfolioService.getPortfolios(profileId));
    }

    // 포트폴리오 등록
    @PostMapping
    public ResponseEntity<PortfolioResponseDto> createPortfolio(
            @PathVariable Long profileId,
            @AuthenticationPrincipal Member member,
            @RequestParam String imageUrl,
            @RequestParam(required = false) String description,
            @RequestParam(defaultValue = "0") int sortOrder) {
        return ResponseEntity.ok(portfolioService.createPortfolio(member, profileId, imageUrl, description, sortOrder));
    }

    // 포트폴리오 삭제
    @DeleteMapping("/{portfolioId}")
    public ResponseEntity<Void> deletePortfolio(
            @PathVariable Long profileId,
            @PathVariable Long portfolioId,
            @AuthenticationPrincipal Member member) {
        portfolioService.deletePortfolio(member, portfolioId);
        return ResponseEntity.noContent().build();
    }
}