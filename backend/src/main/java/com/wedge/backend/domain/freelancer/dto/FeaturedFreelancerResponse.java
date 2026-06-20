package com.wedge.backend.domain.freelancer.dto;

import com.wedge.backend.domain.freelancer.entity.FreelancerProfile;
import lombok.Getter;

@Getter
public class FeaturedFreelancerResponse {

    private final Long freelancerProfileId;
    private final String memberName;
    private final String title;
    private final Integer price;
    private final String portfolioImageUrl;

    private FeaturedFreelancerResponse() {
        this.freelancerProfileId = null;
        this.memberName = null;
        this.title = null;
        this.price = null;
        this.portfolioImageUrl = null;
    }

    private FeaturedFreelancerResponse(FreelancerProfile profile, String portfolioImageUrl) {
        this.freelancerProfileId = profile.getId();
        this.memberName = profile.getMember().getName();
        this.title = profile.getTitle();
        this.price = profile.getPrice();
        this.portfolioImageUrl = portfolioImageUrl;
    }

    public static FeaturedFreelancerResponse from(FreelancerProfile profile, String portfolioImageUrl) {
        return new FeaturedFreelancerResponse(profile, portfolioImageUrl);
    }
}