package com.wedge.backend.domain.recruit.dto;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;

import java.time.LocalDate;

@Getter
public class RecruitPostRequest {

    @NotBlank(message = "제목을 입력해주세요.")
    @Size(max = 200, message = "제목은 200자 이하로 입력해주세요.")
    private String title;

    @NotBlank(message = "내용을 입력해주세요.")
    @Size(max = 5000, message = "내용은 5000자 이하로 입력해주세요.")
    private String content;

    @NotNull(message = "카테고리를 선택해주세요.")
    private Long categoryId;

    @Min(value = 0, message = "예산은 0 이상이어야 합니다.")
    private Integer budget;

    @NotNull(message = "웨딩 예정일을 입력해주세요.")
    private LocalDate weddingDate;

    @Size(max = 100, message = "지역은 100자 이하로 입력해주세요.")
    private String region;
}
