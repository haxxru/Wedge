package com.wedge.backend.domain.freelancer.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class FreelancerProfileRequestDto {
    private Long categoryId;
    private String title;
    private String introduction;
    private String keywords;  // 이거 추가
    private String region;
    private Integer price;
    private int careerYears;
}