package com.wedge.backend.domain.review.dto;

import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Getter
@NoArgsConstructor
public class ReviewRequestDto {

    @Min(value = 1, message = "별점은 1 이상이어야 합니다.")
    @Max(value = 5, message = "별점은 5 이하이어야 합니다.")
    private int rating;

    @NotBlank(message = "리뷰 내용을 입력해주세요.")
    @Size(max = 2000, message = "리뷰는 2000자 이하로 입력해주세요.")
    private String content;
}
