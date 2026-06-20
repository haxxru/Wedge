package com.wedge.backend.domain.bookmark.service;

import com.wedge.backend.domain.bookmark.dto.BookmarkResponse;
import com.wedge.backend.domain.bookmark.entity.Bookmark;
import com.wedge.backend.domain.bookmark.repository.BookmarkRepository;
import com.wedge.backend.domain.freelancer.entity.FreelancerProfile;
import com.wedge.backend.domain.freelancer.entity.Portfolio;
import com.wedge.backend.domain.freelancer.repository.FreelancerProfileRepository;
import com.wedge.backend.domain.freelancer.repository.PortfolioRepository;
import com.wedge.backend.domain.member.entity.Member;
import com.wedge.backend.domain.member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
public class BookmarkService {

    private final BookmarkRepository bookmarkRepository;
    private final FreelancerProfileRepository freelancerProfileRepository;
    private final MemberRepository memberRepository;
    private final PortfolioRepository portfolioRepository;

    @Transactional
    public boolean toggleBookmark(Long memberId, Long freelancerProfileId) {
        FreelancerProfile freelancerProfile = freelancerProfileRepository
                .findById(freelancerProfileId)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 프리랜서입니다."));

        Member member = memberRepository.findById(memberId)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 회원입니다."));

        Optional<Bookmark> existing = bookmarkRepository
                .findByMemberIdAndFreelancerProfileId(memberId, freelancerProfileId);

        if (existing.isPresent()) {
            bookmarkRepository.delete(existing.get());
            freelancerProfile.decreaseBookmarkCount();
            return false;
        }

        Bookmark bookmark = Bookmark.builder()
                .member(member)
                .freelancerProfile(freelancerProfile)
                .build();
        bookmarkRepository.save(bookmark);
        freelancerProfile.increaseBookmarkCount();
        return true;
    }

    @Transactional(readOnly = true)
    public boolean isBookmarked(Long memberId, Long freelancerProfileId) {
        return bookmarkRepository.existsByMemberIdAndFreelancerProfileId(
                memberId, freelancerProfileId);
    }

    @Transactional(readOnly = true)
    public List<BookmarkResponse> getBookmarks(Long memberId) {
        List<Bookmark> bookmarks = bookmarkRepository.findAllByMemberIdWithProfile(memberId);

        if (bookmarks.isEmpty()) {
            return List.of();
        }

        List<Long> freelancerProfileIds = bookmarks.stream()
                .map(b -> b.getFreelancerProfile().getId())
                .distinct()
                .toList();

        Map<Long, String> representativeImageMap = portfolioRepository
                .findByFreelancerProfileIdInOrderByFreelancerProfileIdAscSortOrderAscIdAsc(freelancerProfileIds)
                .stream()
                .collect(Collectors.toMap(
                        portfolio -> portfolio.getFreelancerProfile().getId(),
                        Portfolio::getImageUrl,
                        (first, second) -> first
                ));

        return bookmarks.stream()
                .map(bookmark -> BookmarkResponse.from(
                        bookmark,
                        representativeImageMap.get(bookmark.getFreelancerProfile().getId())
                ))
                .toList();
    }
}