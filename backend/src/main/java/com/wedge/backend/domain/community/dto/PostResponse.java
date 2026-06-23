package com.wedge.backend.domain.community.dto;

import com.wedge.backend.domain.community.entity.Post;
import com.wedge.backend.domain.community.entity.PostType;
import com.wedge.backend.domain.freelancer.entity.FreelancerProfile;
import com.wedge.backend.domain.member.entity.Role;
import lombok.Getter;

import java.time.LocalDateTime;
import java.util.List;

@Getter
public class PostResponse {

    private final Long id;
    private final Long memberId;
    private final String memberName;
    private final String memberImageUrl;
    private final Role memberRole;
    private final String title;
    private final String content;
    private final PostType type;
    private final String imageUrl;       // 첫 번째 이미지 (썸네일용)
    private final List<String> imageUrls; // 전체 이미지 목록
    private final List<MentionResponse> mentions;
    private final LocalDateTime createdAt;
    private final LocalDateTime updatedAt;

    public PostResponse(Post post) {
        this(post, List.of());
    }

    public PostResponse(Post post, List<FreelancerProfile> mentionedProfiles) {
        this.id = post.getId();
        this.memberId = post.getMember().getId();
        this.memberName = post.getMember().getName();
        this.memberImageUrl = post.getMember().getProfileImageUrl();
        this.memberRole = post.getMember().getRole();
        this.title = post.getTitle();
        this.content = post.getContent();
        this.type = post.getType();
        List<String> urls = post.getImageUrls();
        this.imageUrl = urls.isEmpty() ? null : urls.get(0);
        this.imageUrls = urls;
        this.mentions = mentionedProfiles.stream()
                .map(profile -> new MentionResponse(profile.getId(), profile.getMember().getName()))
                .toList();
        this.createdAt = post.getCreatedAt();
        this.updatedAt = post.getUpdatedAt();
    }

    @Getter
    public static class MentionResponse {
        private final Long freelancerProfileId;
        private final String freelancerName;

        public MentionResponse(Long freelancerProfileId, String freelancerName) {
            this.freelancerProfileId = freelancerProfileId;
            this.freelancerName = freelancerName;
        }
    }
}