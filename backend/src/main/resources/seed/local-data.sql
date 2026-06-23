-- =============================================
-- 카테고리 (id 고정)
-- =============================================
INSERT IGNORE INTO categories (id, name) VALUES (1,  '웨딩 사진작가');
INSERT IGNORE INTO categories (id, name) VALUES (2,  '웨딩 영상');
INSERT IGNORE INTO categories (id, name) VALUES (3,  '헤어·메이크업');
INSERT IGNORE INTO categories (id, name) VALUES (4,  '웨딩 플로리스트');
INSERT IGNORE INTO categories (id, name) VALUES (5,  '웨딩 플래너');
INSERT IGNORE INTO categories (id, name) VALUES (6,  '주례·혼례사');
INSERT IGNORE INTO categories (id, name) VALUES (7,  '연주·밴드');
INSERT IGNORE INTO categories (id, name) VALUES (8,  '축가');
INSERT IGNORE INTO categories (id, name) VALUES (9,  '사회자');
INSERT IGNORE INTO categories (id, name) VALUES (10, '기타');

-- =============================================
-- 테스트 회원 (CLIENT / FREELANCER)
-- =============================================
INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT
    'test-client@wedge.local',
    '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye',
    '테스트 커플',
    '010-1111-2222',
    'CLIENT',
    'ACTIVE',
    'LOCAL',
    NULL,
    '2026-06-15 12:00:00',
    '2026-06-15 12:00:00'
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'test-client@wedge.local');

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT
    'test-freelancer@wedge.local',
    '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye',
    '테스트 프리랜서',
    '010-3333-4444',
    'FREELANCER',
    'ACTIVE',
    'LOCAL',
    NULL,
    '2026-06-15 12:00:00',
    '2026-06-15 12:00:00'
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'test-freelancer@wedge.local');

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer2@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '김영상', '010-1234-5678', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer2@wedge.local');

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer3@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '이스냅', '010-2345-6789', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer3@wedge.local');

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer4@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '박축가', '010-3456-7890', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer4@wedge.local');

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer5@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '최헤어', '010-4567-8901', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer5@wedge.local');

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer6@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '정플로리스트', '010-5678-9012', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer6@wedge.local');

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer7@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '한사회자', '010-6789-0123', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer7@wedge.local');

-- =============================================
-- 프리랜서 프로필
-- =============================================
INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-freelancer@wedge.local' LIMIT 1),
    1,
    '서울 웨딩 스토리텔러',
    '자연스러운 감성과 세련된 구도로 웨딩 순간을 담는 로컬 테스트 프로필입니다.',
    'Seoul',
    850000,
    6,
    12,
    '2026-06-15 12:00:00',
    '2026-06-15 12:00:00'
WHERE NOT EXISTS (
    SELECT 1 FROM freelancer_profiles
    WHERE member_id = (SELECT id FROM members WHERE email = 'test-freelancer@wedge.local' LIMIT 1)
);

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer2@wedge.local'), 2, '시네마틱 웨딩 영상', '영화같은 웨딩 영상을 제작합니다.', '부산', 800000, 7, 0, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer2@wedge.local'));

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer3@wedge.local'), 1, '감성 웨딩 사진작가', '자연스러운 순간을 담는 감성 사진 전문가입니다.', '서울', 500000, 5, 0, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer3@wedge.local'));

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer4@wedge.local'), 8, '감동적인 웨딩 축가', '풍부한 성량으로 하객들의 마음을 울리는 축가 전문가입니다.', '서울', 300000, 4, 0, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer4@wedge.local'));

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer5@wedge.local'), 3, '헤어·메이크업 아티스트', '청담동 출신 헤어메이크업 전문가입니다.', '서울', 350000, 6, 0, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer5@wedge.local'));

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer6@wedge.local'), 4, '웨딩 플로리스트', '아름다운 꽃장식으로 웨딩 공간을 화사하게 꾸며드립니다.', '경기', 400000, 8, 0, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer6@wedge.local'));

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer7@wedge.local'), 9, '전문 웨딩 사회자', '유머와 감동을 살리는 10년 경력의 웨딩 사회자입니다.', '서울', 500000, 10, 0, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer7@wedge.local'));

-- =============================================
-- 포트폴리오 (R2 이미지 사용)
-- =============================================
INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, created_at, updated_at)
SELECT
    (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'test-freelancer@wedge.local' LIMIT 1) LIMIT 1),
    'https://pub-fedc912f591b44f7b17de6206a872ed7.r2.dev/%EB%8D%94%EB%AF%B8%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%8F%AC%ED%8A%B8%ED%8F%B4%EB%A6%AC%EC%98%A46.png',
    '야외 예식의 부드러운 톤을 담은 포트폴리오 샘플입니다.',
    1,
    '2026-06-15 12:00:00',
    '2026-06-15 12:00:00'
WHERE NOT EXISTS (
    SELECT 1 FROM portfolios
    WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'test-freelancer@wedge.local' LIMIT 1) LIMIT 1)
      AND sort_order = 1
);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, created_at, updated_at)
SELECT
    (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'test-freelancer@wedge.local' LIMIT 1) LIMIT 1),
    'https://pub-fedc912f591b44f7b17de6206a872ed7.r2.dev/%EB%8D%94%EB%AF%B8%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%8F%AC%ED%8A%B8%ED%8F%B4%EB%A6%AC%EC%98%A47.png',
    '실내 예식과 리허설 컷을 가정한 두 번째 포트폴리오 샘플입니다.',
    2,
    '2026-06-15 12:00:00',
    '2026-06-15 12:00:00'
WHERE NOT EXISTS (
    SELECT 1 FROM portfolios
    WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'test-freelancer@wedge.local' LIMIT 1) LIMIT 1)
      AND sort_order = 2
);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, created_at, updated_at)
SELECT
    (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer2@wedge.local') LIMIT 1),
    'https://pub-fedc912f591b44f7b17de6206a872ed7.r2.dev/%EB%8D%94%EB%AF%B8%EC%9D%B4%EB%AF%B8%EC%A7%80/cut_01.png',
    '시네마틱한 감성으로 담은 웨딩 영상 대표 컷입니다.',
    1, NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM portfolios
    WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer2@wedge.local') LIMIT 1)
      AND sort_order = 1
);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, created_at, updated_at)
SELECT
    (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer3@wedge.local') LIMIT 1),
    'https://pub-fedc912f591b44f7b17de6206a872ed7.r2.dev/%EB%8D%94%EB%AF%B8%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%8F%AC%ED%8A%B8%ED%8F%B4%EB%A6%AC%EC%98%A43.png',
    '자연스러운 감성으로 담은 웨딩 스냅 대표 컷입니다.',
    1, NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM portfolios
    WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer3@wedge.local') LIMIT 1)
      AND sort_order = 1
);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, created_at, updated_at)
SELECT
    (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer4@wedge.local') LIMIT 1),
    'https://pub-fedc912f591b44f7b17de6206a872ed7.r2.dev/%EB%8D%94%EB%AF%B8%EC%9D%B4%EB%AF%B8%EC%A7%80/ChatGPT%20Image%202026%EB%85%84%206%EC%9B%94%2019%EC%9D%BC%20%EC%98%A4%ED%9B%84%2004_16_22-01.png',
    '감동적인 축가 무대 현장 사진입니다.',
    1, NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM portfolios
    WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer4@wedge.local') LIMIT 1)
      AND sort_order = 1
);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, created_at, updated_at)
SELECT
    (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer5@wedge.local') LIMIT 1),
    'https://pub-fedc912f591b44f7b17de6206a872ed7.r2.dev/%EB%8D%94%EB%AF%B8%EC%9D%B4%EB%AF%B8%EC%A7%80/ChatGPT%20Image%202026%EB%85%84%206%EC%9B%94%2019%EC%9D%BC%20%EC%98%A4%ED%9B%84%2004_16_22-06.png',
    '신부 헤어 메이크업 완성 컷입니다.',
    1, NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM portfolios
    WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer5@wedge.local') LIMIT 1)
      AND sort_order = 1
);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, created_at, updated_at)
SELECT
    (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer6@wedge.local') LIMIT 1),
    'https://pub-fedc912f591b44f7b17de6206a872ed7.r2.dev/%EB%8D%94%EB%AF%B8%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%8F%AC%ED%8A%B8%ED%8F%B4%EB%A6%AC%EC%98%A45.png',
    '화사한 웨딩 플라워 장식 대표 컷입니다.',
    1, NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM portfolios
    WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer6@wedge.local') LIMIT 1)
      AND sort_order = 1
);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, created_at, updated_at)
SELECT
    (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer7@wedge.local') LIMIT 1),
    'https://pub-fedc912f591b44f7b17de6206a872ed7.r2.dev/%EB%8D%94%EB%AF%B8%EC%9D%B4%EB%AF%B8%EC%A7%80/ChatGPT%20Image%202026%EB%85%84%206%EC%9B%94%2019%EC%9D%BC%20%EC%98%A4%ED%9B%84%2004_16_22-04.png',
    '따뜻한 분위기의 웨딩 사회 진행 현장입니다.',
    1, NOW(), NOW()
WHERE NOT EXISTS (
    SELECT 1 FROM portfolios
    WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer7@wedge.local') LIMIT 1)
      AND sort_order = 1
);

-- =============================================
-- 예약
-- =============================================
INSERT INTO reservations (client_id, freelancer_profile_id, reservation_date, request_message, status, cancel_reason, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local' LIMIT 1),
    (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'test-freelancer@wedge.local' LIMIT 1) LIMIT 1),
    '2026-06-20 14:00:00',
    '웨딩 촬영 상담과 스케줄 조율을 부탁드립니다.',
    'REQUESTED',
    NULL,
    '2026-06-15 12:00:00',
    '2026-06-15 12:00:00'
WHERE NOT EXISTS (
    SELECT 1 FROM reservations
    WHERE client_id = (SELECT id FROM members WHERE email = 'test-client@wedge.local' LIMIT 1)
      AND freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'test-freelancer@wedge.local' LIMIT 1) LIMIT 1)
      AND reservation_date = '2026-06-20 14:00:00'
);

INSERT INTO reservations (client_id, freelancer_profile_id, reservation_date, request_message, status, cancel_reason, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local' LIMIT 1),
    (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'test-freelancer@wedge.local' LIMIT 1) LIMIT 1),
    '2026-06-22 16:30:00',
    '촬영 전 의상과 장소에 대한 사전 점검을 원합니다.',
    'ACCEPTED',
    NULL,
    '2026-06-15 12:00:00',
    '2026-06-15 12:00:00'
WHERE NOT EXISTS (
    SELECT 1 FROM reservations
    WHERE client_id = (SELECT id FROM members WHERE email = 'test-client@wedge.local' LIMIT 1)
      AND freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'test-freelancer@wedge.local' LIMIT 1) LIMIT 1)
      AND reservation_date = '2026-06-22 16:30:00'
);

-- =============================================
-- 추가 프리랜서 10명 (회원 + 프로필)
-- =============================================
INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer8@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '윤플래너', '010-7001-1001', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer8@wedge.local');

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer9@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '강주례', '010-7001-1002', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer9@wedge.local');

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer10@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '임밴드', '010-7001-1003', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer10@wedge.local');

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer11@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '조프리랜서', '010-7001-1004', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer11@wedge.local');

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer12@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '한대전', '010-7001-1005', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer12@wedge.local');

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer13@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '서영상', '010-7001-1006', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer13@wedge.local');

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer14@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '문헤어', '010-7001-1007', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer14@wedge.local');

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer15@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '백플라워', '010-7001-1008', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer15@wedge.local');

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer16@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '노축가', '010-7001-1009', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer16@wedge.local');

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer17@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '길사회자', '010-7001-1010', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer17@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer8@wedge.local'), 5, '토탈 웨딩 플래닝', '예산부터 컨셉, 당일 진행까지 처음부터 끝까지 함께합니다.', '서울', 1200000, 9, 15, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer8@wedge.local'));

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer9@wedge.local'), 6, '품격있는 주례사', '진심이 담긴 주례사로 식장의 분위기를 한층 더 따뜻하게 만들어드립니다.', '서울', 200000, 15, 1, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer9@wedge.local'));

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer10@wedge.local'), 7, '라이브 웨딩 밴드', '현악 4중주부터 풀밴드까지, 예식 분위기에 맞는 라이브 연주를 제공합니다.', '인천', 900000, 6, 12, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer10@wedge.local'));

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer11@wedge.local'), 10, '맞춤형 웨딩 토탈 케어', '기타 분류에 속하는 다양한 웨딩 부가 서비스를 제공합니다.', '서울', 600000, 3, 7, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer11@wedge.local'));

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer12@wedge.local'), 1, '대전 감성 웨딩 포토', '자연광을 활용한 따뜻한 톤의 웨딩 촬영을 전문으로 합니다.', '대전', 450000, 4, 14, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer12@wedge.local'));

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer13@wedge.local'), 2, '광주 시네마틱 웨딩필름', '드라마틱한 색감과 구성으로 영화같은 웨딩 영상을 제작합니다.', '광주', 700000, 5, 9, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer13@wedge.local'));

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer14@wedge.local'), 3, '부산 브라이덜 헤어메이크업', '신부 본연의 분위기를 살리는 자연스러운 메이크업을 지향합니다.', '부산', 320000, 7, 10, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer14@wedge.local'));

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer15@wedge.local'), 4, '제주 플라워 스타일링', '제주의 자연스러운 색감을 살린 웨딩 플라워를 디자인합니다.', '제주', 380000, 5, 6, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer15@wedge.local'));

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer16@wedge.local'), 8, '감미로운 웨딩 축가', '편안하면서도 감동적인 음색으로 식장 분위기를 채워드립니다.', '서울', 280000, 8, 8, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer16@wedge.local'));

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer17@wedge.local'), 9, '센스있는 웨딩 사회', '유연한 진행과 센스있는 멘트로 식장 분위기를 이끌어갑니다.', '경기', 450000, 6, 5, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer17@wedge.local'));

-- 추가 프리랜서 10명 포트폴리오
INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer8@wedge.local') LIMIT 1),
       'https://pub-fedc912f591b44f7b17de6206a872ed7.r2.dev/%EB%8D%94%EB%AF%B8%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%8F%AC%ED%8A%B8%ED%8F%B4%EB%A6%AC%EC%98%A48.png',
       '토탈 플래닝으로 진행한 웨딩 현장 대표 컷입니다.', 1, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer8@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer9@wedge.local') LIMIT 1),
       'https://pub-fedc912f591b44f7b17de6206a872ed7.r2.dev/%EB%8D%94%EB%AF%B8%EC%9D%B4%EB%AF%B8%EC%A7%80/ChatGPT%20Image%202026%EB%85%84%206%EC%9B%94%2019%EC%9D%BC%20%EC%98%A4%ED%9B%84%2004_16_22-07.png',
       '따뜻한 주례사로 감동을 드린 현장입니다.', 1, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer9@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer10@wedge.local') LIMIT 1),
       'https://pub-fedc912f591b44f7b17de6206a872ed7.r2.dev/%EB%8D%94%EB%AF%B8%EC%9D%B4%EB%AF%B8%EC%A7%80/cut_09.png',
       '라이브 밴드 연주 현장 대표 컷입니다.', 1, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer10@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer11@wedge.local') LIMIT 1),
       'https://pub-fedc912f591b44f7b17de6206a872ed7.r2.dev/%EB%8D%94%EB%AF%B8%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%8F%AC%ED%8A%B8%ED%8F%B4%EB%A6%AC%EC%98%A410.png',
       '토탈 케어 서비스 대표 컷입니다.', 1, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer11@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer12@wedge.local') LIMIT 1),
       'https://pub-fedc912f591b44f7b17de6206a872ed7.r2.dev/%EB%8D%94%EB%AF%B8%EC%9D%B4%EB%AF%B8%EC%A7%80/cut_03.png',
       '대전 야외 예식 웨딩 스냅 대표 컷입니다.', 1, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer12@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer13@wedge.local') LIMIT 1),
       'https://pub-fedc912f591b44f7b17de6206a872ed7.r2.dev/%EB%8D%94%EB%AF%B8%EC%9D%B4%EB%AF%B8%EC%A7%80/cut_06.png',
       '시네마틱 웨딩필름 대표 컷입니다.', 1, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer13@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer14@wedge.local') LIMIT 1),
       'https://pub-fedc912f591b44f7b17de6206a872ed7.r2.dev/%EB%8D%94%EB%AF%B8%EC%9D%B4%EB%AF%B8%EC%A7%80/ChatGPT%20Image%202026%EB%85%84%206%EC%9B%94%2019%EC%9D%BC%20%EC%98%A4%ED%9B%84%2004_16_22-08.png',
       '부산 브라이덜 메이크업 대표 컷입니다.', 1, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer14@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer15@wedge.local') LIMIT 1),
       'https://pub-fedc912f591b44f7b17de6206a872ed7.r2.dev/%EB%8D%94%EB%AF%B8%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%8F%AC%ED%8A%B8%ED%8F%B4%EB%A6%AC%EC%98%A44.png',
       '제주 플라워 스타일링 대표 컷입니다.', 1, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer15@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer16@wedge.local') LIMIT 1),
       'https://pub-fedc912f591b44f7b17de6206a872ed7.r2.dev/%EB%8D%94%EB%AF%B8%EC%9D%B4%EB%AF%B8%EC%A7%80/ChatGPT%20Image%202026%EB%85%84%206%EC%9B%94%2019%EC%9D%BC%20%EC%98%A4%ED%9B%84%2004_16_22-05.png',
       '감미로운 축가 무대 현장입니다.', 1, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer16@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer17@wedge.local') LIMIT 1),
       'https://pub-fedc912f591b44f7b17de6206a872ed7.r2.dev/%EB%8D%94%EB%AF%B8%EC%9D%B4%EB%AF%B8%EC%A7%80/cut_12.png',
       '센스있는 웨딩 사회 진행 현장입니다.', 1, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer17@wedge.local') LIMIT 1) AND sort_order = 1);

-- =============================================
-- 기존 프리랜서 찜 수 업데이트 (fallback 정렬 테스트용)
-- =============================================
UPDATE freelancer_profiles SET bookmark_count = 13
WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer4@wedge.local');

UPDATE freelancer_profiles SET bookmark_count = 11
WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer5@wedge.local');

UPDATE freelancer_profiles SET bookmark_count = 4
WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer7@wedge.local');

-- =============================================
-- 리뷰 검증용 클라이언트 추가
-- =============================================
INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'test-client2@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '김신랑', '010-7002-1001', 'CLIENT', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'test-client2@wedge.local');

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'test-client3@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '이신부', '010-7002-1002', 'CLIENT', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'test-client3@wedge.local');

-- =============================================
-- 리뷰 검증용 예약 + 리뷰
-- =============================================
INSERT INTO reservations (client_id, freelancer_profile_id, reservation_date, request_message, status, cancel_reason, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
       (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'test-freelancer@wedge.local') LIMIT 1),
       NOW() - INTERVAL 2 DAY, '[SEED-REVIEW-01]', 'COMPLETED', NULL, NOW() - INTERVAL 2 DAY, NOW() - INTERVAL 2 DAY
WHERE NOT EXISTS (SELECT 1 FROM reservations WHERE request_message = '[SEED-REVIEW-01]');

INSERT INTO reservations (client_id, freelancer_profile_id, reservation_date, request_message, status, cancel_reason, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
       (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'test-freelancer@wedge.local') LIMIT 1),
       NOW() - INTERVAL 6 DAY, '[SEED-REVIEW-02]', 'COMPLETED', NULL, NOW() - INTERVAL 6 DAY, NOW() - INTERVAL 6 DAY
WHERE NOT EXISTS (SELECT 1 FROM reservations WHERE request_message = '[SEED-REVIEW-02]');

INSERT INTO reservations (client_id, freelancer_profile_id, reservation_date, request_message, status, cancel_reason, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
       (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'test-freelancer@wedge.local') LIMIT 1),
       NOW() - INTERVAL 11 DAY, '[SEED-REVIEW-03]', 'COMPLETED', NULL, NOW() - INTERVAL 11 DAY, NOW() - INTERVAL 11 DAY
WHERE NOT EXISTS (SELECT 1 FROM reservations WHERE request_message = '[SEED-REVIEW-03]');

INSERT INTO reservations (client_id, freelancer_profile_id, reservation_date, request_message, status, cancel_reason, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
       (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'test-freelancer@wedge.local') LIMIT 1),
       NOW() - INTERVAL 18 DAY, '[SEED-REVIEW-04]', 'COMPLETED', NULL, NOW() - INTERVAL 18 DAY, NOW() - INTERVAL 18 DAY
WHERE NOT EXISTS (SELECT 1 FROM reservations WHERE request_message = '[SEED-REVIEW-04]');

INSERT INTO reservations (client_id, freelancer_profile_id, reservation_date, request_message, status, cancel_reason, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
       (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer9@wedge.local') LIMIT 1),
       NOW() - INTERVAL 8 DAY, '[SEED-REVIEW-05]', 'COMPLETED', NULL, NOW() - INTERVAL 8 DAY, NOW() - INTERVAL 8 DAY
WHERE NOT EXISTS (SELECT 1 FROM reservations WHERE request_message = '[SEED-REVIEW-05]');

INSERT INTO reservations (client_id, freelancer_profile_id, reservation_date, request_message, status, cancel_reason, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
       (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer3@wedge.local') LIMIT 1),
       NOW() - INTERVAL 3 DAY, '[SEED-REVIEW-06]', 'COMPLETED', NULL, NOW() - INTERVAL 3 DAY, NOW() - INTERVAL 3 DAY
WHERE NOT EXISTS (SELECT 1 FROM reservations WHERE request_message = '[SEED-REVIEW-06]');

INSERT INTO reservations (client_id, freelancer_profile_id, reservation_date, request_message, status, cancel_reason, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
       (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer3@wedge.local') LIMIT 1),
       NOW() - INTERVAL 9 DAY, '[SEED-REVIEW-07]', 'COMPLETED', NULL, NOW() - INTERVAL 9 DAY, NOW() - INTERVAL 9 DAY
WHERE NOT EXISTS (SELECT 1 FROM reservations WHERE request_message = '[SEED-REVIEW-07]');

INSERT INTO reservations (client_id, freelancer_profile_id, reservation_date, request_message, status, cancel_reason, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
       (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer3@wedge.local') LIMIT 1),
       NOW() - INTERVAL 20 DAY, '[SEED-REVIEW-08]', 'COMPLETED', NULL, NOW() - INTERVAL 20 DAY, NOW() - INTERVAL 20 DAY
WHERE NOT EXISTS (SELECT 1 FROM reservations WHERE request_message = '[SEED-REVIEW-08]');

INSERT INTO reservations (client_id, freelancer_profile_id, reservation_date, request_message, status, cancel_reason, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
       (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer6@wedge.local') LIMIT 1),
       NOW() - INTERVAL 5 DAY, '[SEED-REVIEW-09]', 'COMPLETED', NULL, NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 5 DAY
WHERE NOT EXISTS (SELECT 1 FROM reservations WHERE request_message = '[SEED-REVIEW-09]');

INSERT INTO reservations (client_id, freelancer_profile_id, reservation_date, request_message, status, cancel_reason, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
       (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer6@wedge.local') LIMIT 1),
       NOW() - INTERVAL 14 DAY, '[SEED-REVIEW-10]', 'COMPLETED', NULL, NOW() - INTERVAL 14 DAY, NOW() - INTERVAL 14 DAY
WHERE NOT EXISTS (SELECT 1 FROM reservations WHERE request_message = '[SEED-REVIEW-10]');

INSERT INTO reservations (client_id, freelancer_profile_id, reservation_date, request_message, status, cancel_reason, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
       (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer2@wedge.local') LIMIT 1),
       NOW() - INTERVAL 40 DAY, '[SEED-REVIEW-11]', 'COMPLETED', NULL, NOW() - INTERVAL 40 DAY, NOW() - INTERVAL 40 DAY
WHERE NOT EXISTS (SELECT 1 FROM reservations WHERE request_message = '[SEED-REVIEW-11]');

INSERT INTO reservations (client_id, freelancer_profile_id, reservation_date, request_message, status, cancel_reason, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
       (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer2@wedge.local') LIMIT 1),
       NOW() - INTERVAL 55 DAY, '[SEED-REVIEW-12]', 'COMPLETED', NULL, NOW() - INTERVAL 55 DAY, NOW() - INTERVAL 55 DAY
WHERE NOT EXISTS (SELECT 1 FROM reservations WHERE request_message = '[SEED-REVIEW-12]');

INSERT INTO reviews (client_id, freelancer_profile_id, reservation_id, rating, content, created_at, updated_at)
SELECT r.client_id, r.freelancer_profile_id, r.id, 5, '사진도 너무 예쁘고 분위기도 편안하게 잘 이끌어주셔서 정말 만족스러웠어요.', r.reservation_date, r.reservation_date
FROM reservations r WHERE r.request_message = '[SEED-REVIEW-01]'
                      AND NOT EXISTS (SELECT 1 FROM reviews rv WHERE rv.reservation_id = r.id);

INSERT INTO reviews (client_id, freelancer_profile_id, reservation_id, rating, content, created_at, updated_at)
SELECT r.client_id, r.freelancer_profile_id, r.id, 5, '디테일 하나하나 꼼꼼하게 신경써주셔서 감사했습니다. 추천드려요.', r.reservation_date, r.reservation_date
FROM reservations r WHERE r.request_message = '[SEED-REVIEW-02]'
                      AND NOT EXISTS (SELECT 1 FROM reviews rv WHERE rv.reservation_id = r.id);

INSERT INTO reviews (client_id, freelancer_profile_id, reservation_id, rating, content, created_at, updated_at)
SELECT r.client_id, r.freelancer_profile_id, r.id, 4, '전반적으로 만족했지만 일정 조율이 조금 늦어진 점은 아쉬웠어요.', r.reservation_date, r.reservation_date
FROM reservations r WHERE r.request_message = '[SEED-REVIEW-03]'
                      AND NOT EXISTS (SELECT 1 FROM reviews rv WHERE rv.reservation_id = r.id);

INSERT INTO reviews (client_id, freelancer_profile_id, reservation_id, rating, content, created_at, updated_at)
SELECT r.client_id, r.freelancer_profile_id, r.id, 5, '신랑 신부 모두 너무 만족했습니다. 친구들에게도 소개하고 싶어요.', r.reservation_date, r.reservation_date
FROM reservations r WHERE r.request_message = '[SEED-REVIEW-04]'
                      AND NOT EXISTS (SELECT 1 FROM reviews rv WHERE rv.reservation_id = r.id);

INSERT INTO reviews (client_id, freelancer_profile_id, reservation_id, rating, content, created_at, updated_at)
SELECT r.client_id, r.freelancer_profile_id, r.id, 5, '따뜻한 주례사 덕분에 하객분들이 많이 감동받으셨다고 하더라고요.', r.reservation_date, r.reservation_date
FROM reservations r WHERE r.request_message = '[SEED-REVIEW-05]'
                      AND NOT EXISTS (SELECT 1 FROM reviews rv WHERE rv.reservation_id = r.id);

INSERT INTO reviews (client_id, freelancer_profile_id, reservation_id, rating, content, created_at, updated_at)
SELECT r.client_id, r.freelancer_profile_id, r.id, 5, '자연스러운 사진 톤이 정말 마음에 들었어요. 다음에도 또 부탁드리고 싶습니다.', r.reservation_date, r.reservation_date
FROM reservations r WHERE r.request_message = '[SEED-REVIEW-06]'
                      AND NOT EXISTS (SELECT 1 FROM reviews rv WHERE rv.reservation_id = r.id);

INSERT INTO reviews (client_id, freelancer_profile_id, reservation_id, rating, content, created_at, updated_at)
SELECT r.client_id, r.freelancer_profile_id, r.id, 4, '결과물은 만족스러웠지만 보정본 전달이 예상보다 늦었습니다.', r.reservation_date, r.reservation_date
FROM reservations r WHERE r.request_message = '[SEED-REVIEW-07]'
                      AND NOT EXISTS (SELECT 1 FROM reviews rv WHERE rv.reservation_id = r.id);

INSERT INTO reviews (client_id, freelancer_profile_id, reservation_id, rating, content, created_at, updated_at)
SELECT r.client_id, r.freelancer_profile_id, r.id, 5, '촬영 내내 편하게 리드해주셔서 어색하지 않게 잘 찍을 수 있었어요.', r.reservation_date, r.reservation_date
FROM reservations r WHERE r.request_message = '[SEED-REVIEW-08]'
                      AND NOT EXISTS (SELECT 1 FROM reviews rv WHERE rv.reservation_id = r.id);

INSERT INTO reviews (client_id, freelancer_profile_id, reservation_id, rating, content, created_at, updated_at)
SELECT r.client_id, r.freelancer_profile_id, r.id, 5, '꽃 장식이 정말 화사해서 사진이 훨씬 예쁘게 나왔어요. 감사합니다.', r.reservation_date, r.reservation_date
FROM reservations r WHERE r.request_message = '[SEED-REVIEW-09]'
                      AND NOT EXISTS (SELECT 1 FROM reviews rv WHERE rv.reservation_id = r.id);

INSERT INTO reviews (client_id, freelancer_profile_id, reservation_id, rating, content, created_at, updated_at)
SELECT r.client_id, r.freelancer_profile_id, r.id, 4, '색감 조합이 예뻤어요. 다만 설치 시간이 조금 빠듯했습니다.', r.reservation_date, r.reservation_date
FROM reservations r WHERE r.request_message = '[SEED-REVIEW-10]'
                      AND NOT EXISTS (SELECT 1 FROM reviews rv WHERE rv.reservation_id = r.id);

INSERT INTO reviews (client_id, freelancer_profile_id, reservation_id, rating, content, created_at, updated_at)
SELECT r.client_id, r.freelancer_profile_id, r.id, 4, '영상미는 좋았는데 편집본 수정 요청 반영이 다소 더뎠어요.', r.reservation_date, r.reservation_date
FROM reservations r WHERE r.request_message = '[SEED-REVIEW-11]'
                      AND NOT EXISTS (SELECT 1 FROM reviews rv WHERE rv.reservation_id = r.id);

INSERT INTO reviews (client_id, freelancer_profile_id, reservation_id, rating, content, created_at, updated_at)
SELECT r.client_id, r.freelancer_profile_id, r.id, 5, '전체적인 톤 앤 매너가 좋았습니다. 만족스러운 결과물이었어요.', r.reservation_date, r.reservation_date
FROM reservations r WHERE r.request_message = '[SEED-REVIEW-12]'
                      AND NOT EXISTS (SELECT 1 FROM reviews rv WHERE rv.reservation_id = r.id);

-- =============================================
-- 커뮤니티 게시글 더미 데이터
-- =============================================

-- 웨딩 후기 (WEDDING_REVIEW)
INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '드디어 결혼했어요! 웨딩 스냅 후기 남깁니다 🌿',
    '안녕하세요! 지난주에 드디어 결혼식을 올렸습니다. 웨지에서 사진작가 분을 찾아서 진행했는데 너무 만족스러워서 후기 남겨요. 야외 예식이라 날씨 걱정을 많이 했는데 작가님이 자연광을 너무 잘 활용하셔서 사진이 정말 영화같이 나왔어요. 계약 전에 포트폴리오를 꼼꼼히 보고 선택했는데 실제 결과물도 포트폴리오 그대로였습니다. 스몰 웨딩 준비하시는 분들께 꼭 추천드려요!',
    'WEDDING_REVIEW',
    'https://pub-fedc912f591b44f7b17de6206a872ed7.r2.dev/%EB%8D%94%EB%AF%B8%EC%9D%B4%EB%AF%B8%EC%A7%80/cut_01.png',
    false,
    NOW() - INTERVAL 2 DAY,
    NOW() - INTERVAL 2 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '드디어 결혼했어요! 웨딩 스냅 후기 남깁니다 🌿');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '헤어메이크업 후기 — 웨지로 찾은 아티스트 강추합니다',
    '결혼 준비하면서 헤어메이크업 업체 찾는 게 제일 힘들었는데, 웨지에서 포트폴리오 보고 연락드린 분이 대박이었어요. 리허설부터 당일까지 꼼꼼하게 챙겨주셨고, 제 얼굴형에 맞게 스타일을 조율해주셔서 너무 자연스럽게 나왔습니다. 가격도 웨딩홀 패키지보다 훨씬 합리적이었어요. 다음에 돌잔치 있으면 또 연락드릴 것 같아요 😊',
    'WEDDING_REVIEW',
    'https://pub-fedc912f591b44f7b17de6206a872ed7.r2.dev/%EB%8D%94%EB%AF%B8%EC%9D%B4%EB%AF%B8%EC%A7%80/ChatGPT%20Image%202026%EB%85%84%206%EC%9B%94%2019%EC%9D%BC%20%EC%98%A4%ED%9B%84%2004_16_22-01.png',
    false,
    NOW() - INTERVAL 4 DAY,
    NOW() - INTERVAL 4 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '헤어메이크업 후기 — 웨지로 찾은 아티스트 강추합니다');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '웨딩 플로리스트 후기 — 부케가 진짜 너무 예뻤어요',
    '꽃을 정말 좋아해서 부케에 많이 신경 썼는데, 웨지에서 찾은 플로리스트 분이 제 취향을 너무 잘 파악해주셨어요. 화이트 계열에 그린을 섞은 내추럴 스타일로 만들어주셨는데 드레스랑 너무 잘 어울렸고 하객분들도 다들 어디서 했냐고 물어봤어요. 설치 시간이 조금 빠듯하긴 했지만 결과물은 완벽했습니다. 제단 장식도 같이 맡겼는데 예식장 분위기가 완전히 달라졌어요!',
    'WEDDING_REVIEW',
    'https://pub-fedc912f591b44f7b17de6206a872ed7.r2.dev/%EB%8D%94%EB%AF%B8%EC%9D%B4%EB%AF%B8%EC%A7%80/%ED%8F%AC%ED%8A%B8%ED%8F%B4%EB%A6%AC%EC%98%A41.png',
    false,
    NOW() - INTERVAL 7 DAY,
    NOW() - INTERVAL 7 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '웨딩 플로리스트 후기 — 부케가 진짜 너무 예뻤어요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '스몰 웨딩 사회자 후기 — 분위기 완전히 살려주셨어요',
    '하객이 50명 남짓한 소규모 결혼식이라 사회자가 필요할까 고민했는데, 웨지에서 프리랜서 사회자 분을 섭외했더니 진짜 탁월한 선택이었어요. 딱딱하지 않고 가족 분위기에 맞게 진행해주셔서 모두가 편안하게 즐길 수 있었어요. 진행 중간에 신랑 신부 깜짝 편지 낭독 코너도 제안해주셔서 하객분들이 감동받으셨어요. 패키지 사회자랑은 차원이 달랐습니다.',
    'WEDDING_REVIEW',
    null,
    false,
    NOW() - INTERVAL 10 DAY,
    NOW() - INTERVAL 10 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '스몰 웨딩 사회자 후기 — 분위기 완전히 살려주셨어요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '웨딩 영상 후기 — 시네마틱 영상 진짜 눈물 났어요',
    '결혼식 당일엔 너무 정신없어서 기억이 잘 안 나는데 영상 받고 나서 처음으로 제 결혼식을 제대로 봤어요. 드론 샷부터 클로즈업까지 너무 감성적으로 편집해주셔서 보는 내내 눈물이 났습니다. 편집본 수정 요청도 빠르게 반영해주셨고, 색보정도 예식장 조명을 완전히 살려내셨어요. 친구들한테 이 영상 보여줬더니 다들 어디서 했냐고 물어봤어요.',
    'WEDDING_REVIEW',
    'https://pub-fedc912f591b44f7b17de6206a872ed7.r2.dev/%EB%8D%94%EB%AF%B8%EC%9D%B4%EB%AF%B8%EC%A7%80/cut_07.png',
    false,
    NOW() - INTERVAL 14 DAY,
    NOW() - INTERVAL 14 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '웨딩 영상 후기 — 시네마틱 영상 진짜 눈물 났어요');

-- 꿀팁 (TIP)
INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '웨딩 준비 타임라인 — 이 순서대로 하면 덜 힘들어요',
    'D-12개월: 예식장, 스드메 계약 / D-9개월: 청첩장 디자인 / D-6개월: 한복, 예물 / D-3개월: 리허설 메이크업, 사진작가 컨셉 미팅 / D-1개월: 최종 점검. 저는 사진작가를 너무 늦게 알아봐서 원하는 분을 못 구할 뻔했어요. 특히 스냅, 영상은 최소 6개월 전에 예약하세요. 인기 있는 분들은 1년치가 이미 마감인 경우도 많아요. 웨지 같은 플랫폼에서 미리 포트폴리오 보면서 후보 리스트 만들어두는 게 진짜 도움됐어요!',
    'TIP', null, false, NOW() - INTERVAL 3 DAY, NOW() - INTERVAL 3 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '웨딩 준비 타임라인 — 이 순서대로 하면 덜 힘들어요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '프리랜서 웨딩 업체 고르는 꿀팁 5가지',
    '1. 포트폴리오는 최근 6개월 이내 작업 위주로 보세요. 오래된 것만 올려둔 경우 실력이 달라졌을 수 있어요. 2. 미팅 전에 질문 리스트를 꼭 만들어 가세요. 가격, 수정 횟수, 납기일은 반드시 확인! 3. 계약서는 꼼꼼히 읽고 위약금 조항 체크. 4. 리허설 메이크업은 필수예요. 당일 스타일이 내 얼굴에 맞는지 꼭 먼저 확인하세요. 5. 후기보다 포트폴리오 스타일이 내 취향인지가 더 중요해요. 리뷰 좋아도 스타일이 안 맞으면 소용없어요.',
    'TIP', null, false, NOW() - INTERVAL 5 DAY, NOW() - INTERVAL 5 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '프리랜서 웨딩 업체 고르는 꿀팁 5가지');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '웨딩 예산 아끼는 현실적인 방법들',
    '1. 스드메 패키지보다 개별 계약이 보통 30% 저렴해요. 번거롭더라도 따로따로 알아보세요. 2. 주중 예식은 주말보다 예식장 대관료가 훨씬 쌉니다. 3. 청첩장은 디지털 청첩장만 해도 충분한 분들에게는 종이 청첩장 생략하면 꽤 절약돼요. 4. 부케는 생화 대신 드라이플라워나 실크플라워로 제작하면 가격이 확 줄어요. 5. 웨딩 촬영 시간대를 오전으로 잡으면 작가 선생님 스케줄이 여유로워서 더 꼼꼼하게 찍어주세요.',
    'TIP', null, false, NOW() - INTERVAL 8 DAY, NOW() - INTERVAL 8 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '웨딩 예산 아끼는 현실적인 방법들');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '웨딩 당일 신부가 꼭 챙겨야 할 것들 체크리스트',
    '[ 가방 속 필수품 ] 비상 약 (소화제, 진통제), 여분 스타킹, 바늘실, 안전핀, 립스틱 (메이크업 아티스트에게 미리 제품 받아두기), 물티슈, 휴대폰 보조배터리. [ 미리 준비할 것 ] 하객 자리 배치표 2부 (진행자용, 예비용), 축가 가사 출력본, 양가 부모님 부케 및 코사지, 답례품 배치 확인. 저는 당일에 스타킹이 올이 풀려서 식은땀 흘렸어요. 여분 스타킹은 진짜 필수입니다!',
    'TIP', null, false, NOW() - INTERVAL 11 DAY, NOW() - INTERVAL 11 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '웨딩 당일 신부가 꼭 챙겨야 할 것들 체크리스트');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '스몰 웨딩 vs 일반 웨딩 — 직접 둘 다 경험한 입장에서',
    '저는 첫 번째 결혼식(...)은 농담이고, 동생이랑 제 결혼식을 다 준비해봤어요. 동생은 200명 대형 웨딩, 저는 60명 스몰 웨딩. 스몰 웨딩 장점: 하객 한 분 한 분과 제대로 이야기 나눌 수 있어요. 식이 훨씬 따뜻하고 친밀해요. 예산도 생각보다 많이 절약됩니다. 단점: 대형 예식장의 화려함은 포기해야 해요. 어른들 설득이 조금 힘들 수 있어요. 결론은 내가 어떤 결혼식을 원하는지가 제일 중요한 것 같아요.',
    'TIP', null, false, NOW() - INTERVAL 15 DAY, NOW() - INTERVAL 15 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '스몰 웨딩 vs 일반 웨딩 — 직접 둘 다 경험한 입장에서');

-- =============================================
-- 구인글 더미 데이터 (카테고리별 10개, 이미지 각각 다름)
-- =============================================

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '가을 야외 웨딩 스냅 작가님 구해요',
    '11월 초 경기도 야외 가든홀에서 결혼합니다. 자연스러운 빛 활용을 잘 하시는 작가님을 찾고 있어요. 보정 톤은 화사하고 따뜻한 느낌을 선호합니다.',
    1,
    1300000,
    '2026-09-12',
    'OPEN',
    '서울',
    'https://picsum.photos/seed/wedge-recruit-1/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '가을 야외 웨딩 스냅 작가님 구해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '본식 스냅 작가님 찾습니다 (서울 강남)',
    '강남 소규모 웨딩홀에서 진행하는 본식입니다. 인물 중심으로 자연스럽게 담아주시는 스타일을 원해요. 원본 포함 여부도 알려주세요.',
    1,
    1325000,
    '2026-09-26',
    'OPEN',
    '경기',
    'https://picsum.photos/seed/wedge-recruit-2/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '본식 스냅 작가님 찾습니다 (서울 강남)');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '부산 해변 웨딩 사진 작가 섭외 문의',
    '부산 해운대 인근 야외 예식장에서 결혼합니다. 노을 시간대 촬영 경험 있으신 작가님이면 좋겠어요.',
    1,
    1350000,
    '2026-10-03',
    'OPEN',
    '인천',
    'https://picsum.photos/seed/wedge-recruit-3/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '부산 해변 웨딩 사진 작가 섭외 문의');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '스튜디오 촬영 포함 웨딩 스냅 구합니다',
    '본식 전 스튜디오 촬영과 본식 당일 스냅을 함께 진행해주실 작가님 찾습니다. 패키지 견적 부탁드려요.',
    1,
    1375000,
    '2026-10-17',
    'OPEN',
    '부산',
    'https://picsum.photos/seed/wedge-recruit-4/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '스튜디오 촬영 포함 웨딩 스냅 구합니다');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '감성적인 흑백 톤 선호하는 신부예요',
    '결혼식 사진을 너무 화려하지 않게, 차분한 흑백·세피아 톤으로 남기고 싶어요. 비슷한 작업물 있으신 분 연락주세요.',
    1,
    1400000,
    '2026-10-31',
    'OPEN',
    '대전',
    'https://picsum.photos/seed/wedge-recruit-5/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '감성적인 흑백 톤 선호하는 신부예요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '제주도 소규모 웨딩 촬영 가능하신 분',
    '제주에서 가족과 가까운 지인들만 모시고 작게 진행할 예정입니다. 출장 가능하신 작가님 환영합니다.',
    1,
    1425000,
    '2026-11-07',
    'OPEN',
    '대구',
    'https://picsum.photos/seed/wedge-recruit-6/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '제주도 소규모 웨딩 촬영 가능하신 분');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '겨울 웨딩 스냅, 실내 조명 잘 살리는 분',
    '12월 초 호텔 웨딩홀에서 진행됩니다. 실내 저조도 환경에서도 인물이 또렷하게 나오는 스타일 선호해요.',
    1,
    1450000,
    '2026-11-21',
    'OPEN',
    '광주',
    'https://picsum.photos/seed/wedge-recruit-7/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '겨울 웨딩 스냅, 실내 조명 잘 살리는 분');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '원판 + 스냅 동시 진행 가능하신 작가님',
    '본식 원판 촬영과 스냅을 동시에 소화하실 수 있는 팀을 찾고 있습니다. 보조 작가 동반 가능하신 분 우대합니다.',
    1,
    1475000,
    '2026-12-05',
    'OPEN',
    '제주',
    'https://picsum.photos/seed/wedge-recruit-8/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '원판 + 스냅 동시 진행 가능하신 작가님');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '대구 지역 웨딩 사진작가 추천 부탁드려요',
    '대구 시내 웨딩홀에서 12월 중순 결혼합니다. 견적과 포트폴리오 먼저 보내주시면 검토 후 연락드릴게요.',
    1,
    1500000,
    '2026-12-19',
    'OPEN',
    '수원',
    'https://picsum.photos/seed/wedge-recruit-9/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '대구 지역 웨딩 사진작가 추천 부탁드려요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '신랑신부 사전 미팅 가능한 작가님 선호',
    '촬영 전에 한번 만나서 컨셉 이야기 나눌 수 있는 분이면 더 좋겠습니다. 자연광 활용 잘하시는 분 찾아요.',
    1,
    1525000,
    '2026-12-26',
    'OPEN',
    '일산',
    'https://picsum.photos/seed/wedge-recruit-10/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '신랑신부 사전 미팅 가능한 작가님 선호');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '본식 영상 촬영팀 구합니다 (서울)',
    '11월 셋째 주 서울 소규모 웨딩홀에서 결혼합니다. 하이라이트 영상과 풀버전 모두 필요해요.',
    2,
    1500000,
    '2026-09-12',
    'OPEN',
    '서울',
    'https://picsum.photos/seed/wedge-recruit-11/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '본식 영상 촬영팀 구합니다 (서울)');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '시네마틱 웨딩 영상 제작자 찾아요',
    '드론 촬영 가능하신 팀이면 더 좋겠습니다. 색감은 영화 같은 따뜻한 톤을 원해요.',
    2,
    1525000,
    '2026-09-26',
    'OPEN',
    '경기',
    'https://picsum.photos/seed/wedge-recruit-12/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '시네마틱 웨딩 영상 제작자 찾아요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '경기도 야외 웨딩 영상 촬영 문의',
    '야외 정원 웨딩이라 자연광 활용에 익숙한 팀을 찾고 있습니다. 편집 기간도 함께 알려주세요.',
    2,
    1550000,
    '2026-10-03',
    'OPEN',
    '인천',
    'https://picsum.photos/seed/wedge-recruit-13/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '경기도 야외 웨딩 영상 촬영 문의');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '짧은 하이라이트 영상만 필요해요',
    '예산이 넉넉하지 않아 3분 내외 하이라이트 영상만 부탁드리고 싶습니다. 합리적인 견적 부탁드려요.',
    2,
    1575000,
    '2026-10-17',
    'OPEN',
    '부산',
    'https://picsum.photos/seed/wedge-recruit-14/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '짧은 하이라이트 영상만 필요해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '인천 지역 출장 가능한 영상팀 구해요',
    '인천 웨딩홀에서 12월 초 식을 진행합니다. 출장비 포함 견적 알려주세요.',
    2,
    1600000,
    '2026-10-31',
    'OPEN',
    '대전',
    'https://picsum.photos/seed/wedge-recruit-15/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '인천 지역 출장 가능한 영상팀 구해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '식전 인터뷰 영상도 함께 찍어주실 분',
    '본식 영상과 별도로 신랑신부 인터뷰 영상도 부탁드리고 싶습니다.',
    2,
    1625000,
    '2026-11-07',
    'OPEN',
    '대구',
    'https://picsum.photos/seed/wedge-recruit-16/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '식전 인터뷰 영상도 함께 찍어주실 분');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '부산 본식 영상 촬영팀 섭외합니다',
    '부산 호텔 웨딩홀에서 진행하며, 빠른 편집본 전달이 가능하신 팀을 우대합니다.',
    2,
    1650000,
    '2026-11-21',
    'OPEN',
    '광주',
    'https://picsum.photos/seed/wedge-recruit-17/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '부산 본식 영상 촬영팀 섭외합니다');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '드론 항공 촬영 포함 패키지 찾아요',
    '야외 결혼식이라 드론 항공샷이 꼭 포함됐으면 좋겠습니다.',
    2,
    1675000,
    '2026-12-05',
    'OPEN',
    '제주',
    'https://picsum.photos/seed/wedge-recruit-18/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '드론 항공 촬영 포함 패키지 찾아요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '저예산으로 가능한 영상팀 있을까요',
    '최소한의 구성으로 본식 기록 영상만 남기고 싶습니다.',
    2,
    1700000,
    '2026-12-19',
    'OPEN',
    '수원',
    'https://picsum.photos/seed/wedge-recruit-19/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '저예산으로 가능한 영상팀 있을까요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '제주 웨딩 영상 촬영 가능하신 분',
    '제주에서 작게 진행하는 결혼식입니다. 출장 가능하신 영상팀 연락 부탁드려요.',
    2,
    1725000,
    '2026-12-26',
    'OPEN',
    '일산',
    'https://picsum.photos/seed/wedge-recruit-20/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '제주 웨딩 영상 촬영 가능하신 분');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '신부 헤어·메이크업 전문가 찾습니다',
    '당일 자연스럽고 화사한 스타일을 원합니다. 리허설 메이크업도 가능하신가요?',
    3,
    900000,
    '2026-09-12',
    'OPEN',
    '서울',
    'https://picsum.photos/seed/wedge-recruit-21/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '신부 헤어·메이크업 전문가 찾습니다');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '혼주 메이크업도 가능하신 분 우대',
    '신부 메이크업과 함께 어머니 두 분 메이크업도 부탁드리고 싶어요.',
    3,
    925000,
    '2026-09-26',
    'OPEN',
    '경기',
    'https://picsum.photos/seed/wedge-recruit-22/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '혼주 메이크업도 가능하신 분 우대');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '서울 청담동 인근 헤메 아티스트 구해요',
    '청담 인근에서 출장 가능하신 분 찾습니다. 가격표 먼저 보내주세요.',
    3,
    950000,
    '2026-10-03',
    'OPEN',
    '인천',
    'https://picsum.photos/seed/wedge-recruit-23/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '서울 청담동 인근 헤메 아티스트 구해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '유지력 좋은 메이크업 해주실 분',
    '예식이 길어서 6시간 이상 유지되는 메이크업이 필요합니다.',
    3,
    975000,
    '2026-10-17',
    'OPEN',
    '부산',
    'https://picsum.photos/seed/wedge-recruit-24/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '유지력 좋은 메이크업 해주실 분');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '내추럴 톤 선호하는 신부예요',
    '진한 메이크업보다는 본판 살리는 자연스러운 스타일을 선호해요.',
    3,
    1000000,
    '2026-10-31',
    'OPEN',
    '대전',
    'https://picsum.photos/seed/wedge-recruit-25/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '내추럴 톤 선호하는 신부예요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '부산 출장 헤메 아티스트 문의',
    '부산 웨딩홀로 출장 가능하신 분 계신가요? 일정 맞으면 바로 예약하고 싶어요.',
    3,
    1025000,
    '2026-11-07',
    'OPEN',
    '대구',
    'https://picsum.photos/seed/wedge-recruit-26/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '부산 출장 헤메 아티스트 문의');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '리허설 포함 패키지 견적 부탁드려요',
    '본식 전 리허설 메이크업 포함된 패키지로 견적 알려주세요.',
    3,
    1050000,
    '2026-11-21',
    'OPEN',
    '광주',
    'https://picsum.photos/seed/wedge-recruit-27/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '리허설 포함 패키지 견적 부탁드려요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '사진 잘 나오는 메이크업 스타일 원해요',
    '사진 촬영 시 잘 나오는 입체감 있는 메이크업을 원합니다.',
    3,
    1075000,
    '2026-12-05',
    'OPEN',
    '제주',
    'https://picsum.photos/seed/wedge-recruit-28/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '사진 잘 나오는 메이크업 스타일 원해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '오전 일찍 시작 가능하신 분 구해요',
    '예식이 오전 10시라 새벽부터 준비 가능하신 분이어야 해요.',
    3,
    1100000,
    '2026-12-19',
    'OPEN',
    '수원',
    'https://picsum.photos/seed/wedge-recruit-29/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '오전 일찍 시작 가능하신 분 구해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '경기 지역 헤메 아티스트 추천 부탁',
    '경기도 웨딩홀에서 12월 결혼합니다. 추천 부탁드려요.',
    3,
    1125000,
    '2026-12-26',
    'OPEN',
    '일산',
    'https://picsum.photos/seed/wedge-recruit-30/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '경기 지역 헤메 아티스트 추천 부탁');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '부케·버진로드 플로리스트 구합니다',
    '화이트·그린 계열의 내추럴한 무드를 원합니다. 견적 부탁드려요.',
    4,
    700000,
    '2026-09-12',
    'OPEN',
    '서울',
    'https://picsum.photos/seed/wedge-recruit-31/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '부케·버진로드 플로리스트 구합니다');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '가을 분위기 꽃 장식 해주실 분',
    '단풍 컬러를 살린 가을 느낌의 부케를 원해요.',
    4,
    725000,
    '2026-09-26',
    'OPEN',
    '경기',
    'https://picsum.photos/seed/wedge-recruit-32/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '가을 분위기 꽃 장식 해주실 분');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '서울 야외 웨딩 꽃장식 문의드려요',
    '야외 정원 웨딩이라 전체적인 플라워 스타일링이 필요합니다.',
    4,
    750000,
    '2026-10-03',
    'OPEN',
    '인천',
    'https://picsum.photos/seed/wedge-recruit-33/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '서울 야외 웨딩 꽃장식 문의드려요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '소규모 결혼식용 부케만 필요해요',
    '예식장 장식 없이 부케만 제작 부탁드리고 싶습니다.',
    4,
    775000,
    '2026-10-17',
    'OPEN',
    '부산',
    'https://picsum.photos/seed/wedge-recruit-34/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '소규모 결혼식용 부케만 필요해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '핑크 톤 로맨틱 부케 원해요',
    '전체적으로 로맨틱하고 화사한 핑크 계열로 부탁드립니다.',
    4,
    800000,
    '2026-10-31',
    'OPEN',
    '대전',
    'https://picsum.photos/seed/wedge-recruit-35/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '핑크 톤 로맨틱 부케 원해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '제단 장식까지 가능하신 플로리스트',
    '부케뿐 아니라 제단과 포토존 장식도 함께 부탁드리고 싶어요.',
    4,
    825000,
    '2026-11-07',
    'OPEN',
    '대구',
    'https://picsum.photos/seed/wedge-recruit-36/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '제단 장식까지 가능하신 플로리스트');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '부산 지역 출장 플로리스트 찾아요',
    '부산 웨딩홀로 출장 가능하신 분 계신가요?',
    4,
    850000,
    '2026-11-21',
    'OPEN',
    '광주',
    'https://picsum.photos/seed/wedge-recruit-37/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '부산 지역 출장 플로리스트 찾아요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '드라이플라워로 제작 가능하신가요',
    '결혼 후에도 보관할 수 있게 드라이플라워 부케를 원합니다.',
    4,
    875000,
    '2026-12-05',
    'OPEN',
    '제주',
    'https://picsum.photos/seed/wedge-recruit-38/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '드라이플라워로 제작 가능하신가요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '저렴하면서 화사한 스타일 찾아요',
    '예산이 크지 않아 실속있는 구성으로 부탁드리고 싶습니다.',
    4,
    900000,
    '2026-12-19',
    'OPEN',
    '수원',
    'https://picsum.photos/seed/wedge-recruit-39/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '저렴하면서 화사한 스타일 찾아요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '대전 지역 웨딩 플로리스트 문의',
    '대전에서 12월 결혼식 진행합니다. 견적 부탁드려요.',
    4,
    925000,
    '2026-12-26',
    'OPEN',
    '일산',
    'https://picsum.photos/seed/wedge-recruit-40/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '대전 지역 웨딩 플로리스트 문의');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '예식 전반 진행 도와주실 플래너 구합니다',
    '업체 컨택부터 당일 진행까지 함께해주실 플래너님을 찾고 있어요.',
    5,
    1300000,
    '2026-09-12',
    'OPEN',
    '서울',
    'https://picsum.photos/seed/wedge-recruit-41/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '예식 전반 진행 도와주실 플래너 구합니다');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '당일 진행만 맡길 플래너 찾아요',
    '준비는 직접 했고 결혼식 당일 진행만 도와주실 분을 구합니다.',
    5,
    1325000,
    '2026-09-26',
    'OPEN',
    '경기',
    'https://picsum.photos/seed/wedge-recruit-42/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '당일 진행만 맡길 플래너 찾아요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '서울 호텔 웨딩 플래너 문의드려요',
    '호텔 웨딩 진행 경험 많으신 플래너님 우대합니다.',
    5,
    1350000,
    '2026-10-03',
    'OPEN',
    '인천',
    'https://picsum.photos/seed/wedge-recruit-43/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '서울 호텔 웨딩 플래너 문의드려요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '소규모 결혼식 전문 플래너 구해요',
    '50명 내외 스몰 웨딩 경험이 많으신 분을 찾고 있습니다.',
    5,
    1375000,
    '2026-10-17',
    'OPEN',
    '부산',
    'https://picsum.photos/seed/wedge-recruit-44/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '소규모 결혼식 전문 플래너 구해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '예산 관리 잘 해주실 플래너 원해요',
    '예산 안에서 합리적으로 업체를 매칭해주실 분을 찾습니다.',
    5,
    1400000,
    '2026-10-31',
    'OPEN',
    '대전',
    'https://picsum.photos/seed/wedge-recruit-45/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '예산 관리 잘 해주실 플래너 원해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '부산 지역 웨딩 플래너 추천 부탁',
    '부산에서 12월 결혼식 진행합니다. 추천 부탁드려요.',
    5,
    1425000,
    '2026-11-07',
    'OPEN',
    '대구',
    'https://picsum.photos/seed/wedge-recruit-46/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '부산 지역 웨딩 플래너 추천 부탁');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '야외 결혼식 진행 경험 있는 분',
    '야외 웨딩 특성상 우천 대비 등 변수 관리에 능숙한 분을 원해요.',
    5,
    1450000,
    '2026-11-21',
    'OPEN',
    '광주',
    'https://picsum.photos/seed/wedge-recruit-47/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '야외 결혼식 진행 경험 있는 분');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '혼주님 응대까지 꼼꼼히 봐주실 분',
    '양가 어르신 응대까지 세심하게 챙겨주실 플래너를 찾습니다.',
    5,
    1475000,
    '2026-12-05',
    'OPEN',
    '제주',
    'https://picsum.photos/seed/wedge-recruit-48/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '혼주님 응대까지 꼼꼼히 봐주실 분');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '전체 일정 짧게 압축해서 진행 가능한가요',
    '결혼식이 두 달밖에 안 남아서 빠르게 준비 도와주실 분이 필요해요.',
    5,
    1500000,
    '2026-12-19',
    'OPEN',
    '수원',
    'https://picsum.photos/seed/wedge-recruit-49/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '전체 일정 짧게 압축해서 진행 가능한가요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '경기 지역 웨딩 플래너 구합니다',
    '경기도 웨딩홀에서 11월 결혼식 예정입니다.',
    5,
    1525000,
    '2026-12-26',
    'OPEN',
    '일산',
    'https://picsum.photos/seed/wedge-recruit-50/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '경기 지역 웨딩 플래너 구합니다');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '예식 주례·혼례사 모십니다',
    '차분하고 진심이 느껴지는 진행을 해주실 분을 찾고 있습니다.',
    6,
    500000,
    '2026-09-12',
    'OPEN',
    '서울',
    'https://picsum.photos/seed/wedge-recruit-51/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '예식 주례·혼례사 모십니다');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '짧고 담백한 주례 선호해요',
    '너무 길지 않게 핵심만 담백하게 말씀해주실 분을 원합니다.',
    6,
    525000,
    '2026-09-26',
    'OPEN',
    '경기',
    'https://picsum.photos/seed/wedge-recruit-52/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '짧고 담백한 주례 선호해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '서울 호텔 웨딩 주례 문의드려요',
    '호텔 웨딩홀에서 11월 결혼식입니다. 경험 있으신 분 우대합니다.',
    6,
    550000,
    '2026-10-03',
    'OPEN',
    '인천',
    'https://picsum.photos/seed/wedge-recruit-53/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '서울 호텔 웨딩 주례 문의드려요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '혼례사 진행 방식으로 부탁드려요',
    '전통적인 혼례사 스타일로 진행해주실 분을 찾고 있습니다.',
    6,
    575000,
    '2026-10-17',
    'OPEN',
    '부산',
    'https://picsum.photos/seed/wedge-recruit-54/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '혼례사 진행 방식으로 부탁드려요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '양가 어르신이 편하게 느낄 진행 원해요',
    '격식보다는 편안한 분위기를 우선으로 생각하고 있습니다.',
    6,
    600000,
    '2026-10-31',
    'OPEN',
    '대전',
    'https://picsum.photos/seed/wedge-recruit-55/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '양가 어르신이 편하게 느낄 진행 원해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '부산 지역 주례 가능하신 분 구해요',
    '부산에서 12월 결혼식 진행합니다.',
    6,
    625000,
    '2026-11-07',
    'OPEN',
    '대구',
    'https://picsum.photos/seed/wedge-recruit-56/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '부산 지역 주례 가능하신 분 구해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '유머 있는 진행 스타일 선호합니다',
    '너무 무겁지 않게 가볍게 웃을 수 있는 멘트도 좋아요.',
    6,
    650000,
    '2026-11-21',
    'OPEN',
    '광주',
    'https://picsum.photos/seed/wedge-recruit-57/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '유머 있는 진행 스타일 선호합니다');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '짧은 시간 내 리허설 가능하신 분',
    '예식 전 짧게 한 번 맞춰볼 수 있는 분이면 좋겠습니다.',
    6,
    675000,
    '2026-12-05',
    'OPEN',
    '제주',
    'https://picsum.photos/seed/wedge-recruit-58/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '짧은 시간 내 리허설 가능하신 분');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '경기 지역 주례사 추천 부탁드려요',
    '경기도 웨딩홀 11월 결혼식입니다. 추천 부탁드려요.',
    6,
    700000,
    '2026-12-19',
    'OPEN',
    '수원',
    'https://picsum.photos/seed/wedge-recruit-59/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '경기 지역 주례사 추천 부탁드려요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '진심이 담긴 주례사 원해요',
    '신랑 신부 이야기를 잘 녹여서 진행해주실 분을 찾습니다.',
    6,
    725000,
    '2026-12-26',
    'OPEN',
    '일산',
    'https://picsum.photos/seed/wedge-recruit-60/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '진심이 담긴 주례사 원해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '축하 연주팀 섭외 원합니다',
    '현악 3중주로 식전 연주와 입장곡을 부탁드리고 싶습니다.',
    7,
    800000,
    '2026-09-12',
    'OPEN',
    '서울',
    'https://picsum.photos/seed/wedge-recruit-61/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '축하 연주팀 섭외 원합니다');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '피아노 단독 연주 가능하신 분',
    '화려하지 않게 피아노 한 대로 차분한 분위기를 원해요.',
    7,
    825000,
    '2026-09-26',
    'OPEN',
    '경기',
    'https://picsum.photos/seed/wedge-recruit-62/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '피아노 단독 연주 가능하신 분');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '서울 호텔 웨딩 연주팀 문의드려요',
    '호텔 웨딩홀 11월 결혼식입니다. 견적 부탁드려요.',
    7,
    850000,
    '2026-10-03',
    'OPEN',
    '인천',
    'https://picsum.photos/seed/wedge-recruit-63/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '서울 호텔 웨딩 연주팀 문의드려요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '식전 연주만 필요해요',
    '본식 전 대기시간에 연주해주실 팀을 찾고 있습니다.',
    7,
    875000,
    '2026-10-17',
    'OPEN',
    '부산',
    'https://picsum.photos/seed/wedge-recruit-64/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '식전 연주만 필요해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '야외 결혼식 음향 포함 연주팀 구해요',
    '야외라 음향 장비까지 함께 준비 가능하신 팀을 원합니다.',
    7,
    900000,
    '2026-10-31',
    'OPEN',
    '대전',
    'https://picsum.photos/seed/wedge-recruit-65/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '야외 결혼식 음향 포함 연주팀 구해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '부산 지역 웨딩 연주팀 추천 부탁',
    '부산에서 12월 결혼식 진행합니다.',
    7,
    925000,
    '2026-11-07',
    'OPEN',
    '대구',
    'https://picsum.photos/seed/wedge-recruit-66/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '부산 지역 웨딩 연주팀 추천 부탁');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '팝송 레퍼토리도 가능하신가요',
    '클래식뿐 아니라 팝송 편곡도 가능하신 팀이면 좋겠습니다.',
    7,
    950000,
    '2026-11-21',
    'OPEN',
    '광주',
    'https://picsum.photos/seed/wedge-recruit-67/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '팝송 레퍼토리도 가능하신가요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '소규모 결혼식용 듀오 연주 구해요',
    '큰 편성보다는 듀오 정도의 단출한 구성을 원합니다.',
    7,
    975000,
    '2026-12-05',
    'OPEN',
    '제주',
    'https://picsum.photos/seed/wedge-recruit-68/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '소규모 결혼식용 듀오 연주 구해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '경기 지역 연주팀 문의드려요',
    '경기도 웨딩홀 11월 결혼식입니다.',
    7,
    1000000,
    '2026-12-19',
    'OPEN',
    '수원',
    'https://picsum.photos/seed/wedge-recruit-69/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '경기 지역 연주팀 문의드려요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '입장부터 퇴장까지 전체 연주 부탁',
    '식 전체를 아우르는 연주 구성으로 견적 부탁드립니다.',
    7,
    1025000,
    '2026-12-26',
    'OPEN',
    '일산',
    'https://picsum.photos/seed/wedge-recruit-70/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '입장부터 퇴장까지 전체 연주 부탁');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '결혼식 축가 가수 구합니다',
    '감동적인 분위기를 살려주실 솔로 가수님을 찾고 있습니다.',
    8,
    600000,
    '2026-09-12',
    'OPEN',
    '서울',
    'https://picsum.photos/seed/wedge-recruit-71/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '결혼식 축가 가수 구합니다');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '듀엣 축가 가능하신 분 찾아요',
    '남녀 듀엣으로 축가 부탁드리고 싶습니다.',
    8,
    625000,
    '2026-09-26',
    'OPEN',
    '경기',
    'https://picsum.photos/seed/wedge-recruit-72/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '듀엣 축가 가능하신 분 찾아요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '서울 호텔 웨딩 축가 문의드려요',
    '호텔 웨딩홀 11월 결혼식입니다. 음원 링크 부탁드려요.',
    8,
    650000,
    '2026-10-03',
    'OPEN',
    '인천',
    'https://picsum.photos/seed/wedge-recruit-73/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '서울 호텔 웨딩 축가 문의드려요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '발라드 곡으로 축가 원해요',
    '잔잔한 발라드 곡으로 분위기를 잡아주실 분을 찾습니다.',
    8,
    675000,
    '2026-10-17',
    'OPEN',
    '부산',
    'https://picsum.photos/seed/wedge-recruit-74/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '발라드 곡으로 축가 원해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '신부가 직접 신랑에게 들려줄 곡 추천도 필요해요',
    '축가 가수님께 곡 추천도 함께 받고 싶습니다.',
    8,
    700000,
    '2026-10-31',
    'OPEN',
    '대전',
    'https://picsum.photos/seed/wedge-recruit-75/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '신부가 직접 신랑에게 들려줄 곡 추천도 필요해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '부산 지역 축가 가수 구해요',
    '부산에서 12월 결혼식 진행합니다.',
    8,
    725000,
    '2026-11-07',
    'OPEN',
    '대구',
    'https://picsum.photos/seed/wedge-recruit-76/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '부산 지역 축가 가수 구해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '라이브 반주 가능하신 분 우대',
    'MR보다는 라이브 악기 반주를 선호합니다.',
    8,
    750000,
    '2026-11-21',
    'OPEN',
    '광주',
    'https://picsum.photos/seed/wedge-recruit-77/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '라이브 반주 가능하신 분 우대');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '짧게 한 곡만 불러주실 분',
    '예식 시간이 짧아 한 곡만 부탁드리고 싶습니다.',
    8,
    775000,
    '2026-12-05',
    'OPEN',
    '제주',
    'https://picsum.photos/seed/wedge-recruit-78/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '짧게 한 곡만 불러주실 분');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '경기 지역 축가 가수 추천 부탁',
    '경기도 웨딩홀 11월 결혼식입니다.',
    8,
    800000,
    '2026-12-19',
    'OPEN',
    '수원',
    'https://picsum.photos/seed/wedge-recruit-79/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '경기 지역 축가 가수 추천 부탁');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '감동적인 음색의 가수님을 찾아요',
    '하객분들이 감동받을 수 있는 음색을 가진 분을 원합니다.',
    8,
    825000,
    '2026-12-26',
    'OPEN',
    '일산',
    'https://picsum.photos/seed/wedge-recruit-80/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '감동적인 음색의 가수님을 찾아요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '결혼식 사회자 구합니다',
    '밝고 매끄러운 진행이 가능하신 분을 찾고 있습니다.',
    9,
    400000,
    '2026-09-12',
    'OPEN',
    '서울',
    'https://picsum.photos/seed/wedge-recruit-81/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '결혼식 사회자 구합니다');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '유머 있는 사회자 선호해요',
    '분위기를 살려줄 수 있는 위트있는 진행을 원합니다.',
    9,
    425000,
    '2026-09-26',
    'OPEN',
    '경기',
    'https://picsum.photos/seed/wedge-recruit-82/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '유머 있는 사회자 선호해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '서울 호텔 웨딩 사회자 문의드려요',
    '호텔 웨딩홀 11월 결혼식입니다. 경력 알려주세요.',
    9,
    450000,
    '2026-10-03',
    'OPEN',
    '인천',
    'https://picsum.photos/seed/wedge-recruit-83/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '서울 호텔 웨딩 사회자 문의드려요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '차분한 진행 스타일 원해요',
    '과하지 않게 차분하게 진행해주실 분을 찾고 있습니다.',
    9,
    475000,
    '2026-10-17',
    'OPEN',
    '부산',
    'https://picsum.photos/seed/wedge-recruit-84/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '차분한 진행 스타일 원해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '깜짝 이벤트 코너도 진행 가능하신가요',
    '편지 낭독 같은 깜짝 코너도 자연스럽게 이끌어주실 분이면 좋겠어요.',
    9,
    500000,
    '2026-10-31',
    'OPEN',
    '대전',
    'https://picsum.photos/seed/wedge-recruit-85/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '깜짝 이벤트 코너도 진행 가능하신가요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '부산 지역 사회자 구해요',
    '부산에서 12월 결혼식 진행합니다.',
    9,
    525000,
    '2026-11-07',
    'OPEN',
    '대구',
    'https://picsum.photos/seed/wedge-recruit-86/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '부산 지역 사회자 구해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '양가 소개 멘트 신경써주실 분',
    '양가 부모님 소개를 정중하게 잘 해주실 분을 원합니다.',
    9,
    550000,
    '2026-11-21',
    'OPEN',
    '광주',
    'https://picsum.photos/seed/wedge-recruit-87/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '양가 소개 멘트 신경써주실 분');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '짧은 시간 내 리허설 가능하신 분',
    '예식 전 짧게 동선 맞춰볼 수 있는 분이면 좋겠습니다.',
    9,
    575000,
    '2026-12-05',
    'OPEN',
    '제주',
    'https://picsum.photos/seed/wedge-recruit-88/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '짧은 시간 내 리허설 가능하신 분');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '경기 지역 사회자 추천 부탁드려요',
    '경기도 웨딩홀 11월 결혼식입니다.',
    9,
    600000,
    '2026-12-19',
    'OPEN',
    '수원',
    'https://picsum.photos/seed/wedge-recruit-89/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '경기 지역 사회자 추천 부탁드려요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '사회 진행 경력 영상 있으신 분 우대',
    '이전 진행 영상이나 후기 있으시면 같이 보내주세요.',
    9,
    625000,
    '2026-12-26',
    'OPEN',
    '일산',
    'https://picsum.photos/seed/wedge-recruit-90/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '사회 진행 경력 영상 있으신 분 우대');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '웨딩 관련 기타 서비스 문의드립니다',
    '세부 요청사항은 상담 후 조율하고 싶습니다. 가능한 서비스 범위 알려주세요.',
    10,
    500000,
    '2026-09-12',
    'OPEN',
    '서울',
    'https://picsum.photos/seed/wedge-recruit-91/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '웨딩 관련 기타 서비스 문의드립니다');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '청첩장 디자인 제작 가능하신 분',
    '모바일 청첩장과 종이 청첩장 둘 다 필요합니다.',
    10,
    525000,
    '2026-09-26',
    'OPEN',
    '경기',
    'https://picsum.photos/seed/wedge-recruit-92/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '청첩장 디자인 제작 가능하신 분');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '웨딩카 대여 가능하신 분 구해요',
    '예식장까지 이동할 웨딩카를 찾고 있습니다.',
    10,
    550000,
    '2026-10-03',
    'OPEN',
    '인천',
    'https://picsum.photos/seed/wedge-recruit-93/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '웨딩카 대여 가능하신 분 구해요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '답례품 제작 업체 추천 부탁드려요',
    '소량으로 제작 가능한 답례품 업체를 찾고 있습니다.',
    10,
    575000,
    '2026-10-17',
    'OPEN',
    '부산',
    'https://picsum.photos/seed/wedge-recruit-94/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '답례품 제작 업체 추천 부탁드려요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '캘리그라피 작업 가능하신 분',
    '청첩장과 환영판에 들어갈 캘리그라피를 부탁드리고 싶어요.',
    10,
    600000,
    '2026-10-31',
    'OPEN',
    '대전',
    'https://picsum.photos/seed/wedge-recruit-95/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '캘리그라피 작업 가능하신 분');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '부산 지역 웨딩 소품 대여 문의',
    '포토존 소품을 대여하고 싶습니다. 가능하신가요?',
    10,
    625000,
    '2026-11-07',
    'OPEN',
    '대구',
    'https://picsum.photos/seed/wedge-recruit-96/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '부산 지역 웨딩 소품 대여 문의');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '사진 보정 전문가 구합니다',
    '직접 촬영한 사진을 보정만 맡기고 싶습니다.',
    10,
    650000,
    '2026-11-21',
    'OPEN',
    '광주',
    'https://picsum.photos/seed/wedge-recruit-97/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '사진 보정 전문가 구합니다');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '웨딩 DIY 소품 제작 도와주실 분',
    '포토존용 소품을 직접 만들어볼 예정인데 도와주실 분을 찾습니다.',
    10,
    675000,
    '2026-12-05',
    'OPEN',
    '제주',
    'https://picsum.photos/seed/wedge-recruit-98/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '웨딩 DIY 소품 제작 도와주실 분');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '경기 지역 환영판 제작 문의드려요',
    '예식장 입구에 둘 환영판 제작을 부탁드리고 싶습니다.',
    10,
    700000,
    '2026-12-19',
    'OPEN',
    '수원',
    'https://picsum.photos/seed/wedge-recruit-99/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '경기 지역 환영판 제작 문의드려요');

INSERT INTO recruit_posts (member_id, title, content, category_id, budget, wedding_date, status, region, image_url, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '결혼 준비 전반 컨설팅 가능하신가요',
    '특정 업체보다는 전체적인 컨설팅을 받고 싶습니다.',
    10,
    725000,
    '2026-12-26',
    'OPEN',
    '일산',
    'https://picsum.photos/seed/wedge-recruit-100/900/600',
    NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM recruit_posts WHERE title = '결혼 준비 전반 컨설팅 가능하신가요');

-- =============================================
-- 커뮤니티 게시글 더미 데이터 (타입별 10개, 이미지 각각 다름)
-- =============================================

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '사진작가님 후기 — 야외 예식인데 사진이 너무 잘 나왔어요',
    '야외 예식이라 날씨 걱정을 많이 했는데 작가님이 자연광을 너무 잘 활용해주셔서 사진이 정말 영화처럼 나왔어요. 포트폴리오 그대로 결과물이 나와서 믿고 맡긴 보람이 있었습니다.',
    'WEDDING_REVIEW',
    'https://picsum.photos/seed/wedge-community-1/800/600',
    false,
    NOW() - INTERVAL 20 DAY,
    NOW() - INTERVAL 20 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '사진작가님 후기 — 야외 예식인데 사진이 너무 잘 나왔어요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-freelancer@wedge.local'),
    '헤어메이크업 후기 — 리허설부터 꼼꼼하게 챙겨주셨어요',
    '리허설 메이크업부터 당일까지 제 얼굴형에 맞게 스타일을 조율해주셔서 자연스럽게 잘 나왔어요. 가격도 합리적이었고 다음에 또 부탁드릴 것 같아요.',
    'WEDDING_REVIEW',
    'https://picsum.photos/seed/wedge-community-2/800/600',
    false,
    NOW() - INTERVAL 21 DAY,
    NOW() - INTERVAL 21 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '헤어메이크업 후기 — 리허설부터 꼼꼼하게 챙겨주셨어요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'freelancer2@wedge.local'),
    '플로리스트 후기 — 부케가 진짜 예뻤어요',
    '제 취향을 잘 파악해서 화이트에 그린을 섞은 내추럴한 부케를 만들어주셨어요. 드레스랑 정말 잘 어울려서 하객분들도 많이 물어보셨어요.',
    'WEDDING_REVIEW',
    'https://picsum.photos/seed/wedge-community-3/800/600',
    false,
    NOW() - INTERVAL 22 DAY,
    NOW() - INTERVAL 22 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '플로리스트 후기 — 부케가 진짜 예뻤어요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'freelancer3@wedge.local'),
    '사회자 후기 — 분위기를 정말 잘 살려주셨어요',
    '소규모 결혼식이라 사회자가 필요할까 고민했는데 섭외하고 나니 진짜 좋은 선택이었어요. 가족 같은 분위기로 편안하게 진행해주셨습니다.',
    'WEDDING_REVIEW',
    'https://picsum.photos/seed/wedge-community-4/800/600',
    false,
    NOW() - INTERVAL 23 DAY,
    NOW() - INTERVAL 23 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '사회자 후기 — 분위기를 정말 잘 살려주셨어요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'freelancer4@wedge.local'),
    '웨딩 영상 후기 — 보다가 눈물이 났어요',
    '결혼식 당일엔 정신없어서 기억이 잘 안 났는데 영상으로 다시 보니 너무 감동적이었어요. 드론 샷부터 클로즈업까지 감성적으로 편집해주셨습니다.',
    'WEDDING_REVIEW',
    'https://picsum.photos/seed/wedge-community-5/800/600',
    false,
    NOW() - INTERVAL 24 DAY,
    NOW() - INTERVAL 24 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '웨딩 영상 후기 — 보다가 눈물이 났어요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'freelancer5@wedge.local'),
    '주례사 후기 — 진심이 느껴지는 말씀이었어요',
    '딱딱하지 않고 저희 이야기를 잘 녹여서 말씀해주셔서 하객분들도 다들 좋았다고 하셨어요.',
    'WEDDING_REVIEW',
    'https://picsum.photos/seed/wedge-community-6/800/600',
    false,
    NOW() - INTERVAL 25 DAY,
    NOW() - INTERVAL 25 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '주례사 후기 — 진심이 느껴지는 말씀이었어요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'freelancer6@wedge.local'),
    '웨딩 플래너 후기 — 준비 과정이 훨씬 수월했어요',
    '업체 컨택부터 당일 진행까지 꼼꼼하게 챙겨주셔서 큰 도움이 됐습니다. 예산 관리도 합리적으로 해주셨어요.',
    'WEDDING_REVIEW',
    'https://picsum.photos/seed/wedge-community-7/800/600',
    false,
    NOW() - INTERVAL 26 DAY,
    NOW() - INTERVAL 26 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '웨딩 플래너 후기 — 준비 과정이 훨씬 수월했어요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'freelancer7@wedge.local'),
    '스냅 작가 후기 — 자연스러운 컷이 마음에 들어요',
    '포즈를 잡아주는 느낌보다 자연스러운 순간을 잘 캐치해주시는 스타일이라 만족스러웠습니다.',
    'WEDDING_REVIEW',
    'https://picsum.photos/seed/wedge-community-8/800/600',
    false,
    NOW() - INTERVAL 27 DAY,
    NOW() - INTERVAL 27 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '스냅 작가 후기 — 자연스러운 컷이 마음에 들어요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '축가 후기 — 하객분들이 감동받으셨어요',
    '음색이 좋으셔서 식장 분위기가 한층 더 따뜻해졌어요. 곡 선정도 같이 상의해주셔서 좋았습니다.',
    'WEDDING_REVIEW',
    'https://picsum.photos/seed/wedge-community-9/800/600',
    false,
    NOW() - INTERVAL 28 DAY,
    NOW() - INTERVAL 28 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '축가 후기 — 하객분들이 감동받으셨어요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '연주팀 후기 — 식전 분위기가 완전히 달라졌어요',
    '현악 연주가 있으니 하객분들이 입장할 때부터 분위기가 다르다고 느끼셨대요. 음향도 깔끔했습니다.',
    'WEDDING_REVIEW',
    'https://picsum.photos/seed/wedge-community-10/800/600',
    false,
    NOW() - INTERVAL 29 DAY,
    NOW() - INTERVAL 29 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '연주팀 후기 — 식전 분위기가 완전히 달라졌어요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '웨딩 준비 타임라인 정리해봤어요',
    '예식장과 스드메는 최소 6개월 전에, 청첩장은 3개월 전쯔 준비하시면 덜 급해요. 인기 있는 작가님들은 1년 전에도 마감되는 경우가 많으니 미리 후보를 정해두는 게 좋아요.',
    'TIP',
    'https://picsum.photos/seed/wedge-community-11/800/600',
    false,
    NOW() - INTERVAL 20 DAY,
    NOW() - INTERVAL 20 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '웨딩 준비 타임라인 정리해봤어요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-freelancer@wedge.local'),
    '프리랜서 업체 고를 때 체크할 것들',
    '포트폴리오는 최근 작업 위주로 보시고, 미팅 전에 가격·수정 횟수·납기일을 꼭 질문 리스트로 만들어 가세요. 계약서 위약금 조항도 꼼꼼히 확인하시고요.',
    'TIP',
    'https://picsum.photos/seed/wedge-community-12/800/600',
    false,
    NOW() - INTERVAL 21 DAY,
    NOW() - INTERVAL 21 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '프리랜서 업체 고를 때 체크할 것들');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'freelancer2@wedge.local'),
    '웨딩 예산 아끼는 현실적인 방법',
    '스드메를 개별 계약으로 진행하면 패키지보다 저렴한 경우가 많아요. 주중 예식은 대관료도 저렴하니 고려해볼만 합니다.',
    'TIP',
    'https://picsum.photos/seed/wedge-community-13/800/600',
    false,
    NOW() - INTERVAL 22 DAY,
    NOW() - INTERVAL 22 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '웨딩 예산 아끼는 현실적인 방법');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'freelancer3@wedge.local'),
    '결혼식 당일 신부가 챙기면 좋은 것들',
    '여분 스타킹, 비상약, 립스틱은 꼭 챙기세요. 저는 당일에 스타킹이 풀려서 식은땀 흘렸던 기억이 있어요.',
    'TIP',
    'https://picsum.photos/seed/wedge-community-14/800/600',
    false,
    NOW() - INTERVAL 23 DAY,
    NOW() - INTERVAL 23 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '결혼식 당일 신부가 챙기면 좋은 것들');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'freelancer4@wedge.local'),
    '스몰 웨딩과 일반 웨딩 둘 다 경험해보고 느낀 점',
    '스몰 웨딩은 하객 한 분 한 분과 대화 나눌 수 있어서 더 따뜻했어요. 다만 어른들 설득이 조금 필요했습니다.',
    'TIP',
    'https://picsum.photos/seed/wedge-community-15/800/600',
    false,
    NOW() - INTERVAL 24 DAY,
    NOW() - INTERVAL 24 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '스몰 웨딩과 일반 웨딩 둘 다 경험해보고 느낀 점');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'freelancer5@wedge.local'),
    '청첩장 준비할 때 미리 정해두면 좋은 것',
    '문구와 사진을 먼저 정해두면 디자인 작업이 훨씬 빨라져요. 인쇄 수량은 여유있게 잡는 게 안전합니다.',
    'TIP',
    'https://picsum.photos/seed/wedge-community-16/800/600',
    false,
    NOW() - INTERVAL 25 DAY,
    NOW() - INTERVAL 25 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '청첩장 준비할 때 미리 정해두면 좋은 것');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'freelancer6@wedge.local'),
    '야외 웨딩 우천 대비 어떻게 하셨나요',
    '우천 시 대체 장소를 미리 계약서에 명시해두는 게 마음이 편해요. 텐트나 우산도 미리 챙겨두시는 걸 추천해요.',
    'TIP',
    'https://picsum.photos/seed/wedge-community-17/800/600',
    false,
    NOW() - INTERVAL 26 DAY,
    NOW() - INTERVAL 26 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '야외 웨딩 우천 대비 어떻게 하셨나요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'freelancer7@wedge.local'),
    '헤어메이크업 리허설 꼭 받으세요',
    '당일에 처음 해보면 마음에 안 들어도 바꾸기 어려워요. 리허설로 미리 확인하면 훨씬 안심됩니다.',
    'TIP',
    'https://picsum.photos/seed/wedge-community-18/800/600',
    false,
    NOW() - INTERVAL 27 DAY,
    NOW() - INTERVAL 27 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '헤어메이크업 리허설 꼭 받으세요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '축가 곡 선정할 때 참고했던 기준',
    '너무 빠른 곡보다는 잔잔하면서 가사가 좋은 곡이 분위기에 더 잘 맞았어요. 가수님과 미리 상의하는 걸 추천해요.',
    'TIP',
    'https://picsum.photos/seed/wedge-community-19/800/600',
    false,
    NOW() - INTERVAL 28 DAY,
    NOW() - INTERVAL 28 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '축가 곡 선정할 때 참고했던 기준');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '결혼 준비 스트레스 풀었던 방법',
    '둘이서 짧게라도 데이트하는 시간을 따로 만들어서 결혼 얘기 말고 다른 얘기도 했어요. 환기가 꼭 필요하더라고요.',
    'TIP',
    'https://picsum.photos/seed/wedge-community-20/800/600',
    false,
    NOW() - INTERVAL 29 DAY,
    NOW() - INTERVAL 29 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '결혼 준비 스트레스 풀었던 방법');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client@wedge.local'),
    '결혼 준비 같이 하실 분 구해요',
    '비슷한 시기에 준비하시는 분들과 정보 나누고 싶어서 글 남겨요. 댓글로 편하게 이야기 나눠주세요.',
    'BOARD',
    'https://picsum.photos/seed/wedge-community-21/800/600',
    false,
    NOW() - INTERVAL 20 DAY,
    NOW() - INTERVAL 20 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '결혼 준비 같이 하실 분 구해요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-freelancer@wedge.local'),
    '웨딩 박람회 다녀온 후기 공유합니다',
    '이번 주말 박람회 다녀왔는데 생각보다 볼 게 많았어요. 궁금하신 분들께 정보 공유드려요.',
    'BOARD',
    'https://picsum.photos/seed/wedge-community-22/800/600',
    false,
    NOW() - INTERVAL 21 DAY,
    NOW() - INTERVAL 21 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '웨딩 박람회 다녀온 후기 공유합니다');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'freelancer2@wedge.local'),
    '스드메 가격 비교 정보 나눠요',
    '여러 곳 상담받은 가격대를 정리해봤어요. 비슷하게 알아보시는 분들께 도움 되면 좋겠습니다.',
    'BOARD',
    'https://picsum.photos/seed/wedge-community-23/800/600',
    false,
    NOW() - INTERVAL 22 DAY,
    NOW() - INTERVAL 22 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '스드메 가격 비교 정보 나눠요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'freelancer3@wedge.local'),
    '신혼집 인테리어 고민 같이 나눠요',
    '가전 배치랑 컬러 톤 고르는 게 생각보다 어렵네요. 비슷한 고민 있으신 분들 같이 이야기해요.',
    'BOARD',
    'https://picsum.photos/seed/wedge-community-24/800/600',
    false,
    NOW() - INTERVAL 23 DAY,
    NOW() - INTERVAL 23 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '신혼집 인테리어 고민 같이 나눠요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'freelancer4@wedge.local'),
    '웨딩홀 투어 같이 다니실 분 있나요',
    '이번 달에 후보 웨딩홀 몇 군데 투어 예정인데 같이 다니면서 정보 나눌 분 계신가요.',
    'BOARD',
    'https://picsum.photos/seed/wedge-community-25/800/600',
    false,
    NOW() - INTERVAL 24 DAY,
    NOW() - INTERVAL 24 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '웨딩홀 투어 같이 다니실 분 있나요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'freelancer5@wedge.local'),
    '예물 시계 추천 부탁드려요',
    '예물로 어떤 브랜드 시계를 하셨는지 추천 부탁드려요. 가격대도 같이 알려주시면 감사하겠습니다.',
    'BOARD',
    'https://picsum.photos/seed/wedge-community-26/800/600',
    false,
    NOW() - INTERVAL 25 DAY,
    NOW() - INTERVAL 25 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '예물 시계 추천 부탁드려요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'freelancer6@wedge.local'),
    '신혼여행지 추천 받고 싶어요',
    '겨울에 다녀올 신혼여행지 고민 중인데 다녀오신 분들 추천 부탁드려요.',
    'BOARD',
    'https://picsum.photos/seed/wedge-community-27/800/600',
    false,
    NOW() - INTERVAL 26 DAY,
    NOW() - INTERVAL 26 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '신혼여행지 추천 받고 싶어요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'freelancer7@wedge.local'),
    '결혼 준비하며 느낀 점들 정리해봤어요',
    '생각보다 결정해야 할 게 많아서 힘들었는데 그래도 하나씩 끝낼 때마다 보람이 있더라고요.',
    'BOARD',
    'https://picsum.photos/seed/wedge-community-28/800/600',
    false,
    NOW() - INTERVAL 27 DAY,
    NOW() - INTERVAL 27 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '결혼 준비하며 느낀 점들 정리해봤어요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client2@wedge.local'),
    '답례품 직접 만들어본 후기 공유해요',
    '기성품보다 정성이 느껴진다는 반응이 많아서 만족스러웠어요. 만드는 데 시간은 좀 걸렸어요.',
    'BOARD',
    'https://picsum.photos/seed/wedge-community-29/800/600',
    false,
    NOW() - INTERVAL 28 DAY,
    NOW() - INTERVAL 28 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '답례품 직접 만들어본 후기 공유해요');

INSERT INTO posts (member_id, title, content, type, image_url, is_deleted, created_at, updated_at)
SELECT
    (SELECT id FROM members WHERE email = 'test-client3@wedge.local'),
    '청첩장 모임 후기 남겨요',
    '양가 가족분들과 같이 청첩장 문구 상의하는 자리를 가졌는데 의외로 좋은 시간이었어요.',
    'BOARD',
    'https://picsum.photos/seed/wedge-community-30/800/600',
    false,
    NOW() - INTERVAL 29 DAY,
    NOW() - INTERVAL 29 DAY
WHERE NOT EXISTS (SELECT 1 FROM posts WHERE title = '청첩장 모임 후기 남겨요');

-- =============================================
-- 카테고리별 프리랜서 10~16명 채우기 + 기존/신규 포트폴리오 3장씩 보강
-- =============================================

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'test-freelancer@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-1/900/600',
       '자연스러운 순간을 포착하는 것을 가장 중요하게 생각하는 웨딩 사진작가입니다. 과한 포즈보다는 두 분의 진짜 표정을 담아드립니다.',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'test-freelancer@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer3@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-2/900/600',
       '필름 카메라 감성을 디지털로 재현한 따뜻한 색감이 특징입니다. 포트폴리오 확인 후 문의 주세요.',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer3@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer3@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-3/900/600',
       '자연스러운 순간을 포착하는 것을 가장 중요하게 생각하는 웨딩 사진작가입니다. 과한 포즈보다는 두 분의 진짜 표정을 담아드립니다.',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer3@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer12@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-4/900/600',
       '필름 카메라 감성을 디지털로 재현한 따뜻한 색감이 특징입니다. 포트폴리오 확인 후 문의 주세요.',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer12@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer12@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-5/900/600',
       '야외 예식과 스몰 웨딩 경험이 많아 다양한 환경에서도 안정적인 결과물을 만들어 드립니다.',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer12@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer2@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-6/900/600',
       '신랑신부의 이야기를 담은 인터뷰 영상도 함께 제작해 드립니다.',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer2@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer2@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-7/900/600',
       '드론 항공 촬영부터 클로즈업까지 다양한 앵글로 풍성한 영상을 제작합니다.',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer2@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer13@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-8/900/600',
       '신랑신부의 이야기를 담은 인터뷰 영상도 함께 제작해 드립니다.',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer13@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer13@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-9/900/600',
       '빠른 편집 일정과 수정 요청 대응이 강점인 웨딩 영상 제작팀입니다.',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer13@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer5@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-10/900/600',
       '사진 촬영 시 더욱 또렷하게 나오는 입체적인 메이크업을 제공합니다.',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer5@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer5@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-11/900/600',
       '신부 한 분 한 분의 분위기를 살리는 맞춤형 메이크업을 지향합니다.',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer5@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer14@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-12/900/600',
       '신부 한 분 한 분의 분위기를 살리는 맞춤형 메이크업을 지향합니다.',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer14@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer14@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-13/900/600',
       '혼주 메이크업과 헤어 스타일링도 함께 진행 가능합니다.',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer14@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer6@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-14/900/600',
       '야외 예식 환경에 맞춘 내구성 있는 플라워 데코를 전문으로 합니다.',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer6@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer6@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-15/900/600',
       '화이트와 그린 톤의 내추럴한 무드를 살린 부케와 장식을 제작합니다.',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer6@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer15@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-16/900/600',
       '결혼 후에도 간직할 수 있는 드라이플라워 부케 제작도 가능합니다.',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer15@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer15@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-17/900/600',
       '야외 예식 환경에 맞춘 내구성 있는 플라워 데코를 전문으로 합니다.',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer15@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer8@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-18/900/600',
       '당일 현장 진행만 의뢰하셔도 매끄럽게 운영해 드립니다.',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer8@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer8@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-19/900/600',
       '당일 현장 진행만 의뢰하셔도 매끄럽게 운영해 드립니다.',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer8@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer9@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-20/900/600',
       '양가 어르신도 편안하게 느낄 수 있는 부드러운 진행을 합니다.',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer9@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer9@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-21/900/600',
       '양가 어르신도 편안하게 느낄 수 있는 부드러운 진행을 합니다.',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer9@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer10@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-22/900/600',
       '식전 연주부터 입장곡까지 분위기에 맞춘 라이브 연주를 제공합니다.',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer10@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer10@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-23/900/600',
       '식전 연주부터 입장곡까지 분위기에 맞춘 라이브 연주를 제공합니다.',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer10@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer4@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-24/900/600',
       '듀엣 축가도 가능하며, 곡 선정도 함께 상의해 드립니다.',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer4@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer4@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-25/900/600',
       'MR보다 라이브 악기 반주를 선호하시는 분께 추천드립니다.',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer4@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer16@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-26/900/600',
       '풍부한 성량과 감성적인 음색으로 식장 분위기를 채워드립니다.',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer16@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer16@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-27/900/600',
       '짧은 시간 내에도 인상적인 무대를 만들어 드립니다.',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer16@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer7@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-28/900/600',
       '과하지 않으면서도 분위기를 살리는 진행을 지향합니다.',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer7@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer7@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-29/900/600',
       '과하지 않으면서도 분위기를 살리는 진행을 지향합니다.',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer7@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer17@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-30/900/600',
       '편지 낭독 같은 깜짝 이벤트 코너도 매끄럽게 진행합니다.',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer17@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer17@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-31/900/600',
       '양가 부모님 소개를 정중하고 따뜻하게 진행해 드립니다.',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer17@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer11@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-32/900/600',
       '예식장 이동용 웨딩카 대여와 기사 섭외를 함께 진행합니다.',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer11@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer11@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-extra-33/900/600',
       '예식장 이동용 웨딩카 대여와 기사 섭외를 함께 진행합니다.',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오 보강', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer11@wedge.local') LIMIT 1) AND sort_order = 3);

-- 카테고리 1 (웨딩 사진작가) : 목표 14명, 기존 3명, 신규 11명 추가

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer18@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '신포토', '010-90018-0018', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer18@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer18@wedge.local'), 1, '야외 웨딩 전문 포토그래퍼', '야외 예식과 스몰 웨딩 경험이 많아 다양한 환경에서도 안정적인 결과물을 만들어 드립니다.', '15년차 웨딩 사진작가 전문가입니다. 필름 카메라 감성을 디지털로 재현한 따뜻한 색감이 특징입니다. 포트폴리오 확인 후 문의 주세요.', '본식원판,자연광,스냅', '광주', 516659, 15, 30, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer18@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer18@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-34/900/600',
       '야외 웨딩 전문 포토그래퍼 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer18@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer18@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-35/900/600',
       '야외 웨딩 전문 포토그래퍼 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer18@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer18@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-36/900/600',
       '야외 웨딩 전문 포토그래퍼 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer18@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer19@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '임포토', '010-90019-0019', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer19@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer19@wedge.local'), 1, '본식 원판·스냅 전문', '본식 원판부터 스냅까지 한 팀으로 진행하여 동선 걱정 없이 촬영할 수 있습니다.', '13년차 웨딩 사진작가 전문가입니다. 야외 예식과 스몰 웨딩 경험이 많아 다양한 환경에서도 안정적인 결과물을 만들어 드립니다.', '야외촬영,본식원판,스냅', '수원', 616615, 13, 29, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer19@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer19@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-37/900/600',
       '본식 원판·스냅 전문 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer19@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer19@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-38/900/600',
       '본식 원판·스냅 전문 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer19@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer19@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-39/900/600',
       '본식 원판·스냅 전문 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer19@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer20@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '박포토', '010-90020-0020', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer20@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer20@wedge.local'), 1, '다큐멘터리 스타일 웨딩 스냅', '야외 예식과 스몰 웨딩 경험이 많아 다양한 환경에서도 안정적인 결과물을 만들어 드립니다.', '3년차 웨딩 사진작가 전문가입니다. 야외 예식과 스몰 웨딩 경험이 많아 다양한 환경에서도 안정적인 결과물을 만들어 드립니다.', '스냅,자연광,본식원판', '대구', 617870, 3, 20, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer20@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer20@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-40/900/600',
       '다큐멘터리 스타일 웨딩 스냅 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer20@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer20@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-41/900/600',
       '다큐멘터리 스타일 웨딩 스냅 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer20@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer20@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-42/900/600',
       '다큐멘터리 스타일 웨딩 스냅 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer20@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer21@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '한포토', '010-90021-0021', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer21@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer21@wedge.local'), 1, '본식 원판·스냅 전문', '본식 원판부터 스냅까지 한 팀으로 진행하여 동선 걱정 없이 촬영할 수 있습니다.', '15년차 웨딩 사진작가 전문가입니다. 야외 예식과 스몰 웨딩 경험이 많아 다양한 환경에서도 안정적인 결과물을 만들어 드립니다.', '야외촬영,본식원판,스냅', '울산', 427171, 15, 0, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer21@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer21@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-43/900/600',
       '본식 원판·스냅 전문 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer21@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer21@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-44/900/600',
       '본식 원판·스냅 전문 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer21@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer21@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-45/900/600',
       '본식 원판·스냅 전문 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer21@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer22@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '오포토', '010-90022-0022', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer22@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer22@wedge.local'), 1, '본식 원판·스냅 전문', '본식 원판부터 스냅까지 한 팀으로 진행하여 동선 걱정 없이 촬영할 수 있습니다.', '10년차 웨딩 사진작가 전문가입니다. 자연스러운 순간을 포착하는 것을 가장 중요하게 생각하는 웨딩 사진작가입니다. 과한 포즈보다는 두 분의 진짜 표정을 담아드립니다.', '자연광,본식원판,필름톤', '서울', 645761, 10, 3, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer22@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer22@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-46/900/600',
       '본식 원판·스냅 전문 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer22@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer22@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-47/900/600',
       '본식 원판·스냅 전문 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer22@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer22@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-48/900/600',
       '본식 원판·스냅 전문 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer22@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer23@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '서포토', '010-90023-0023', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer23@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer23@wedge.local'), 1, '자연광을 살린 감성 웨딩 스냅', '본식 원판부터 스냅까지 한 팀으로 진행하여 동선 걱정 없이 촬영할 수 있습니다.', '15년차 웨딩 사진작가 전문가입니다. 자연스러운 순간을 포착하는 것을 가장 중요하게 생각하는 웨딩 사진작가입니다. 과한 포즈보다는 두 분의 진짜 표정을 담아드립니다.', '자연광,필름톤,스냅', '광주', 511174, 15, 15, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer23@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer23@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-49/900/600',
       '자연광을 살린 감성 웨딩 스냅 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer23@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer23@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-50/900/600',
       '자연광을 살린 감성 웨딩 스냅 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer23@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer23@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-51/900/600',
       '자연광을 살린 감성 웨딩 스냅 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer23@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer24@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '장포토', '010-90024-0024', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer24@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer24@wedge.local'), 1, '스튜디오 컨셉 웨딩 사진', '야외 예식과 스몰 웨딩 경험이 많아 다양한 환경에서도 안정적인 결과물을 만들어 드립니다.', '1년차 웨딩 사진작가 전문가입니다. 본식 원판부터 스냅까지 한 팀으로 진행하여 동선 걱정 없이 촬영할 수 있습니다.', '야외촬영,스냅,본식원판', '대전', 601286, 1, 7, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer24@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer24@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-52/900/600',
       '스튜디오 컨셉 웨딩 사진 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer24@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer24@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-53/900/600',
       '스튜디오 컨셉 웨딩 사진 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer24@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer24@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-54/900/600',
       '스튜디오 컨셉 웨딩 사진 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer24@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer25@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '박포토', '010-90025-0025', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer25@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer25@wedge.local'), 1, '필름 톤 웨딩 사진작가', '야외 예식과 스몰 웨딩 경험이 많아 다양한 환경에서도 안정적인 결과물을 만들어 드립니다.', '12년차 웨딩 사진작가 전문가입니다. 본식 원판부터 스냅까지 한 팀으로 진행하여 동선 걱정 없이 촬영할 수 있습니다.', '야외촬영,자연광,필름톤', '대구', 489383, 12, 30, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer25@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer25@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-55/900/600',
       '필름 톤 웨딩 사진작가 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer25@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer25@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-56/900/600',
       '필름 톤 웨딩 사진작가 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer25@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer25@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-57/900/600',
       '필름 톤 웨딩 사진작가 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer25@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer26@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '오포토', '010-90026-0026', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer26@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer26@wedge.local'), 1, '필름 톤 웨딩 사진작가', '필름 카메라 감성을 디지털로 재현한 따뜻한 색감이 특징입니다. 포트폴리오 확인 후 문의 주세요.', '12년차 웨딩 사진작가 전문가입니다. 자연스러운 순간을 포착하는 것을 가장 중요하게 생각하는 웨딩 사진작가입니다. 과한 포즈보다는 두 분의 진짜 표정을 담아드립니다.', '야외촬영,자연광,필름톤', '울산', 626279, 12, 3, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer26@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer26@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-58/900/600',
       '필름 톤 웨딩 사진작가 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer26@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer26@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-59/900/600',
       '필름 톤 웨딩 사진작가 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer26@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer26@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-60/900/600',
       '필름 톤 웨딩 사진작가 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer26@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer27@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '조포토', '010-90027-0027', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer27@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer27@wedge.local'), 1, '본식 원판·스냅 전문', '자연스러운 순간을 포착하는 것을 가장 중요하게 생각하는 웨딩 사진작가입니다. 과한 포즈보다는 두 분의 진짜 표정을 담아드립니다.', '7년차 웨딩 사진작가 전문가입니다. 야외 예식과 스몰 웨딩 경험이 많아 다양한 환경에서도 안정적인 결과물을 만들어 드립니다.', '본식원판,스냅,야외촬영', '수원', 451959, 7, 18, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer27@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer27@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-61/900/600',
       '본식 원판·스냅 전문 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer27@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer27@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-62/900/600',
       '본식 원판·스냅 전문 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer27@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer27@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-63/900/600',
       '본식 원판·스냅 전문 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer27@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer28@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '한포토', '010-90028-0028', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer28@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer28@wedge.local'), 1, '야외 웨딩 전문 포토그래퍼', '야외 예식과 스몰 웨딩 경험이 많아 다양한 환경에서도 안정적인 결과물을 만들어 드립니다.', '13년차 웨딩 사진작가 전문가입니다. 야외 예식과 스몰 웨딩 경험이 많아 다양한 환경에서도 안정적인 결과물을 만들어 드립니다.', '스냅,필름톤,본식원판', '경기', 511266, 13, 14, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer28@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer28@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-64/900/600',
       '야외 웨딩 전문 포토그래퍼 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer28@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer28@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-65/900/600',
       '야외 웨딩 전문 포토그래퍼 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer28@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer28@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-66/900/600',
       '야외 웨딩 전문 포토그래퍼 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer28@wedge.local') LIMIT 1) AND sort_order = 3);

-- 카테고리 2 (웨딩 영상) : 목표 10명, 기존 2명, 신규 8명 추가

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer29@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '강필름', '010-90029-0029', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer29@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer29@wedge.local'), 2, '당일 편집 가능한 웨딩 영상팀', '드론 항공 촬영부터 클로즈업까지 다양한 앵글로 풍성한 영상을 제작합니다.', '2년차 웨딩 영상 전문가입니다. 드론 항공 촬영부터 클로즈업까지 다양한 앵글로 풍성한 영상을 제작합니다.', '시네마틱,드론,당일편집', '수원', 830721, 2, 7, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer29@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer29@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-67/900/600',
       '당일 편집 가능한 웨딩 영상팀 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer29@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer29@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-68/900/600',
       '당일 편집 가능한 웨딩 영상팀 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer29@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer29@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-69/900/600',
       '당일 편집 가능한 웨딩 영상팀 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer29@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer30@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '한필름', '010-90030-0030', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer30@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer30@wedge.local'), 2, '다큐 스타일 웨딩 영상', '신랑신부의 이야기를 담은 인터뷰 영상도 함께 제작해 드립니다.', '2년차 웨딩 영상 전문가입니다. 드론 항공 촬영부터 클로즈업까지 다양한 앵글로 풍성한 영상을 제작합니다.', '드론,당일편집,하이라이트영상', '제주', 873958, 2, 27, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer30@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer30@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-70/900/600',
       '다큐 스타일 웨딩 영상 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer30@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer30@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-71/900/600',
       '다큐 스타일 웨딩 영상 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer30@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer30@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-72/900/600',
       '다큐 스타일 웨딩 영상 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer30@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer31@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '김필름', '010-90031-0031', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer31@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer31@wedge.local'), 2, '고퀄리티 풀버전 웨딩 영상', '드론 항공 촬영부터 클로즈업까지 다양한 앵글로 풍성한 영상을 제작합니다.', '4년차 웨딩 영상 전문가입니다. 드론 항공 촬영부터 클로즈업까지 다양한 앵글로 풍성한 영상을 제작합니다.', '드론,시네마틱,당일편집', '대구', 662981, 4, 27, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer31@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer31@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-73/900/600',
       '고퀄리티 풀버전 웨딩 영상 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer31@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer31@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-74/900/600',
       '고퀄리티 풀버전 웨딩 영상 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer31@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer31@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-75/900/600',
       '고퀄리티 풀버전 웨딩 영상 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer31@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer32@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '한필름', '010-90032-0032', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer32@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer32@wedge.local'), 2, '당일 편집 가능한 웨딩 영상팀', '드론 항공 촬영부터 클로즈업까지 다양한 앵글로 풍성한 영상을 제작합니다.', '10년차 웨딩 영상 전문가입니다. 빠른 편집 일정과 수정 요청 대응이 강점인 웨딩 영상 제작팀입니다.', '풀버전,드론,시네마틱', '경기', 941337, 10, 15, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer32@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer32@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-76/900/600',
       '당일 편집 가능한 웨딩 영상팀 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer32@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer32@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-77/900/600',
       '당일 편집 가능한 웨딩 영상팀 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer32@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer32@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-78/900/600',
       '당일 편집 가능한 웨딩 영상팀 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer32@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer33@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '신필름', '010-90033-0033', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer33@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer33@wedge.local'), 2, '다큐 스타일 웨딩 영상', '영화 같은 색감과 구성으로 결혼식의 감동을 영상에 담아드립니다.', '4년차 웨딩 영상 전문가입니다. 신랑신부의 이야기를 담은 인터뷰 영상도 함께 제작해 드립니다.', '하이라이트영상,당일편집,풀버전', '부산', 830922, 4, 25, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer33@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer33@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-79/900/600',
       '다큐 스타일 웨딩 영상 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer33@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer33@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-80/900/600',
       '다큐 스타일 웨딩 영상 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer33@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer33@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-81/900/600',
       '다큐 스타일 웨딩 영상 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer33@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer34@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '오필름', '010-90034-0034', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer34@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer34@wedge.local'), 2, '고퀄리티 풀버전 웨딩 영상', '빠른 편집 일정과 수정 요청 대응이 강점인 웨딩 영상 제작팀입니다.', '4년차 웨딩 영상 전문가입니다. 빠른 편집 일정과 수정 요청 대응이 강점인 웨딩 영상 제작팀입니다.', '하이라이트영상,드론,시네마틱', '서울', 681125, 4, 14, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer34@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer34@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-82/900/600',
       '고퀄리티 풀버전 웨딩 영상 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer34@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer34@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-83/900/600',
       '고퀄리티 풀버전 웨딩 영상 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer34@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer34@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-84/900/600',
       '고퀄리티 풀버전 웨딩 영상 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer34@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer35@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '박필름', '010-90035-0035', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer35@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer35@wedge.local'), 2, '고퀄리티 풀버전 웨딩 영상', '빠른 편집 일정과 수정 요청 대응이 강점인 웨딩 영상 제작팀입니다.', '12년차 웨딩 영상 전문가입니다. 영화 같은 색감과 구성으로 결혼식의 감동을 영상에 담아드립니다.', '드론,하이라이트영상,시네마틱', '인천', 905996, 12, 27, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer35@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer35@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-85/900/600',
       '고퀄리티 풀버전 웨딩 영상 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer35@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer35@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-86/900/600',
       '고퀄리티 풀버전 웨딩 영상 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer35@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer35@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-87/900/600',
       '고퀄리티 풀버전 웨딩 영상 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer35@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer36@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '이필름', '010-90036-0036', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer36@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer36@wedge.local'), 2, '드론 항공 촬영 포함 웨딩 영상', '빠른 편집 일정과 수정 요청 대응이 강점인 웨딩 영상 제작팀입니다.', '10년차 웨딩 영상 전문가입니다. 드론 항공 촬영부터 클로즈업까지 다양한 앵글로 풍성한 영상을 제작합니다.', '시네마틱,드론,하이라이트영상', '서울', 670964, 10, 11, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer36@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer36@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-88/900/600',
       '드론 항공 촬영 포함 웨딩 영상 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer36@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer36@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-89/900/600',
       '드론 항공 촬영 포함 웨딩 영상 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer36@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer36@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-90/900/600',
       '드론 항공 촬영 포함 웨딩 영상 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer36@wedge.local') LIMIT 1) AND sort_order = 3);

-- 카테고리 3 (헤어·메이크업) : 목표 16명, 기존 2명, 신규 14명 추가

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer37@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '강뷰티', '010-90037-0037', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer37@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer37@wedge.local'), 3, '신부 본판을 살리는 내추럴 메이크업', '사진 촬영 시 더욱 또렷하게 나오는 입체적인 메이크업을 제공합니다.', '5년차 헤어·메이크업 전문가입니다. 리허설부터 본식까지 꼼꼼하게 케어하며, 장시간 유지되는 메이크업이 강점입니다.', '내추럴메이크업,리허설포함,혼주메이크업', '대전', 537379, 5, 15, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer37@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer37@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-91/900/600',
       '신부 본판을 살리는 내추럴 메이크업 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer37@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer37@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-92/900/600',
       '신부 본판을 살리는 내추럴 메이크업 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer37@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer37@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-93/900/600',
       '신부 본판을 살리는 내추럴 메이크업 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer37@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer38@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '임뷰티', '010-90038-0038', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer38@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer38@wedge.local'), 3, '트렌디한 웨딩 헤어 스타일링', '사진 촬영 시 더욱 또렷하게 나오는 입체적인 메이크업을 제공합니다.', '4년차 헤어·메이크업 전문가입니다. 혼주 메이크업과 헤어 스타일링도 함께 진행 가능합니다.', '리허설포함,내추럴메이크업,혼주메이크업', '부산', 302619, 4, 1, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer38@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer38@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-94/900/600',
       '트렌디한 웨딩 헤어 스타일링 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer38@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer38@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-95/900/600',
       '트렌디한 웨딩 헤어 스타일링 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer38@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer38@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-96/900/600',
       '트렌디한 웨딩 헤어 스타일링 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer38@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer39@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '신뷰티', '010-90039-0039', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer39@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer39@wedge.local'), 3, '청담 스타일 브라이덜 메이크업', '사진 촬영 시 더욱 또렷하게 나오는 입체적인 메이크업을 제공합니다.', '15년차 헤어·메이크업 전문가입니다. 혼주 메이크업과 헤어 스타일링도 함께 진행 가능합니다.', '리허설포함,혼주메이크업,헤어스타일링', '경기', 311499, 15, 30, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer39@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer39@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-97/900/600',
       '청담 스타일 브라이덜 메이크업 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer39@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer39@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-98/900/600',
       '청담 스타일 브라이덜 메이크업 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer39@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer39@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-99/900/600',
       '청담 스타일 브라이덜 메이크업 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer39@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer40@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '한뷰티', '010-90040-0040', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer40@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer40@wedge.local'), 3, '청담 스타일 브라이덜 메이크업', '리허설부터 본식까지 꼼꼼하게 케어하며, 장시간 유지되는 메이크업이 강점입니다.', '1년차 헤어·메이크업 전문가입니다. 신부 한 분 한 분의 분위기를 살리는 맞춤형 메이크업을 지향합니다.', '헤어스타일링,리허설포함,내추럴메이크업', '서울', 547887, 1, 9, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer40@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer40@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-100/900/600',
       '청담 스타일 브라이덜 메이크업 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer40@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer40@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-101/900/600',
       '청담 스타일 브라이덜 메이크업 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer40@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer40@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-102/900/600',
       '청담 스타일 브라이덜 메이크업 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer40@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer41@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '이뷰티', '010-90041-0041', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer41@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer41@wedge.local'), 3, '혼주 메이크업 가능한 헤어메이크업', '리허설부터 본식까지 꼼꼼하게 케어하며, 장시간 유지되는 메이크업이 강점입니다.', '14년차 헤어·메이크업 전문가입니다. 사진 촬영 시 더욱 또렷하게 나오는 입체적인 메이크업을 제공합니다.', '내추럴메이크업,유지력,리허설포함', '서울', 552447, 14, 16, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer41@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer41@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-103/900/600',
       '혼주 메이크업 가능한 헤어메이크업 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer41@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer41@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-104/900/600',
       '혼주 메이크업 가능한 헤어메이크업 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer41@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer41@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-105/900/600',
       '혼주 메이크업 가능한 헤어메이크업 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer41@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer42@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '서뷰티', '010-90042-0042', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer42@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer42@wedge.local'), 3, '신부 본판을 살리는 내추럴 메이크업', '신부 한 분 한 분의 분위기를 살리는 맞춤형 메이크업을 지향합니다.', '4년차 헤어·메이크업 전문가입니다. 신부 한 분 한 분의 분위기를 살리는 맞춤형 메이크업을 지향합니다.', '내추럴메이크업,유지력,헤어스타일링', '부산', 391436, 4, 30, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer42@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer42@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-106/900/600',
       '신부 본판을 살리는 내추럴 메이크업 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer42@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer42@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-107/900/600',
       '신부 본판을 살리는 내추럴 메이크업 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer42@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer42@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-108/900/600',
       '신부 본판을 살리는 내추럴 메이크업 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer42@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer43@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '오뷰티', '010-90043-0043', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer43@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer43@wedge.local'), 3, '신부 본판을 살리는 내추럴 메이크업', '신부 한 분 한 분의 분위기를 살리는 맞춤형 메이크업을 지향합니다.', '12년차 헤어·메이크업 전문가입니다. 리허설부터 본식까지 꼼꼼하게 케어하며, 장시간 유지되는 메이크업이 강점입니다.', '혼주메이크업,리허설포함,헤어스타일링', '수원', 321050, 12, 26, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer43@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer43@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-109/900/600',
       '신부 본판을 살리는 내추럴 메이크업 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer43@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer43@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-110/900/600',
       '신부 본판을 살리는 내추럴 메이크업 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer43@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer43@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-111/900/600',
       '신부 본판을 살리는 내추럴 메이크업 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer43@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer44@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '장뷰티', '010-90044-0044', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer44@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer44@wedge.local'), 3, '리허설 포함 웨딩 뷰티 패키지', '신부 한 분 한 분의 분위기를 살리는 맞춤형 메이크업을 지향합니다.', '1년차 헤어·메이크업 전문가입니다. 신부 한 분 한 분의 분위기를 살리는 맞춤형 메이크업을 지향합니다.', '유지력,혼주메이크업,헤어스타일링', '수원', 327330, 1, 11, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer44@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer44@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-112/900/600',
       '리허설 포함 웨딩 뷰티 패키지 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer44@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer44@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-113/900/600',
       '리허설 포함 웨딩 뷰티 패키지 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer44@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer44@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-114/900/600',
       '리허설 포함 웨딩 뷰티 패키지 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer44@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer45@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '조뷰티', '010-90045-0045', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer45@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer45@wedge.local'), 3, '유지력 좋은 웨딩 헤어메이크업', '혼주 메이크업과 헤어 스타일링도 함께 진행 가능합니다.', '7년차 헤어·메이크업 전문가입니다. 리허설부터 본식까지 꼼꼼하게 케어하며, 장시간 유지되는 메이크업이 강점입니다.', '내추럴메이크업,혼주메이크업,리허설포함', '부산', 288675, 7, 17, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer45@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer45@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-115/900/600',
       '유지력 좋은 웨딩 헤어메이크업 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer45@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer45@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-116/900/600',
       '유지력 좋은 웨딩 헤어메이크업 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer45@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer45@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-117/900/600',
       '유지력 좋은 웨딩 헤어메이크업 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer45@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer46@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '정뷰티', '010-90046-0046', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer46@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer46@wedge.local'), 3, '트렌디한 웨딩 헤어 스타일링', '사진 촬영 시 더욱 또렷하게 나오는 입체적인 메이크업을 제공합니다.', '12년차 헤어·메이크업 전문가입니다. 사진 촬영 시 더욱 또렷하게 나오는 입체적인 메이크업을 제공합니다.', '유지력,혼주메이크업,내추럴메이크업', '제주', 329686, 12, 26, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer46@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer46@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-118/900/600',
       '트렌디한 웨딩 헤어 스타일링 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer46@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer46@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-119/900/600',
       '트렌디한 웨딩 헤어 스타일링 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer46@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer46@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-120/900/600',
       '트렌디한 웨딩 헤어 스타일링 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer46@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer47@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '한뷰티', '010-90047-0047', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer47@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer47@wedge.local'), 3, '트렌디한 웨딩 헤어 스타일링', '사진 촬영 시 더욱 또렷하게 나오는 입체적인 메이크업을 제공합니다.', '12년차 헤어·메이크업 전문가입니다. 리허설부터 본식까지 꼼꼼하게 케어하며, 장시간 유지되는 메이크업이 강점입니다.', '내추럴메이크업,리허설포함,혼주메이크업', '울산', 538119, 12, 8, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer47@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer47@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-121/900/600',
       '트렌디한 웨딩 헤어 스타일링 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer47@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer47@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-122/900/600',
       '트렌디한 웨딩 헤어 스타일링 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer47@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer47@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-123/900/600',
       '트렌디한 웨딩 헤어 스타일링 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer47@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer48@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '신뷰티', '010-90048-0048', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer48@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer48@wedge.local'), 3, '청담 스타일 브라이덜 메이크업', '사진 촬영 시 더욱 또렷하게 나오는 입체적인 메이크업을 제공합니다.', '4년차 헤어·메이크업 전문가입니다. 사진 촬영 시 더욱 또렷하게 나오는 입체적인 메이크업을 제공합니다.', '내추럴메이크업,유지력,헤어스타일링', '광주', 310964, 4, 22, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer48@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer48@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-124/900/600',
       '청담 스타일 브라이덜 메이크업 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer48@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer48@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-125/900/600',
       '청담 스타일 브라이덜 메이크업 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer48@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer48@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-126/900/600',
       '청담 스타일 브라이덜 메이크업 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer48@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer49@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '권뷰티', '010-90049-0049', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer49@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer49@wedge.local'), 3, '신부 본판을 살리는 내추럴 메이크업', '신부 한 분 한 분의 분위기를 살리는 맞춤형 메이크업을 지향합니다.', '9년차 헤어·메이크업 전문가입니다. 리허설부터 본식까지 꼼꼼하게 케어하며, 장시간 유지되는 메이크업이 강점입니다.', '내추럴메이크업,혼주메이크업,리허설포함', '인천', 351778, 9, 18, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer49@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer49@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-127/900/600',
       '신부 본판을 살리는 내추럴 메이크업 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer49@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer49@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-128/900/600',
       '신부 본판을 살리는 내추럴 메이크업 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer49@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer49@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-129/900/600',
       '신부 본판을 살리는 내추럴 메이크업 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer49@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer50@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '조뷰티', '010-90050-0050', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer50@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer50@wedge.local'), 3, '혼주 메이크업 가능한 헤어메이크업', '신부 한 분 한 분의 분위기를 살리는 맞춤형 메이크업을 지향합니다.', '2년차 헤어·메이크업 전문가입니다. 사진 촬영 시 더욱 또렷하게 나오는 입체적인 메이크업을 제공합니다.', '혼주메이크업,헤어스타일링,유지력', '대구', 347152, 2, 23, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer50@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer50@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-130/900/600',
       '혼주 메이크업 가능한 헤어메이크업 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer50@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer50@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-131/900/600',
       '혼주 메이크업 가능한 헤어메이크업 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer50@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer50@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-132/900/600',
       '혼주 메이크업 가능한 헤어메이크업 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer50@wedge.local') LIMIT 1) AND sort_order = 3);

-- 카테고리 4 (웨딩 플로리스트) : 목표 14명, 기존 2명, 신규 12명 추가

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer51@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '한플라워', '010-90051-0051', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer51@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer51@wedge.local'), 4, '화이트톤 웨딩 플라워 스타일링', '야외 예식 환경에 맞춘 내구성 있는 플라워 데코를 전문으로 합니다.', '9년차 웨딩 플로리스트 전문가입니다. 화이트와 그린 톤의 내추럴한 무드를 살린 부케와 장식을 제작합니다.', '드라이플라워,제단장식,화이트톤', '대전', 467161, 9, 20, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer51@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer51@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-133/900/600',
       '화이트톤 웨딩 플라워 스타일링 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer51@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer51@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-134/900/600',
       '화이트톤 웨딩 플라워 스타일링 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer51@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer51@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-135/900/600',
       '화이트톤 웨딩 플라워 스타일링 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer51@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer52@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '한플라워', '010-90052-0052', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer52@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer52@wedge.local'), 4, '계절감 살린 웨딩 부케', '결혼 후에도 간직할 수 있는 드라이플라워 부케 제작도 가능합니다.', '15년차 웨딩 플로리스트 전문가입니다. 제단, 포토존, 부케까지 통일감 있는 플라워 스타일링을 제공합니다.', '부케,제단장식,포토존데코', '광주', 435950, 15, 26, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer52@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer52@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-136/900/600',
       '계절감 살린 웨딩 부케 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer52@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer52@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-137/900/600',
       '계절감 살린 웨딩 부케 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer52@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer52@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-138/900/600',
       '계절감 살린 웨딩 부케 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer52@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer53@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '한플라워', '010-90053-0053', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer53@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer53@wedge.local'), 4, '내추럴 무드 웨딩 플로리스트', '제단, 포토존, 부케까지 통일감 있는 플라워 스타일링을 제공합니다.', '14년차 웨딩 플로리스트 전문가입니다. 야외 예식 환경에 맞춘 내구성 있는 플라워 데코를 전문으로 합니다.', '화이트톤,포토존데코,드라이플라워', '제주', 620112, 14, 24, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer53@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer53@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-139/900/600',
       '내추럴 무드 웨딩 플로리스트 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer53@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer53@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-140/900/600',
       '내추럴 무드 웨딩 플로리스트 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer53@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer53@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-141/900/600',
       '내추럴 무드 웨딩 플로리스트 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer53@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer54@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '장플라워', '010-90054-0054', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer54@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer54@wedge.local'), 4, '화이트톤 웨딩 플라워 스타일링', '화이트와 그린 톤의 내추럴한 무드를 살린 부케와 장식을 제작합니다.', '8년차 웨딩 플로리스트 전문가입니다. 제단, 포토존, 부케까지 통일감 있는 플라워 스타일링을 제공합니다.', '제단장식,드라이플라워,포토존데코', '경기', 332010, 8, 14, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer54@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer54@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-142/900/600',
       '화이트톤 웨딩 플라워 스타일링 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer54@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer54@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-143/900/600',
       '화이트톤 웨딩 플라워 스타일링 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer54@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer54@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-144/900/600',
       '화이트톤 웨딩 플라워 스타일링 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer54@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer55@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '김플라워', '010-90055-0055', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer55@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer55@wedge.local'), 4, '계절감 살린 웨딩 부케', '야외 예식 환경에 맞춘 내구성 있는 플라워 데코를 전문으로 합니다.', '15년차 웨딩 플로리스트 전문가입니다. 화이트와 그린 톤의 내추럴한 무드를 살린 부케와 장식을 제작합니다.', '드라이플라워,포토존데코,부케', '제주', 427691, 15, 13, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer55@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer55@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-145/900/600',
       '계절감 살린 웨딩 부케 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer55@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer55@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-146/900/600',
       '계절감 살린 웨딩 부케 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer55@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer55@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-147/900/600',
       '계절감 살린 웨딩 부케 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer55@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer56@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '강플라워', '010-90056-0056', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer56@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer56@wedge.local'), 4, '계절감 살린 웨딩 부케', '야외 예식 환경에 맞춘 내구성 있는 플라워 데코를 전문으로 합니다.', '5년차 웨딩 플로리스트 전문가입니다. 결혼 후에도 간직할 수 있는 드라이플라워 부케 제작도 가능합니다.', '화이트톤,포토존데코,드라이플라워', '부산', 439147, 5, 23, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer56@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer56@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-148/900/600',
       '계절감 살린 웨딩 부케 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer56@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer56@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-149/900/600',
       '계절감 살린 웨딩 부케 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer56@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer56@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-150/900/600',
       '계절감 살린 웨딩 부케 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer56@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer57@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '한플라워', '010-90057-0057', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer57@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer57@wedge.local'), 4, '드라이플라워 웨딩 부케 제작', '야외 예식 환경에 맞춘 내구성 있는 플라워 데코를 전문으로 합니다.', '13년차 웨딩 플로리스트 전문가입니다. 야외 예식 환경에 맞춘 내구성 있는 플라워 데코를 전문으로 합니다.', '제단장식,부케,포토존데코', '부산', 572635, 13, 12, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer57@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer57@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-151/900/600',
       '드라이플라워 웨딩 부케 제작 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer57@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer57@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-152/900/600',
       '드라이플라워 웨딩 부케 제작 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer57@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer57@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-153/900/600',
       '드라이플라워 웨딩 부케 제작 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer57@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer58@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '최플라워', '010-90058-0058', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer58@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer58@wedge.local'), 4, '화이트톤 웨딩 플라워 스타일링', '화이트와 그린 톤의 내추럴한 무드를 살린 부케와 장식을 제작합니다.', '11년차 웨딩 플로리스트 전문가입니다. 야외 예식 환경에 맞춘 내구성 있는 플라워 데코를 전문으로 합니다.', '부케,포토존데코,화이트톤', '광주', 390143, 11, 4, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer58@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer58@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-154/900/600',
       '화이트톤 웨딩 플라워 스타일링 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer58@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer58@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-155/900/600',
       '화이트톤 웨딩 플라워 스타일링 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer58@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer58@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-156/900/600',
       '화이트톤 웨딩 플라워 스타일링 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer58@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer59@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '정플라워', '010-90059-0059', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer59@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer59@wedge.local'), 4, '부케·제단 장식 전문', '결혼 후에도 간직할 수 있는 드라이플라워 부케 제작도 가능합니다.', '8년차 웨딩 플로리스트 전문가입니다. 화이트와 그린 톤의 내추럴한 무드를 살린 부케와 장식을 제작합니다.', '화이트톤,포토존데코,제단장식', '광주', 490708, 8, 13, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer59@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer59@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-157/900/600',
       '부케·제단 장식 전문 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer59@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer59@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-158/900/600',
       '부케·제단 장식 전문 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer59@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer59@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-159/900/600',
       '부케·제단 장식 전문 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer59@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer60@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '권플라워', '010-90060-0060', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer60@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer60@wedge.local'), 4, '드라이플라워 웨딩 부케 제작', '야외 예식 환경에 맞춘 내구성 있는 플라워 데코를 전문으로 합니다.', '1년차 웨딩 플로리스트 전문가입니다. 제단, 포토존, 부케까지 통일감 있는 플라워 스타일링을 제공합니다.', '부케,화이트톤,제단장식', '광주', 344534, 1, 25, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer60@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer60@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-160/900/600',
       '드라이플라워 웨딩 부케 제작 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer60@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer60@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-161/900/600',
       '드라이플라워 웨딩 부케 제작 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer60@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer60@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-162/900/600',
       '드라이플라워 웨딩 부케 제작 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer60@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer61@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '장플라워', '010-90061-0061', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer61@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer61@wedge.local'), 4, '드라이플라워 웨딩 부케 제작', '결혼 후에도 간직할 수 있는 드라이플라워 부케 제작도 가능합니다.', '11년차 웨딩 플로리스트 전문가입니다. 결혼 후에도 간직할 수 있는 드라이플라워 부케 제작도 가능합니다.', '화이트톤,드라이플라워,포토존데코', '서울', 550780, 11, 2, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer61@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer61@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-163/900/600',
       '드라이플라워 웨딩 부케 제작 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer61@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer61@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-164/900/600',
       '드라이플라워 웨딩 부케 제작 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer61@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer61@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-165/900/600',
       '드라이플라워 웨딩 부케 제작 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer61@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer62@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '임플라워', '010-90062-0062', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer62@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer62@wedge.local'), 4, '내추럴 무드 웨딩 플로리스트', '야외 예식 환경에 맞춘 내구성 있는 플라워 데코를 전문으로 합니다.', '10년차 웨딩 플로리스트 전문가입니다. 결혼 후에도 간직할 수 있는 드라이플라워 부케 제작도 가능합니다.', '포토존데코,드라이플라워,화이트톤', '울산', 523056, 10, 6, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer62@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer62@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-166/900/600',
       '내추럴 무드 웨딩 플로리스트 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer62@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer62@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-167/900/600',
       '내추럴 무드 웨딩 플로리스트 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer62@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer62@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-168/900/600',
       '내추럴 무드 웨딩 플로리스트 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer62@wedge.local') LIMIT 1) AND sort_order = 3);

-- 카테고리 5 (웨딩 플래너) : 목표 13명, 기존 1명, 신규 12명 추가

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer63@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '김플랜', '010-90063-0063', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer63@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer63@wedge.local'), 5, '예산 관리 전문 웨딩 플래너', '당일 현장 진행만 의뢰하셔도 매끄럽게 운영해 드립니다.', '11년차 웨딩 플래너 전문가입니다. 예산 안에서 합리적인 업체 매칭과 일정 관리를 도와드립니다.', '스몰웨딩,토탈플래닝,예산관리', '경기', 1031663, 11, 3, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer63@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer63@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-169/900/600',
       '예산 관리 전문 웨딩 플래너 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer63@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer63@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-170/900/600',
       '예산 관리 전문 웨딩 플래너 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer63@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer63@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-171/900/600',
       '예산 관리 전문 웨딩 플래너 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer63@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer64@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '이플랜', '010-90064-0064', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer64@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer64@wedge.local'), 5, '업체 매칭부터 진행까지 풀 케어', '예산 안에서 합리적인 업체 매칭과 일정 관리를 도와드립니다.', '3년차 웨딩 플래너 전문가입니다. 준비 과정 전반의 커뮤니케이션을 도맡아 신랑신부의 부담을 줄여드립니다.', '스몰웨딩,업체매칭,토탈플래닝', '울산', 1187298, 3, 7, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer64@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer64@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-172/900/600',
       '업체 매칭부터 진행까지 풀 케어 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer64@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer64@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-173/900/600',
       '업체 매칭부터 진행까지 풀 케어 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer64@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer64@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-174/900/600',
       '업체 매칭부터 진행까지 풀 케어 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer64@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer65@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '윤플랜', '010-90065-0065', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer65@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer65@wedge.local'), 5, '토탈 웨딩 플래닝 서비스', '50명 내외 스몰 웨딩 기획 경험이 많아 세심한 진행이 가능합니다.', '14년차 웨딩 플래너 전문가입니다. 당일 현장 진행만 의뢰하셔도 매끄럽게 운영해 드립니다.', '토탈플래닝,업체매칭,예산관리', '수원', 1076371, 14, 16, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer65@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer65@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-175/900/600',
       '토탈 웨딩 플래닝 서비스 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer65@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer65@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-176/900/600',
       '토탈 웨딩 플래닝 서비스 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer65@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer65@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-177/900/600',
       '토탈 웨딩 플래닝 서비스 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer65@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer66@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '강플랜', '010-90066-0066', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer66@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer66@wedge.local'), 5, '소규모 결혼식 전문 플래너', '50명 내외 스몰 웨딩 기획 경험이 많아 세심한 진행이 가능합니다.', '10년차 웨딩 플래너 전문가입니다. 예산 안에서 합리적인 업체 매칭과 일정 관리를 도와드립니다.', '토탈플래닝,당일진행,예산관리', '대구', 1176038, 10, 7, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer66@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer66@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-178/900/600',
       '소규모 결혼식 전문 플래너 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer66@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer66@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-179/900/600',
       '소규모 결혼식 전문 플래너 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer66@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer66@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-180/900/600',
       '소규모 결혼식 전문 플래너 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer66@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer67@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '한플랜', '010-90067-0067', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer67@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer67@wedge.local'), 5, '호텔 웨딩 전문 플래너', '당일 현장 진행만 의뢰하셔도 매끄럽게 운영해 드립니다.', '3년차 웨딩 플래너 전문가입니다. 당일 현장 진행만 의뢰하셔도 매끄럽게 운영해 드립니다.', '토탈플래닝,예산관리,스몰웨딩', '인천', 1074355, 3, 30, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer67@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer67@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-181/900/600',
       '호텔 웨딩 전문 플래너 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer67@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer67@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-182/900/600',
       '호텔 웨딩 전문 플래너 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer67@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer67@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-183/900/600',
       '호텔 웨딩 전문 플래너 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer67@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer68@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '권플랜', '010-90068-0068', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer68@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer68@wedge.local'), 5, '호텔 웨딩 전문 플래너', '50명 내외 스몰 웨딩 기획 경험이 많아 세심한 진행이 가능합니다.', '4년차 웨딩 플래너 전문가입니다. 준비 과정 전반의 커뮤니케이션을 도맡아 신랑신부의 부담을 줄여드립니다.', '토탈플래닝,당일진행,예산관리', '울산', 921110, 4, 16, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer68@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer68@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-184/900/600',
       '호텔 웨딩 전문 플래너 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer68@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer68@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-185/900/600',
       '호텔 웨딩 전문 플래너 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer68@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer68@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-186/900/600',
       '호텔 웨딩 전문 플래너 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer68@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer69@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '김플랜', '010-90069-0069', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer69@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer69@wedge.local'), 5, '예산 관리 전문 웨딩 플래너', '50명 내외 스몰 웨딩 기획 경험이 많아 세심한 진행이 가능합니다.', '14년차 웨딩 플래너 전문가입니다. 당일 현장 진행만 의뢰하셔도 매끄럽게 운영해 드립니다.', '예산관리,토탈플래닝,스몰웨딩', '인천', 902933, 14, 0, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer69@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer69@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-187/900/600',
       '예산 관리 전문 웨딩 플래너 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer69@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer69@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-188/900/600',
       '예산 관리 전문 웨딩 플래너 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer69@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer69@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-189/900/600',
       '예산 관리 전문 웨딩 플래너 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer69@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer70@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '윤플랜', '010-90070-0070', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer70@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer70@wedge.local'), 5, '당일 진행 전문 웨딩 플래너', '당일 현장 진행만 의뢰하셔도 매끄럽게 운영해 드립니다.', '4년차 웨딩 플래너 전문가입니다. 당일 현장 진행만 의뢰하셔도 매끄럽게 운영해 드립니다.', '토탈플래닝,당일진행,업체매칭', '부산', 923456, 4, 3, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer70@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer70@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-190/900/600',
       '당일 진행 전문 웨딩 플래너 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer70@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer70@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-191/900/600',
       '당일 진행 전문 웨딩 플래너 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer70@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer70@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-192/900/600',
       '당일 진행 전문 웨딩 플래너 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer70@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer71@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '강플랜', '010-90071-0071', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer71@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer71@wedge.local'), 5, '예산 관리 전문 웨딩 플래너', '당일 현장 진행만 의뢰하셔도 매끄럽게 운영해 드립니다.', '9년차 웨딩 플래너 전문가입니다. 당일 현장 진행만 의뢰하셔도 매끄럽게 운영해 드립니다.', '당일진행,업체매칭,스몰웨딩', '인천', 1027775, 9, 14, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer71@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer71@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-193/900/600',
       '예산 관리 전문 웨딩 플래너 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer71@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer71@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-194/900/600',
       '예산 관리 전문 웨딩 플래너 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer71@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer71@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-195/900/600',
       '예산 관리 전문 웨딩 플래너 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer71@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer72@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '신플랜', '010-90072-0072', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer72@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer72@wedge.local'), 5, '업체 매칭부터 진행까지 풀 케어', '준비 과정 전반의 커뮤니케이션을 도맡아 신랑신부의 부담을 줄여드립니다.', '13년차 웨딩 플래너 전문가입니다. 준비 과정 전반의 커뮤니케이션을 도맡아 신랑신부의 부담을 줄여드립니다.', '예산관리,토탈플래닝,스몰웨딩', '울산', 1135313, 13, 20, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer72@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer72@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-196/900/600',
       '업체 매칭부터 진행까지 풀 케어 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer72@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer72@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-197/900/600',
       '업체 매칭부터 진행까지 풀 케어 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer72@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer72@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-198/900/600',
       '업체 매칭부터 진행까지 풀 케어 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer72@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer73@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '한플랜', '010-90073-0073', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer73@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer73@wedge.local'), 5, '호텔 웨딩 전문 플래너', '50명 내외 스몰 웨딩 기획 경험이 많아 세심한 진행이 가능합니다.', '8년차 웨딩 플래너 전문가입니다. 준비 과정 전반의 커뮤니케이션을 도맡아 신랑신부의 부담을 줄여드립니다.', '업체매칭,당일진행,예산관리', '제주', 956008, 8, 12, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer73@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer73@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-199/900/600',
       '호텔 웨딩 전문 플래너 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer73@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer73@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-200/900/600',
       '호텔 웨딩 전문 플래너 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer73@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer73@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-201/900/600',
       '호텔 웨딩 전문 플래너 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer73@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer74@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '신플랜', '010-90074-0074', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer74@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer74@wedge.local'), 5, '호텔 웨딩 전문 플래너', '50명 내외 스몰 웨딩 기획 경험이 많아 세심한 진행이 가능합니다.', '1년차 웨딩 플래너 전문가입니다. 50명 내외 스몰 웨딩 기획 경험이 많아 세심한 진행이 가능합니다.', '스몰웨딩,토탈플래닝,업체매칭', '대구', 1042958, 1, 14, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer74@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer74@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-202/900/600',
       '호텔 웨딩 전문 플래너 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer74@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer74@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-203/900/600',
       '호텔 웨딩 전문 플래너 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer74@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer74@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-204/900/600',
       '호텔 웨딩 전문 플래너 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer74@wedge.local') LIMIT 1) AND sort_order = 3);

-- 카테고리 6 (주례·혼례사) : 목표 11명, 기존 1명, 신규 10명 추가

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer75@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '황예식', '010-90075-0075', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer75@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer75@wedge.local'), 6, '전통 혼례사 진행 전문', '신랑신부의 이야기를 진심으로 담아 따뜻한 주례를 진행합니다.', '7년차 주례·혼례사 전문가입니다. 너무 길지 않게 핵심만 담백하게 전달하는 스타일입니다.', '담백한진행,가족분위기,전통혼례', '대전', 415019, 7, 6, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer75@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer75@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-205/900/600',
       '전통 혼례사 진행 전문 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer75@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer75@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-206/900/600',
       '전통 혼례사 진행 전문 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer75@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer75@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-207/900/600',
       '전통 혼례사 진행 전문 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer75@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer76@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '신예식', '010-90076-0076', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer76@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer76@wedge.local'), 6, '가족 같은 분위기의 혼례 진행', '너무 길지 않게 핵심만 담백하게 전달하는 스타일입니다.', '1년차 주례·혼례사 전문가입니다. 양가 어르신도 편안하게 느낄 수 있는 부드러운 진행을 합니다.', '담백한진행,가족분위기,품격있는주례', '경기', 302422, 1, 17, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer76@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer76@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-208/900/600',
       '가족 같은 분위기의 혼례 진행 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer76@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer76@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-209/900/600',
       '가족 같은 분위기의 혼례 진행 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer76@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer76@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-210/900/600',
       '가족 같은 분위기의 혼례 진행 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer76@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer77@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '강예식', '010-90077-0077', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer77@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer77@wedge.local'), 6, '전통 혼례사 진행 전문', '양가 어르신도 편안하게 느낄 수 있는 부드러운 진행을 합니다.', '1년차 주례·혼례사 전문가입니다. 전통 혼례 방식의 격식 있는 진행 경험이 풍부합니다.', '담백한진행,품격있는주례,가족분위기', '수원', 222043, 1, 13, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer77@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer77@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-211/900/600',
       '전통 혼례사 진행 전문 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer77@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer77@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-212/900/600',
       '전통 혼례사 진행 전문 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer77@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer77@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-213/900/600',
       '전통 혼례사 진행 전문 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer77@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer78@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '김예식', '010-90078-0078', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer78@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer78@wedge.local'), 6, '품격 있는 주례사', '전통 혼례 방식의 격식 있는 진행 경험이 풍부합니다.', '7년차 주례·혼례사 전문가입니다. 양가 어르신도 편안하게 느낄 수 있는 부드러운 진행을 합니다.', '전통혼례,담백한진행,가족분위기', '대전', 301265, 7, 19, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer78@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer78@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-214/900/600',
       '품격 있는 주례사 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer78@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer78@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-215/900/600',
       '품격 있는 주례사 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer78@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer78@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-216/900/600',
       '품격 있는 주례사 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer78@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer79@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '임예식', '010-90079-0079', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer79@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer79@wedge.local'), 6, '짧고 담백한 주례 진행', '전통 혼례 방식의 격식 있는 진행 경험이 풍부합니다.', '4년차 주례·혼례사 전문가입니다. 신랑신부의 이야기를 진심으로 담아 따뜻한 주례를 진행합니다.', '전통혼례,담백한진행,가족분위기', '대구', 156535, 4, 23, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer79@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer79@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-217/900/600',
       '짧고 담백한 주례 진행 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer79@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer79@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-218/900/600',
       '짧고 담백한 주례 진행 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer79@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer79@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-219/900/600',
       '짧고 담백한 주례 진행 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer79@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer80@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '강예식', '010-90080-0080', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer80@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer80@wedge.local'), 6, '품격 있는 주례사', '양가 어르신도 편안하게 느낄 수 있는 부드러운 진행을 합니다.', '10년차 주례·혼례사 전문가입니다. 양가 어르신도 편안하게 느낄 수 있는 부드러운 진행을 합니다.', '가족분위기,전통혼례,담백한진행', '광주', 405073, 10, 6, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer80@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer80@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-220/900/600',
       '품격 있는 주례사 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer80@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer80@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-221/900/600',
       '품격 있는 주례사 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer80@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer80@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-222/900/600',
       '품격 있는 주례사 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer80@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer81@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '임예식', '010-90081-0081', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer81@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer81@wedge.local'), 6, '전통 혼례사 진행 전문', '신랑신부의 이야기를 진심으로 담아 따뜻한 주례를 진행합니다.', '7년차 주례·혼례사 전문가입니다. 너무 길지 않게 핵심만 담백하게 전달하는 스타일입니다.', '전통혼례,담백한진행,품격있는주례', '부산', 247184, 7, 25, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer81@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer81@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-223/900/600',
       '전통 혼례사 진행 전문 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer81@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer81@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-224/900/600',
       '전통 혼례사 진행 전문 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer81@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer81@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-225/900/600',
       '전통 혼례사 진행 전문 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer81@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer82@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '윤예식', '010-90082-0082', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer82@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer82@wedge.local'), 6, '유머 있는 주례사', '신랑신부의 이야기를 진심으로 담아 따뜻한 주례를 진행합니다.', '3년차 주례·혼례사 전문가입니다. 전통 혼례 방식의 격식 있는 진행 경험이 풍부합니다.', '품격있는주례,전통혼례,담백한진행', '서울', 272534, 3, 6, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer82@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer82@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-226/900/600',
       '유머 있는 주례사 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer82@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer82@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-227/900/600',
       '유머 있는 주례사 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer82@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer82@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-228/900/600',
       '유머 있는 주례사 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer82@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer83@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '장예식', '010-90083-0083', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer83@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer83@wedge.local'), 6, '전통 혼례사 진행 전문', '양가 어르신도 편안하게 느낄 수 있는 부드러운 진행을 합니다.', '14년차 주례·혼례사 전문가입니다. 양가 어르신도 편안하게 느낄 수 있는 부드러운 진행을 합니다.', '전통혼례,담백한진행,가족분위기', '수원', 421727, 14, 8, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer83@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer83@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-229/900/600',
       '전통 혼례사 진행 전문 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer83@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer83@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-230/900/600',
       '전통 혼례사 진행 전문 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer83@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer83@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-231/900/600',
       '전통 혼례사 진행 전문 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer83@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer84@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '신예식', '010-90084-0084', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer84@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer84@wedge.local'), 6, '차분한 진행의 주례사', '너무 길지 않게 핵심만 담백하게 전달하는 스타일입니다.', '15년차 주례·혼례사 전문가입니다. 전통 혼례 방식의 격식 있는 진행 경험이 풍부합니다.', '품격있는주례,가족분위기,전통혼례', '대구', 285618, 15, 21, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer84@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer84@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-232/900/600',
       '차분한 진행의 주례사 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer84@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer84@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-233/900/600',
       '차분한 진행의 주례사 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer84@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer84@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-234/900/600',
       '차분한 진행의 주례사 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer84@wedge.local') LIMIT 1) AND sort_order = 3);

-- 카테고리 7 (연주·밴드) : 목표 11명, 기존 1명, 신규 10명 추가

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer85@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '신뮤직', '010-90085-0085', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer85@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer85@wedge.local'), 7, '식전 연주 전문팀', '현악 2~4중주 편성으로 클래식과 팝 레퍼토리 모두 소화 가능합니다.', '13년차 연주·밴드 전문가입니다. 식전 연주부터 입장곡까지 분위기에 맞춘 라이브 연주를 제공합니다.', '현악중주,라이브연주,편곡가능', '대전', 805991, 13, 13, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer85@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer85@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-235/900/600',
       '식전 연주 전문팀 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer85@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer85@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-236/900/600',
       '식전 연주 전문팀 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer85@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer85@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-237/900/600',
       '식전 연주 전문팀 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer85@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer86@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '오뮤직', '010-90086-0086', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer86@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer86@wedge.local'), 7, '클래식·팝 모두 가능한 연주팀', '현악 2~4중주 편성으로 클래식과 팝 레퍼토리 모두 소화 가능합니다.', '7년차 연주·밴드 전문가입니다. 현악 2~4중주 편성으로 클래식과 팝 레퍼토리 모두 소화 가능합니다.', '식전연주,음향포함,편곡가능', '대구', 807749, 7, 24, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer86@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer86@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-238/900/600',
       '클래식·팝 모두 가능한 연주팀 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer86@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer86@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-239/900/600',
       '클래식·팝 모두 가능한 연주팀 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer86@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer86@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-240/900/600',
       '클래식·팝 모두 가능한 연주팀 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer86@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer87@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '서뮤직', '010-90087-0087', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer87@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer87@wedge.local'), 7, '야외 웨딩 음향 포함 연주팀', '현악 2~4중주 편성으로 클래식과 팝 레퍼토리 모두 소화 가능합니다.', '2년차 연주·밴드 전문가입니다. 신랑신부가 원하는 곡으로 편곡 작업도 가능합니다.', '음향포함,식전연주,라이브연주', '제주', 681935, 2, 30, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer87@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer87@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-241/900/600',
       '야외 웨딩 음향 포함 연주팀 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer87@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer87@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-242/900/600',
       '야외 웨딩 음향 포함 연주팀 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer87@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer87@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-243/900/600',
       '야외 웨딩 음향 포함 연주팀 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer87@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer88@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '윤뮤직', '010-90088-0088', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer88@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer88@wedge.local'), 7, '클래식·팝 모두 가능한 연주팀', '식전 연주부터 입장곡까지 분위기에 맞춘 라이브 연주를 제공합니다.', '2년차 연주·밴드 전문가입니다. 식전 연주부터 입장곡까지 분위기에 맞춘 라이브 연주를 제공합니다.', '식전연주,음향포함,현악중주', '인천', 791569, 2, 30, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer88@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer88@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-244/900/600',
       '클래식·팝 모두 가능한 연주팀 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer88@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer88@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-245/900/600',
       '클래식·팝 모두 가능한 연주팀 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer88@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer88@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-246/900/600',
       '클래식·팝 모두 가능한 연주팀 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer88@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer89@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '오뮤직', '010-90089-0089', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer89@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer89@wedge.local'), 7, '야외 웨딩 음향 포함 연주팀', '야외 웨딩 환경에 맞춘 음향 장비까지 함께 준비해 드립니다.', '13년차 연주·밴드 전문가입니다. 신랑신부가 원하는 곡으로 편곡 작업도 가능합니다.', '편곡가능,음향포함,식전연주', '인천', 937521, 13, 28, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer89@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer89@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-247/900/600',
       '야외 웨딩 음향 포함 연주팀 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer89@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer89@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-248/900/600',
       '야외 웨딩 음향 포함 연주팀 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer89@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer89@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-249/900/600',
       '야외 웨딩 음향 포함 연주팀 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer89@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer90@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '이뮤직', '010-90090-0090', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer90@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer90@wedge.local'), 7, '식전 연주 전문팀', '신랑신부가 원하는 곡으로 편곡 작업도 가능합니다.', '11년차 연주·밴드 전문가입니다. 신랑신부가 원하는 곡으로 편곡 작업도 가능합니다.', '라이브연주,식전연주,편곡가능', '대구', 931567, 11, 28, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer90@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer90@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-250/900/600',
       '식전 연주 전문팀 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer90@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer90@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-251/900/600',
       '식전 연주 전문팀 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer90@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer90@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-252/900/600',
       '식전 연주 전문팀 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer90@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer91@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '임뮤직', '010-90091-0091', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer91@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer91@wedge.local'), 7, '야외 웨딩 음향 포함 연주팀', '현악 2~4중주 편성으로 클래식과 팝 레퍼토리 모두 소화 가능합니다.', '10년차 연주·밴드 전문가입니다. 현악 2~4중주 편성으로 클래식과 팝 레퍼토리 모두 소화 가능합니다.', '현악중주,음향포함,식전연주', '대전', 801831, 10, 24, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer91@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer91@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-253/900/600',
       '야외 웨딩 음향 포함 연주팀 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer91@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer91@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-254/900/600',
       '야외 웨딩 음향 포함 연주팀 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer91@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer91@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-255/900/600',
       '야외 웨딩 음향 포함 연주팀 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer91@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer92@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '윤뮤직', '010-90092-0092', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer92@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer92@wedge.local'), 7, '라이브 웨딩 밴드 섭외', '식전 연주부터 입장곡까지 분위기에 맞춘 라이브 연주를 제공합니다.', '5년차 연주·밴드 전문가입니다. 현악 2~4중주 편성으로 클래식과 팝 레퍼토리 모두 소화 가능합니다.', '편곡가능,음향포함,식전연주', '부산', 790049, 5, 7, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer92@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer92@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-256/900/600',
       '라이브 웨딩 밴드 섭외 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer92@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer92@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-257/900/600',
       '라이브 웨딩 밴드 섭외 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer92@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer92@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-258/900/600',
       '라이브 웨딩 밴드 섭외 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer92@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer93@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '임뮤직', '010-90093-0093', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer93@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer93@wedge.local'), 7, '라이브 웨딩 밴드 섭외', '현악 2~4중주 편성으로 클래식과 팝 레퍼토리 모두 소화 가능합니다.', '10년차 연주·밴드 전문가입니다. 신랑신부가 원하는 곡으로 편곡 작업도 가능합니다.', '라이브연주,음향포함,현악중주', '대구', 934895, 10, 30, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer93@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer93@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-259/900/600',
       '라이브 웨딩 밴드 섭외 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer93@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer93@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-260/900/600',
       '라이브 웨딩 밴드 섭외 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer93@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer93@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-261/900/600',
       '라이브 웨딩 밴드 섭외 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer93@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer94@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '장뮤직', '010-90094-0094', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer94@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer94@wedge.local'), 7, '피아노 단독 웨딩 연주', '현악 2~4중주 편성으로 클래식과 팝 레퍼토리 모두 소화 가능합니다.', '11년차 연주·밴드 전문가입니다. 야외 웨딩 환경에 맞춘 음향 장비까지 함께 준비해 드립니다.', '음향포함,식전연주,라이브연주', '경기', 736625, 11, 5, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer94@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer94@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-262/900/600',
       '피아노 단독 웨딩 연주 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer94@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer94@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-263/900/600',
       '피아노 단독 웨딩 연주 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer94@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer94@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-264/900/600',
       '피아노 단독 웨딩 연주 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer94@wedge.local') LIMIT 1) AND sort_order = 3);

-- 카테고리 8 (축가) : 목표 15명, 기존 2명, 신규 13명 추가

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer95@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '오보컬', '010-90095-0095', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer95@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer95@wedge.local'), 8, '라이브 반주 축가 가수', '짧은 시간 내에도 인상적인 무대를 만들어 드립니다.', '8년차 축가 전문가입니다. 풍부한 성량과 감성적인 음색으로 식장 분위기를 채워드립니다.', '라이브반주,발라드,듀엣축가', '부산', 289298, 8, 18, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer95@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer95@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-265/900/600',
       '라이브 반주 축가 가수 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer95@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer95@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-266/900/600',
       '라이브 반주 축가 가수 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer95@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer95@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-267/900/600',
       '라이브 반주 축가 가수 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer95@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer96@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '신보컬', '010-90096-0096', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer96@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer96@wedge.local'), 8, '잔잔한 음색의 축가', 'MR보다 라이브 악기 반주를 선호하시는 분께 추천드립니다.', '7년차 축가 전문가입니다. 듀엣 축가도 가능하며, 곡 선정도 함께 상의해 드립니다.', '라이브반주,솔로축가,발라드', '수원', 497576, 7, 25, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer96@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer96@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-268/900/600',
       '잔잔한 음색의 축가 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer96@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer96@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-269/900/600',
       '잔잔한 음색의 축가 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer96@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer96@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-270/900/600',
       '잔잔한 음색의 축가 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer96@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer97@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '서보컬', '010-90097-0097', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer97@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer97@wedge.local'), 8, '감미로운 솔로 축가', '풍부한 성량과 감성적인 음색으로 식장 분위기를 채워드립니다.', '11년차 축가 전문가입니다. 짧은 시간 내에도 인상적인 무대를 만들어 드립니다.', '발라드,듀엣축가,라이브반주', '수원', 314140, 11, 15, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer97@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer97@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-271/900/600',
       '감미로운 솔로 축가 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer97@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer97@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-272/900/600',
       '감미로운 솔로 축가 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer97@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer97@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-273/900/600',
       '감미로운 솔로 축가 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer97@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer98@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '오보컬', '010-90098-0098', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer98@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer98@wedge.local'), 8, '라이브 반주 축가 가수', '듀엣 축가도 가능하며, 곡 선정도 함께 상의해 드립니다.', '6년차 축가 전문가입니다. 듀엣 축가도 가능하며, 곡 선정도 함께 상의해 드립니다.', '듀엣축가,솔로축가,발라드', '수원', 332634, 6, 29, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer98@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer98@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-274/900/600',
       '라이브 반주 축가 가수 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer98@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer98@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-275/900/600',
       '라이브 반주 축가 가수 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer98@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer98@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-276/900/600',
       '라이브 반주 축가 가수 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer98@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer99@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '신보컬', '010-90099-0099', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer99@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer99@wedge.local'), 8, '감동적인 발라드 축가', '듀엣 축가도 가능하며, 곡 선정도 함께 상의해 드립니다.', '12년차 축가 전문가입니다. 듀엣 축가도 가능하며, 곡 선정도 함께 상의해 드립니다.', '솔로축가,라이브반주,듀엣축가', '경기', 477829, 12, 29, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer99@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer99@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-277/900/600',
       '감동적인 발라드 축가 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer99@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer99@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-278/900/600',
       '감동적인 발라드 축가 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer99@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer99@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-279/900/600',
       '감동적인 발라드 축가 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer99@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer100@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '조보컬', '010-90100-0100', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer100@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer100@wedge.local'), 8, '라이브 반주 축가 가수', '풍부한 성량과 감성적인 음색으로 식장 분위기를 채워드립니다.', '4년차 축가 전문가입니다. 풍부한 성량과 감성적인 음색으로 식장 분위기를 채워드립니다.', '발라드,라이브반주,솔로축가', '대전', 382614, 4, 25, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer100@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer100@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-280/900/600',
       '라이브 반주 축가 가수 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer100@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer100@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-281/900/600',
       '라이브 반주 축가 가수 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer100@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer100@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-282/900/600',
       '라이브 반주 축가 가수 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer100@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer101@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '최보컬', '010-90101-0101', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer101@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer101@wedge.local'), 8, '팝송 레퍼토리 축가 가수', '짧은 시간 내에도 인상적인 무대를 만들어 드립니다.', '13년차 축가 전문가입니다. 짧은 시간 내에도 인상적인 무대를 만들어 드립니다.', '발라드,솔로축가,듀엣축가', '수원', 460128, 13, 13, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer101@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer101@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-283/900/600',
       '팝송 레퍼토리 축가 가수 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer101@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer101@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-284/900/600',
       '팝송 레퍼토리 축가 가수 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer101@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer101@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-285/900/600',
       '팝송 레퍼토리 축가 가수 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer101@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer102@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '장보컬', '010-90102-0102', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer102@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer102@wedge.local'), 8, '듀엣 축가 전문', '듀엣 축가도 가능하며, 곡 선정도 함께 상의해 드립니다.', '3년차 축가 전문가입니다. 짧은 시간 내에도 인상적인 무대를 만들어 드립니다.', '발라드,듀엣축가,솔로축가', '대전', 313322, 3, 17, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer102@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer102@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-286/900/600',
       '듀엣 축가 전문 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer102@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer102@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-287/900/600',
       '듀엣 축가 전문 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer102@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer102@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-288/900/600',
       '듀엣 축가 전문 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer102@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer103@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '최보컬', '010-90103-0103', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer103@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer103@wedge.local'), 8, '팝송 레퍼토리 축가 가수', 'MR보다 라이브 악기 반주를 선호하시는 분께 추천드립니다.', '4년차 축가 전문가입니다. MR보다 라이브 악기 반주를 선호하시는 분께 추천드립니다.', '발라드,듀엣축가,솔로축가', '제주', 390117, 4, 30, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer103@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer103@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-289/900/600',
       '팝송 레퍼토리 축가 가수 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer103@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer103@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-290/900/600',
       '팝송 레퍼토리 축가 가수 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer103@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer103@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-291/900/600',
       '팝송 레퍼토리 축가 가수 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer103@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer104@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '정보컬', '010-90104-0104', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer104@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer104@wedge.local'), 8, '라이브 반주 축가 가수', '풍부한 성량과 감성적인 음색으로 식장 분위기를 채워드립니다.', '13년차 축가 전문가입니다. 풍부한 성량과 감성적인 음색으로 식장 분위기를 채워드립니다.', '솔로축가,발라드,듀엣축가', '광주', 511357, 13, 4, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer104@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer104@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-292/900/600',
       '라이브 반주 축가 가수 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer104@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer104@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-293/900/600',
       '라이브 반주 축가 가수 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer104@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer104@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-294/900/600',
       '라이브 반주 축가 가수 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer104@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer105@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '강보컬', '010-90105-0105', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer105@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer105@wedge.local'), 8, '라이브 반주 축가 가수', '듀엣 축가도 가능하며, 곡 선정도 함께 상의해 드립니다.', '5년차 축가 전문가입니다. MR보다 라이브 악기 반주를 선호하시는 분께 추천드립니다.', '발라드,라이브반주,솔로축가', '수원', 265967, 5, 29, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer105@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer105@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-295/900/600',
       '라이브 반주 축가 가수 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer105@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer105@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-296/900/600',
       '라이브 반주 축가 가수 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer105@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer105@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-297/900/600',
       '라이브 반주 축가 가수 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer105@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer106@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '오보컬', '010-90106-0106', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer106@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer106@wedge.local'), 8, '감동적인 발라드 축가', 'MR보다 라이브 악기 반주를 선호하시는 분께 추천드립니다.', '4년차 축가 전문가입니다. 듀엣 축가도 가능하며, 곡 선정도 함께 상의해 드립니다.', '듀엣축가,솔로축가,발라드', '울산', 330888, 4, 12, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer106@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer106@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-298/900/600',
       '감동적인 발라드 축가 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer106@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer106@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-299/900/600',
       '감동적인 발라드 축가 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer106@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer106@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-300/900/600',
       '감동적인 발라드 축가 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer106@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer107@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '김보컬', '010-90107-0107', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer107@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer107@wedge.local'), 8, '듀엣 축가 전문', '풍부한 성량과 감성적인 음색으로 식장 분위기를 채워드립니다.', '10년차 축가 전문가입니다. 풍부한 성량과 감성적인 음색으로 식장 분위기를 채워드립니다.', '솔로축가,라이브반주,듀엣축가', '수원', 504767, 10, 12, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer107@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer107@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-301/900/600',
       '듀엣 축가 전문 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer107@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer107@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-302/900/600',
       '듀엣 축가 전문 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer107@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer107@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-303/900/600',
       '듀엣 축가 전문 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer107@wedge.local') LIMIT 1) AND sort_order = 3);

-- 카테고리 9 (사회자) : 목표 11명, 기존 2명, 신규 9명 추가

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer108@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '오엠씨', '010-90108-0108', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer108@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer108@wedge.local'), 9, '10년 경력 웨딩 사회자', '편지 낭독 같은 깜짝 이벤트 코너도 매끄럽게 진행합니다.', '9년차 사회자 전문가입니다. 양가 부모님 소개를 정중하고 따뜻하게 진행해 드립니다.', '센스있는진행,이벤트진행,양가소개', '대구', 561568, 9, 9, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer108@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer108@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-304/900/600',
       '10년 경력 웨딩 사회자 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer108@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer108@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-305/900/600',
       '10년 경력 웨딩 사회자 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer108@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer108@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-306/900/600',
       '10년 경력 웨딩 사회자 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer108@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer109@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '강엠씨', '010-90109-0109', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer109@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer109@wedge.local'), 9, '센스있는 웨딩 사회자', '편지 낭독 같은 깜짝 이벤트 코너도 매끄럽게 진행합니다.', '14년차 사회자 전문가입니다. 과하지 않으면서도 분위기를 살리는 진행을 지향합니다.', '센스있는진행,이벤트진행,양가소개', '서울', 403674, 14, 24, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer109@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer109@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-307/900/600',
       '센스있는 웨딩 사회자 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer109@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer109@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-308/900/600',
       '센스있는 웨딩 사회자 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer109@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer109@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-309/900/600',
       '센스있는 웨딩 사회자 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer109@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer110@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '최엠씨', '010-90110-0110', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer110@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer110@wedge.local'), 9, '전문 웨딩 MC', '편지 낭독 같은 깜짝 이벤트 코너도 매끄럽게 진행합니다.', '15년차 사회자 전문가입니다. 유연한 진행과 센스있는 멘트로 식장 분위기를 자연스럽게 이끌어갑니다.', '이벤트진행,양가소개,센스있는진행', '울산', 352036, 15, 22, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer110@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer110@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-310/900/600',
       '전문 웨딩 MC 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer110@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer110@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-311/900/600',
       '전문 웨딩 MC 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer110@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer110@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-312/900/600',
       '전문 웨딩 MC 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer110@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer111@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '임엠씨', '010-90111-0111', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer111@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer111@wedge.local'), 9, '센스있는 웨딩 사회자', '유연한 진행과 센스있는 멘트로 식장 분위기를 자연스럽게 이끌어갑니다.', '12년차 사회자 전문가입니다. 과하지 않으면서도 분위기를 살리는 진행을 지향합니다.', '센스있는진행,차분한MC,양가소개', '서울', 357063, 12, 20, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer111@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer111@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-313/900/600',
       '센스있는 웨딩 사회자 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer111@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer111@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-314/900/600',
       '센스있는 웨딩 사회자 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer111@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer111@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-315/900/600',
       '센스있는 웨딩 사회자 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer111@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer112@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '정엠씨', '010-90112-0112', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer112@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer112@wedge.local'), 9, '전문 웨딩 MC', '과하지 않으면서도 분위기를 살리는 진행을 지향합니다.', '5년차 사회자 전문가입니다. 양가 부모님 소개를 정중하고 따뜻하게 진행해 드립니다.', '양가소개,차분한MC,이벤트진행', '수원', 445803, 5, 11, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer112@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer112@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-316/900/600',
       '전문 웨딩 MC 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer112@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer112@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-317/900/600',
       '전문 웨딩 MC 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer112@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer112@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-318/900/600',
       '전문 웨딩 MC 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer112@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer113@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '장엠씨', '010-90113-0113', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer113@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer113@wedge.local'), 9, '유머러스한 결혼식 사회자', '과하지 않으면서도 분위기를 살리는 진행을 지향합니다.', '15년차 사회자 전문가입니다. 과하지 않으면서도 분위기를 살리는 진행을 지향합니다.', '차분한MC,양가소개,이벤트진행', '서울', 385241, 15, 24, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer113@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer113@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-319/900/600',
       '유머러스한 결혼식 사회자 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer113@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer113@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-320/900/600',
       '유머러스한 결혼식 사회자 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer113@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer113@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-321/900/600',
       '유머러스한 결혼식 사회자 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer113@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer114@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '최엠씨', '010-90114-0114', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer114@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer114@wedge.local'), 9, '이벤트 진행까지 가능한 사회자', '과하지 않으면서도 분위기를 살리는 진행을 지향합니다.', '14년차 사회자 전문가입니다. 유연한 진행과 센스있는 멘트로 식장 분위기를 자연스럽게 이끌어갑니다.', '이벤트진행,양가소개,센스있는진행', '제주', 597214, 14, 24, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer114@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer114@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-322/900/600',
       '이벤트 진행까지 가능한 사회자 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer114@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer114@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-323/900/600',
       '이벤트 진행까지 가능한 사회자 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer114@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer114@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-324/900/600',
       '이벤트 진행까지 가능한 사회자 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer114@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer115@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '윤엠씨', '010-90115-0115', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer115@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer115@wedge.local'), 9, '10년 경력 웨딩 사회자', '편지 낭독 같은 깜짝 이벤트 코너도 매끄럽게 진행합니다.', '10년차 사회자 전문가입니다. 편지 낭독 같은 깜짝 이벤트 코너도 매끄럽게 진행합니다.', '센스있는진행,이벤트진행,양가소개', '서울', 586647, 10, 3, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer115@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer115@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-325/900/600',
       '10년 경력 웨딩 사회자 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer115@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer115@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-326/900/600',
       '10년 경력 웨딩 사회자 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer115@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer115@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-327/900/600',
       '10년 경력 웨딩 사회자 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer115@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer116@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '윤엠씨', '010-90116-0116', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer116@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer116@wedge.local'), 9, '전문 웨딩 MC', '과하지 않으면서도 분위기를 살리는 진행을 지향합니다.', '6년차 사회자 전문가입니다. 양가 부모님 소개를 정중하고 따뜻하게 진행해 드립니다.', '차분한MC,센스있는진행,이벤트진행', '대전', 639180, 6, 16, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer116@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer116@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-328/900/600',
       '전문 웨딩 MC 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer116@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer116@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-329/900/600',
       '전문 웨딩 MC 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer116@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer116@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-330/900/600',
       '전문 웨딩 MC 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer116@wedge.local') LIMIT 1) AND sort_order = 3);

-- 카테고리 10 (기타) : 목표 16명, 기존 1명, 신규 15명 추가

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer117@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '정토탈', '010-90117-0117', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer117@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer117@wedge.local'), 10, '청첩장 디자인 전문', '환영판, 청첩장에 들어가는 캘리그라피 작업을 전문으로 합니다.', '14년차 기타 전문가입니다. 예식장 이동용 웨딩카 대여와 기사 섭외를 함께 진행합니다.', '답례품,캘리그라피,웨딩카', '제주', 515911, 14, 14, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer117@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer117@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-331/900/600',
       '청첩장 디자인 전문 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer117@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer117@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-332/900/600',
       '청첩장 디자인 전문 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer117@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer117@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-333/900/600',
       '청첩장 디자인 전문 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer117@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer118@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '오토탈', '010-90118-0118', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer118@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer118@wedge.local'), 10, '결혼 준비 컨설팅', '기타 분류에 속하는 다양한 웨딩 부가 서비스를 제공합니다.', '5년차 기타 전문가입니다. 환영판, 청첩장에 들어가는 캘리그라피 작업을 전문으로 합니다.', '토탈케어,청첩장디자인,웨딩카', '경기', 550689, 5, 18, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer118@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer118@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-334/900/600',
       '결혼 준비 컨설팅 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer118@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer118@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-335/900/600',
       '결혼 준비 컨설팅 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer118@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer118@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-336/900/600',
       '결혼 준비 컨설팅 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer118@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer119@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '임토탈', '010-90119-0119', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer119@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer119@wedge.local'), 10, '청첩장 디자인 전문', '기타 분류에 속하는 다양한 웨딩 부가 서비스를 제공합니다.', '4년차 기타 전문가입니다. 환영판, 청첩장에 들어가는 캘리그라피 작업을 전문으로 합니다.', '토탈케어,답례품,청첩장디자인', '수원', 637319, 4, 30, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer119@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer119@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-337/900/600',
       '청첩장 디자인 전문 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer119@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer119@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-338/900/600',
       '청첩장 디자인 전문 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer119@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer119@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-339/900/600',
       '청첩장 디자인 전문 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer119@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer120@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '강토탈', '010-90120-0120', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer120@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer120@wedge.local'), 10, '웨딩 답례품 제작', '환영판, 청첩장에 들어가는 캘리그라피 작업을 전문으로 합니다.', '12년차 기타 전문가입니다. 예식장 이동용 웨딩카 대여와 기사 섭외를 함께 진행합니다.', '토탈케어,청첩장디자인,웨딩카', '인천', 426043, 12, 16, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer120@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer120@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-340/900/600',
       '웨딩 답례품 제작 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer120@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer120@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-341/900/600',
       '웨딩 답례품 제작 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer120@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer120@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-342/900/600',
       '웨딩 답례품 제작 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer120@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer121@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '권토탈', '010-90121-0121', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer121@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer121@wedge.local'), 10, '청첩장 디자인 전문', '예식장 이동용 웨딩카 대여와 기사 섭외를 함께 진행합니다.', '9년차 기타 전문가입니다. 예식장 이동용 웨딩카 대여와 기사 섭외를 함께 진행합니다.', '토탈케어,청첩장디자인,답례품', '대구', 468761, 9, 11, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer121@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer121@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-343/900/600',
       '청첩장 디자인 전문 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer121@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer121@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-344/900/600',
       '청첩장 디자인 전문 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer121@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer121@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-345/900/600',
       '청첩장 디자인 전문 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer121@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer122@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '최토탈', '010-90122-0122', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer122@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer122@wedge.local'), 10, '결혼 준비 컨설팅', '예식장 이동용 웨딩카 대여와 기사 섭외를 함께 진행합니다.', '14년차 기타 전문가입니다. 예식장 이동용 웨딩카 대여와 기사 섭외를 함께 진행합니다.', '토탈케어,청첩장디자인,웨딩카', '대전', 507813, 14, 12, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer122@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer122@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-346/900/600',
       '결혼 준비 컨설팅 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer122@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer122@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-347/900/600',
       '결혼 준비 컨설팅 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer122@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer122@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-348/900/600',
       '결혼 준비 컨설팅 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer122@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer123@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '정토탈', '010-90123-0123', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer123@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer123@wedge.local'), 10, '웨딩 답례품 제작', '예식장 이동용 웨딩카 대여와 기사 섭외를 함께 진행합니다.', '14년차 기타 전문가입니다. 모바일·종이 청첩장 디자인을 모두 작업 가능합니다.', '토탈케어,청첩장디자인,웨딩카', '제주', 638546, 14, 20, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer123@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer123@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-349/900/600',
       '웨딩 답례품 제작 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer123@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer123@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-350/900/600',
       '웨딩 답례품 제작 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer123@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer123@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-351/900/600',
       '웨딩 답례품 제작 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer123@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer124@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '한토탈', '010-90124-0124', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer124@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer124@wedge.local'), 10, '캘리그라피 작업 전문', '기타 분류에 속하는 다양한 웨딩 부가 서비스를 제공합니다.', '14년차 기타 전문가입니다. 환영판, 청첩장에 들어가는 캘리그라피 작업을 전문으로 합니다.', '토탈케어,청첩장디자인,캘리그라피', '광주', 615740, 14, 17, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer124@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer124@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-352/900/600',
       '캘리그라피 작업 전문 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer124@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer124@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-353/900/600',
       '캘리그라피 작업 전문 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer124@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer124@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-354/900/600',
       '캘리그라피 작업 전문 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer124@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer125@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '서토탈', '010-90125-0125', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer125@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer125@wedge.local'), 10, '결혼 준비 컨설팅', '환영판, 청첩장에 들어가는 캘리그라피 작업을 전문으로 합니다.', '9년차 기타 전문가입니다. 예식장 이동용 웨딩카 대여와 기사 섭외를 함께 진행합니다.', '청첩장디자인,캘리그라피,웨딩카', '서울', 512589, 9, 0, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer125@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer125@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-355/900/600',
       '결혼 준비 컨설팅 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer125@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer125@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-356/900/600',
       '결혼 준비 컨설팅 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer125@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer125@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-357/900/600',
       '결혼 준비 컨설팅 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer125@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer126@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '신토탈', '010-90126-0126', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer126@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer126@wedge.local'), 10, '청첩장 디자인 전문', '기타 분류에 속하는 다양한 웨딩 부가 서비스를 제공합니다.', '11년차 기타 전문가입니다. 예식장 이동용 웨딩카 대여와 기사 섭외를 함께 진행합니다.', '웨딩카,캘리그라피,청첩장디자인', '수원', 625500, 11, 26, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer126@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer126@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-358/900/600',
       '청첩장 디자인 전문 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer126@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer126@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-359/900/600',
       '청첩장 디자인 전문 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer126@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer126@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-360/900/600',
       '청첩장 디자인 전문 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer126@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer127@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '김토탈', '010-90127-0127', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer127@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer127@wedge.local'), 10, '웨딩카 대여 서비스', '환영판, 청첩장에 들어가는 캘리그라피 작업을 전문으로 합니다.', '2년차 기타 전문가입니다. 모바일·종이 청첩장 디자인을 모두 작업 가능합니다.', '웨딩카,청첩장디자인,토탈케어', '부산', 620170, 2, 11, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer127@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer127@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-361/900/600',
       '웨딩카 대여 서비스 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer127@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer127@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-362/900/600',
       '웨딩카 대여 서비스 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer127@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer127@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-363/900/600',
       '웨딩카 대여 서비스 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer127@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer128@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '박토탈', '010-90128-0128', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer128@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer128@wedge.local'), 10, '결혼 준비 컨설팅', '환영판, 청첩장에 들어가는 캘리그라피 작업을 전문으로 합니다.', '13년차 기타 전문가입니다. 예식장 이동용 웨딩카 대여와 기사 섭외를 함께 진행합니다.', '답례품,웨딩카,청첩장디자인', '인천', 623700, 13, 18, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer128@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer128@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-364/900/600',
       '결혼 준비 컨설팅 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer128@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer128@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-365/900/600',
       '결혼 준비 컨설팅 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer128@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer128@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-366/900/600',
       '결혼 준비 컨설팅 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer128@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer129@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '박토탈', '010-90129-0129', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer129@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer129@wedge.local'), 10, '웨딩카 대여 서비스', '환영판, 청첩장에 들어가는 캘리그라피 작업을 전문으로 합니다.', '12년차 기타 전문가입니다. 기타 분류에 속하는 다양한 웨딩 부가 서비스를 제공합니다.', '토탈케어,캘리그라피,청첩장디자인', '대구', 499656, 12, 12, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer129@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer129@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-367/900/600',
       '웨딩카 대여 서비스 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer129@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer129@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-368/900/600',
       '웨딩카 대여 서비스 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer129@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer129@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-369/900/600',
       '웨딩카 대여 서비스 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer129@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer130@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '장토탈', '010-90130-0130', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer130@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer130@wedge.local'), 10, '웨딩 답례품 제작', '예식장 이동용 웨딩카 대여와 기사 섭외를 함께 진행합니다.', '12년차 기타 전문가입니다. 모바일·종이 청첩장 디자인을 모두 작업 가능합니다.', '토탈케어,캘리그라피,답례품', '제주', 462577, 12, 18, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer130@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer130@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-370/900/600',
       '웨딩 답례품 제작 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer130@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer130@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-371/900/600',
       '웨딩 답례품 제작 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer130@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer130@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-372/900/600',
       '웨딩 답례품 제작 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer130@wedge.local') LIMIT 1) AND sort_order = 3);

INSERT INTO members (email, password, name, phone, role, status, provider, provider_id, created_at, updated_at)
SELECT 'freelancer131@wedge.local', '$2a$10$bo9IwOuoBfZPrirjku2kAe6yCeMR6ajU/Nq7uRXeAdMEr8vCj3eye', '권토탈', '010-90131-0131', 'FREELANCER', 'ACTIVE', 'LOCAL', NULL, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM members WHERE email = 'freelancer131@wedge.local');

INSERT INTO freelancer_profiles (member_id, category_id, title, introduction, self_introduction, keywords, region, price, career_years, bookmark_count, created_at, updated_at)
SELECT (SELECT id FROM members WHERE email = 'freelancer131@wedge.local'), 10, '웨딩카 대여 서비스', '예식장 이동용 웨딩카 대여와 기사 섭외를 함께 진행합니다.', '8년차 기타 전문가입니다. 기타 분류에 속하는 다양한 웨딩 부가 서비스를 제공합니다.', '답례품,캘리그라피,웨딩카', '수원', 507651, 8, 14, NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer131@wedge.local'));

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer131@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-373/900/600',
       '웨딩카 대여 서비스 작업 사례 1',
       1, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer131@wedge.local') LIMIT 1) AND sort_order = 1);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer131@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-374/900/600',
       '웨딩카 대여 서비스 작업 사례 2',
       2, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer131@wedge.local') LIMIT 1) AND sort_order = 2);

INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, client, industry, purpose, created_at, updated_at)
SELECT (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer131@wedge.local') LIMIT 1),
       'https://picsum.photos/seed/wedge-portfolio-new-375/900/600',
       '웨딩카 대여 서비스 작업 사례 3',
       3, '웨딩 클라이언트', '웨딩', '포트폴리오', NOW(), NOW()
WHERE NOT EXISTS (SELECT 1 FROM portfolios WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'freelancer131@wedge.local') LIMIT 1) AND sort_order = 3);
