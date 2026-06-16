package com.wedge.backend.domain.freelancer.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class IntroductionGenerateRequest {
    private String categoryName;
    private String keywords;
}