package com.wedge.backend.domain.freelancer.dto;

import com.wedge.backend.domain.freelancer.entity.Portfolio;
import lombok.Getter;

@Getter
public class PortfolioResponseDto {
    private Long id;
    private Long freelancerProfileId;
    private String imageUrl;
    private String description;
    private int sortOrder;

    public PortfolioResponseDto(Portfolio portfolio) {
        this.id = portfolio.getId();
        this.freelancerProfileId = portfolio.getFreelancerProfile().getId();
        this.imageUrl = portfolio.getImageUrl();
        this.description = portfolio.getDescription();
        this.sortOrder = portfolio.getSortOrder();
    }
}