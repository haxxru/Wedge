package com.wedge.backend.domain.freelancer.entity;

import com.wedge.backend.global.entity.BaseTimeEntity;
import jakarta.persistence.*;
import lombok.*;

@Entity
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Table(name = "portfolios")
public class Portfolio extends BaseTimeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "freelancer_profile_id", nullable = false)
    private FreelancerProfile freelancerProfile;

    @Column(name = "image_url", nullable = false, length = 500)
    private String imageUrl;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(name = "sort_order", nullable = false)
    private int sortOrder = 0;

    @Builder
    public Portfolio(FreelancerProfile freelancerProfile, String imageUrl,
                     String description, int sortOrder) {
        this.freelancerProfile = freelancerProfile;
        this.imageUrl = imageUrl;
        this.description = description;
        this.sortOrder = sortOrder;
    }

    public void update(String imageUrl, String description, int sortOrder) {
        this.imageUrl = imageUrl;
        this.description = description;
        this.sortOrder = sortOrder;
    }
}