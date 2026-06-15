package com.wedge.backend.global.oauth2;

import com.wedge.backend.domain.member.entity.RefreshToken;
import com.wedge.backend.domain.member.repository.RefreshTokenRepository;
import com.wedge.backend.global.jwt.JwtUtil;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import java.io.IOException;
import java.time.LocalDateTime;

@Component
@RequiredArgsConstructor
public class OAuth2SuccessHandler extends SimpleUrlAuthenticationSuccessHandler {

    private final JwtUtil jwtUtil;
    private final RefreshTokenRepository refreshTokenRepository;

    @Value("${jwt.refresh-expiration}")
    private long refreshExpiration;

    @Override
    @Transactional
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication authentication) throws IOException {
        MemberPrincipal memberPrincipal = (MemberPrincipal) authentication.getPrincipal();

        Long memberId = memberPrincipal.getMember().getId();
        String role = memberPrincipal.getMember().getRole().name();

        String accessToken = jwtUtil.generateAccessToken(memberId, role);
        String refreshToken = jwtUtil.generateRefreshToken(memberId, role);

        // Refresh Token 저장 또는 업데이트
        LocalDateTime expiryDate = LocalDateTime.now().plusSeconds(refreshExpiration / 1000);
        RefreshToken tokenEntity = refreshTokenRepository.findByMemberId(memberId)
                .map(token -> {
                    token.updateToken(refreshToken, expiryDate);
                    return token;
                })
                .orElseGet(() -> RefreshToken.builder()
                        .memberId(memberId)
                        .token(refreshToken)
                        .expiryDate(expiryDate)
                        .build());

        refreshTokenRepository.save(tokenEntity);

        // 프론트엔드로 토큰 전달 (쿼리파라미터)
        String redirectUrl = "http://localhost:3000/oauth2/callback"
                + "?accessToken=" + accessToken
                + "&refreshToken=" + refreshToken;

        getRedirectStrategy().sendRedirect(request, response, redirectUrl);
    }
}
