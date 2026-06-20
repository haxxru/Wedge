package com.wedge.backend.domain.freelancer.dto;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.wedge.backend.domain.freelancer.entity.FreelancerProfile;
import lombok.Getter;

@Getter
public class FeaturedFreelancerResponse {

    private final Long freelancerProfileId;
    private final String memberName;
    private final String title;
    private final Integer price;
    private final String portfolioImageUrl;

    @JsonCreator
    private FeaturedFreelancerResponse(
            @JsonProperty("freelancerProfileId") Long freelancerProfileId,
            @JsonProperty("memberName") String memberName,
            @JsonProperty("title") String title,
            @JsonProperty("price") Integer price,
            @JsonProperty("portfolioImageUrl") String portfolioImageUrl) {
        this.freelancerProfileId = freelancerProfileId;
        this.memberName = memberName;
        this.title = title;
        this.price = price;
        this.portfolioImageUrl = portfolioImageUrl;
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