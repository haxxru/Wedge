package com.wedge.backend.domain.member.service;

import com.wedge.backend.domain.member.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.security.SecureRandom;
import java.time.Duration;

@Service
@RequiredArgsConstructor
public class EmailVerificationService {

    private final JavaMailSender mailSender;
    private final StringRedisTemplate redisTemplate;
    private final MemberRepository memberRepository;

    private static final String PREFIX = "email:verify:";
    private static final Duration TTL = Duration.ofMinutes(5);
    private static final SecureRandom RANDOM = new SecureRandom();

    public void sendCode(String email) {
        if (memberRepository.existsByEmail(email)) {
            throw new IllegalArgumentException("이미 가입된 이메일입니다.");
        }

        String code = String.format("%06d", RANDOM.nextInt(1_000_000));

        redisTemplate.opsForValue().set(PREFIX + email, code, TTL);

        SimpleMailMessage message = new SimpleMailMessage();
        message.setTo(email);
        message.setSubject("[Wedge] 이메일 인증 코드");
        message.setText("인증 코드: " + code + "\n\n5분 이내에 입력해주세요.");
        mailSender.send(message);
    }

    public boolean verify(String email, String code) {
        String stored = redisTemplate.opsForValue().get(PREFIX + email);
        if (stored != null && stored.equals(code)) {
            redisTemplate.delete(PREFIX + email);
            redisTemplate.opsForValue().set(PREFIX + email + ":verified", "true", Duration.ofMinutes(30));
            return true;
        }
        return false;
    }

    public boolean isVerified(String email) {
        return "true".equals(redisTemplate.opsForValue().get(PREFIX + email + ":verified"));
    }

    public void clearVerification(String email) {
        redisTemplate.delete(PREFIX + email + ":verified");
    }
}
