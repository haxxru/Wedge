package com.wedge.backend.domain.review.dto;

import com.wedge.backend.domain.freelancer.entity.FreelancerProfile;
import lombok.Getter;

@Getter
public class FreelancerReviewCount {

    private final FreelancerProfile freelancerProfile;
    private final Long reviewCount;

    public FreelancerReviewCount(FreelancerProfile freelancerProfile, Long reviewCount) {
        this.freelancerProfile = freelancerProfile;
        this.reviewCount = reviewCount;
    }
}