package com.wedge.backend.domain.bookmark.controller;

import com.wedge.backend.domain.bookmark.dto.BookmarkResponse;
import com.wedge.backend.domain.bookmark.service.BookmarkService;
import com.wedge.backend.domain.member.entity.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/bookmarks")
public class BookmarkController {

    private final BookmarkService bookmarkService;

    @PostMapping("/{freelancerProfileId}")
    public ResponseEntity<Map<String, Object>> toggleBookmark(
            @AuthenticationPrincipal Member member,
            @PathVariable Long freelancerProfileId) {

        boolean isBookmarked = bookmarkService.toggleBookmark(member, freelancerProfileId);

        return ResponseEntity.ok(Map.of(
                "bookmarked", isBookmarked,
                "message", isBookmarked ? "찜하기 완료" : "찜 해제 완료"
        ));
    }

    @GetMapping("/{freelancerProfileId}")
    public ResponseEntity<Map<String, Object>> checkBookmark(
            @AuthenticationPrincipal Member member,
            @PathVariable Long freelancerProfileId) {

        boolean isBookmarked = bookmarkService.isBookmarked(
                member.getId(), freelancerProfileId);

        return ResponseEntity.ok(Map.of("bookmarked", isBookmarked));
    }

    @GetMapping
    public ResponseEntity<List<BookmarkResponse>> getBookmarks(
            @AuthenticationPrincipal Member member) {

        List<BookmarkResponse> bookmarks = bookmarkService.getBookmarks(member.getId());
        return ResponseEntity.ok(bookmarks);
    }
}