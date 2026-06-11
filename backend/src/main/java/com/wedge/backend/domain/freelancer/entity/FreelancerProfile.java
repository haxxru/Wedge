package com.wedge.backend.domain.freelancer.entity;

import com.wedge.backend.domain.member.entity.Member;
import jakarta.persistence.*;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Entity
@Table(name = "freelancer_profiles")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class FreelancerProfile {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // 회원 (1:1)
    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "member_id", nullable = false, unique = true)
    private Member member;

    @Column(nullable = false)
    private String title;

    @Column
    private String introduction;

    @Column(nullable = false)
    private String region;

    @Column
    private Integer price;

    @Column(name = "career_years", nullable = false)
    private int careerYears;

    @Column(name = "created_at", nullable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at", nullable = false)
    private LocalDateTime updatedAt;
}