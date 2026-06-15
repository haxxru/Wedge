package com.wedge.backend.domain.member.service;

import com.wedge.backend.domain.member.dto.AuthResponse;
import com.wedge.backend.domain.member.dto.LoginRequest;
import com.wedge.backend.domain.member.dto.SignUpRequest;
import com.wedge.backend.domain.member.entity.Member;
import com.wedge.backend.domain.member.entity.MemberStatus;
import com.wedge.backend.domain.member.entity.Provider;
import com.wedge.backend.domain.member.repository.MemberRepository;
import com.wedge.backend.global.jwt.JwtUtil;
import com.wedge.backend.domain.member.dto.TokenDto;
import com.wedge.backend.domain.member.entity.RefreshToken;
import com.wedge.backend.domain.member.repository.RefreshTokenRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;

@Service
@RequiredArgsConstructor
@Transactional(readOnly = true)
public class AuthService {

    private final MemberRepository memberRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtUtil jwtUtil;
    private final RefreshTokenRepository refreshTokenRepository;

    @Value("${jwt.refresh-expiration}")
    private long refreshExpiration;

    @Transactional
    public void signUp(SignUpRequest request) {
        if (memberRepository.existsByEmail(request.getEmail())) {
            throw new IllegalArgumentException("이미 사용 중인 이메일입니다.");
        }

        Member member = Member.builder()
                .email(request.getEmail())
                .password(passwordEncoder.encode(request.getPassword()))
                .name(request.getName())
                .phone(request.getPhone())
                .role(request.getRole())
                .provider(Provider.LOCAL)
                .build();

        memberRepository.save(member);
    }

    @Transactional
    public TokenDto login(LoginRequest request) {
        Member member = memberRepository.findByEmail(request.getEmail())
                .orElseThrow(() -> new IllegalArgumentException("이메일 또는 비밀번호가 올바르지 않습니다."));

        if (member.getStatus() == MemberStatus.DELETED) {
            throw new IllegalStateException("탈퇴한 회원입니다.");
        }

        if (!passwordEncoder.matches(request.getPassword(), member.getPassword())) {
            throw new IllegalArgumentException("이메일 또는 비밀번호가 올바르지 않습니다.");
        }

        String accessToken = jwtUtil.generateAccessToken(member.getId(), member.getRole().name());
        String refreshToken = jwtUtil.generateRefreshToken(member.getId(), member.getRole().name());

        // Refresh Token 저장 또는 업데이트
        LocalDateTime expiryDate = LocalDateTime.now().plusSeconds(refreshExpiration / 1000);
        RefreshToken tokenEntity = refreshTokenRepository.findByMemberId(member.getId())
                .map(token -> {
                    token.updateToken(refreshToken, expiryDate);
                    return token;
                })
                .orElseGet(() -> RefreshToken.builder()
                        .memberId(member.getId())
                        .token(refreshToken)
                        .expiryDate(expiryDate)
                        .build());

        refreshTokenRepository.save(tokenEntity);

        return new TokenDto(accessToken, refreshToken);
    }

    @Transactional
    public TokenDto reissue(String refreshToken) {
        // 1. 토큰 자체 유효성 검증
        if (!jwtUtil.validateToken(refreshToken)) {
            throw new IllegalArgumentException("유효하지 않은 리프레시 토큰입니다.");
        }

        // 2. DB에서 토큰 조회 및 일치 여부 확인
        RefreshToken tokenEntity = refreshTokenRepository.findByToken(refreshToken)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않거나 무효화된 리프레시 토큰입니다."));

        // 3. 토큰 만료 여부 확인 (DB 기준 만료 시간 체크)
        if (tokenEntity.isExpired()) {
            refreshTokenRepository.delete(tokenEntity);
            throw new IllegalArgumentException("만료된 리프레시 토큰입니다. 다시 로그인해주세요.");
        }

        // 4. 새로운 토큰 쌍 생성 (RTR - Refresh Token Rotation)
        Long memberId = tokenEntity.getMemberId();
        Member member = memberRepository.findById(memberId)
                .orElseThrow(() -> new IllegalArgumentException("존재하지 않는 회원입니다."));

        String newAccessToken = jwtUtil.generateAccessToken(memberId, member.getRole().name());
        String newRefreshToken = jwtUtil.generateRefreshToken(memberId, member.getRole().name());

        // 5. DB 갱신
        LocalDateTime expiryDate = LocalDateTime.now().plusSeconds(refreshExpiration / 1000);
        tokenEntity.updateToken(newRefreshToken, expiryDate);
        refreshTokenRepository.save(tokenEntity);

        return new TokenDto(newAccessToken, newRefreshToken);
    }

    @Transactional
    public void logout(Long memberId) {
        refreshTokenRepository.deleteByMemberId(memberId);
    }
}
