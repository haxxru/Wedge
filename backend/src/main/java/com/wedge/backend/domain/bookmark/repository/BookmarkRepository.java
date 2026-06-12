package com.wedge.backend.domain.bookmark.repository;

import com.wedge.backend.domain.bookmark.entity.Bookmark;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface BookmarkRepository extends JpaRepository<Bookmark, Long> {

    boolean existsByMemberIdAndFreelancerProfileId(Long memberId, Long freelancerProfileId);

    Optional<Bookmark> findByMemberIdAndFreelancerProfileId(Long memberId, Long freelancerProfileId);

    void deleteAllByMemberId(Long memberId);
    List<Bookmark> findAllByMemberId(Long memberId);
}