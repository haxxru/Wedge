package com.wedge.backend.domain.review.repository;

import com.wedge.backend.domain.review.dto.FreelancerReviewCount;
import com.wedge.backend.domain.review.entity.Review;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface ReviewRepository extends JpaRepository<Review, Long> {
    List<Review> findByFreelancerProfileId(Long freelancerProfileId);

    List<Review> findByMemberId(Long memberId);

    Optional<Review> findByReservationId(Long reservationId);
    @Query("""
            SELECT new com.wedge.backend.domain.review.dto.FreelancerReviewCount(r.freelancerProfile, COUNT(r))
            FROM Review r
            WHERE r.createdAt >= :since
            GROUP BY r.freelancerProfile
            ORDER BY COUNT(r) DESC
            """)
    List<FreelancerReviewCount> findTopFreelancersByReviewCountSince(
            @Param("since") LocalDateTime since,
            Pageable pageable);
}
