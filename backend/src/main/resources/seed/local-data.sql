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
-- 포트폴리오
-- =============================================
INSERT INTO portfolios (freelancer_profile_id, image_url, description, sort_order, created_at, updated_at)
SELECT
    (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'test-freelancer@wedge.local' LIMIT 1) LIMIT 1),
    'https://picsum.photos/seed/wedge-portfolio-1/800/600',
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
    'https://picsum.photos/seed/wedge-portfolio-2/800/600',
    '실내 예식과 리허설 컷을 가정한 두 번째 포트폴리오 샘플입니다.',
    2,
    '2026-06-15 12:00:00',
    '2026-06-15 12:00:00'
WHERE NOT EXISTS (
    SELECT 1 FROM portfolios
    WHERE freelancer_profile_id = (SELECT id FROM freelancer_profiles WHERE member_id = (SELECT id FROM members WHERE email = 'test-freelancer@wedge.local' LIMIT 1) LIMIT 1)
      AND sort_order = 2
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
-- 목적: featured 캐러셀(최근 30일 리뷰 랭킹 + 찜 fallback) 및 카테고리 검색 테스트
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
-- 마커(request_message)로 멱등성 보장: NOW()-INTERVAL 값은 최초 1회만 계산되어 고정됩니다.
-- - test-freelancer: 최근 30일 내 4건 → 1위 후보
-- - freelancer3   : 최근 30일 내 3건 → 2위 후보
-- - freelancer6   : 최근 30일 내 2건 → 3위 후보
-- - freelancer9   : 최근 30일 내 1건 → 4위 후보
-- - freelancer2   : 30일보다 오래된 리뷰만 2건 → 랭킹에서 제외되어야 정상
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

-- 일부러 30일보다 오래된 리뷰 (랭킹에서 제외되어야 함)
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

-- 위 예약들에 대응하는 리뷰 (reservation_id는 마커로 찾아옵니다)
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