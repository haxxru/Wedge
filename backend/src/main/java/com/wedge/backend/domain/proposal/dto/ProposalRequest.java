package com.wedge.backend.domain.proposal.dto;

import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Getter;

@Getter
public class ProposalRequest {

    @NotBlank(message = "제안 내용을 입력해주세요.")
    @Size(max = 3000, message = "제안 내용은 3000자 이하로 입력해주세요.")
    private String content;

    @Min(value = 0, message = "가격은 0 이상이어야 합니다.")
    private Integer price;

    @Size(max = 100, message = "지역은 100자 이하로 입력해주세요.")
    private String region;
}
