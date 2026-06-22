package com.wedge.backend.domain.community.dto;

import com.wedge.backend.domain.community.entity.PostType;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;

@Getter
public class PostRequest {

    @NotBlank(message = "제목을 입력해주세요.")
    @Size(max = 200, message = "제목은 200자 이하로 입력해주세요.")
    private String title;

    @NotBlank(message = "내용을 입력해주세요.")
    @Size(max = 5000, message = "내용은 5000자 이하로 입력해주세요.")
    private String content;

    @NotNull(message = "게시글 타입을 선택해주세요.")
    private PostType type;
}
