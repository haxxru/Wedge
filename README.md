# 💍 Wedge - 웨딩 프리랜서 매칭 플랫폼

예비부부와 웨딩 프리랜서를 연결하는 매칭 플랫폼입니다.  
전문가 탐색부터 견적 문의, 예약, 리뷰까지 웨딩 준비의 전 과정을 하나의 서비스에서 제공합니다.

> **프로젝트 기간** : 2026.06.11 ~ 2026.06.24  
> **배포 URL** : [wedge-tawny.vercel.app](https://wedge-tawny.vercel.app)  
> **API 문서** : [api.wedge.o-r.kr/swagger-ui.html](https://api.wedge.o-r.kr/swagger-ui.html)

---

## 목차

- [주요 기능](#주요-기능)
- [기술 스택](#기술-스택)
- [시스템 아키텍처](#시스템-아키텍처)
- [CI/CD 파이프라인](#cicd-파이프라인)
- [ERD](#erd)
- [프로젝트 구조](#프로젝트-구조)
- [로컬 실행 방법](#로컬-실행-방법)

---

## 주요 기능

### 사용자
| 기능 | 설명 |
|------|------|
| **회원가입/로그인** | 이메일 인증(코드 발송) + 카카오/구글 소셜 로그인 |
| **역할 기반 접근** | 예비부부(CLIENT)와 프리랜서(FREELANCER) 역할 분리 |
| **JWT 인증** | Access Token + Refresh Token 기반 인증, 자동 갱신 |

### 전문가 탐색 & 매칭
| 기능 | 설명 |
|------|------|
| **전문가 검색** | 카테고리, 지역, 키워드 필터링 및 정렬 |
| **포트폴리오** | 프리랜서 작업물 갤러리 (다중 이미지) |
| **찜하기** | 관심 프리랜서 북마크 |
| **AI 추천** | OpenAI 기반 프리랜서 매칭 추천 |

### 예약 & 리뷰
| 기능 | 설명 |
|------|------|
| **예약 관리** | 요청 - 수락 - 완료 워크플로우 |
| **실시간 채팅** | WebSocket(STOMP) 기반 1:1 메시지, 읽음 확인 |
| **리뷰 시스템** | 별점(5점) + 텍스트 리뷰 |

### AI 기능
| 기능 | 설명 |
|------|------|
| **AI 견적 챗봇** | 3단계 대화를 통한 웨딩 예산 추정 (GPT-4o-mini) |
| **자기소개 생성** | 키워드 기반 프리랜서 소개글 자동 작성 |

### 구인 & 제안 상세
| 기능 | 설명 |
|------|------|
| **구인글 작성** | 카테고리, 예산, 웨딩 예정일, 지역 등 조건 설정 |
| **구인글 필터링** | 카테고리, 지역, 모집 상태(모집중/마감)별 필터 |
| **제안서 작성** | 프리랜서가 가격, 지역, 상세 내용으로 제안 |
| **제안서 관리** | 수락/거절 처리, 내가 보낸 제안 목록 조회 |
| **모집 상태 관리** | OPEN/CLOSED 상태 전환 |

### 커뮤니티
| 기능 | 설명 |
|------|------|
| **게시글 작성** | 이미지 첨부, 카테고리(웨딩 후기/꿀팁/게시판) 선택 |
| **게시글 목록** | 카테고리별 탭 필터링, 페이지네이션 |
| **게시글 수정/삭제** | 본인 게시글 관리 |
| **내 게시글** | 마이페이지에서 작성글 모아보기 |

---

## 기술 스택

### Backend

| 분류 | 기술 |
|------|------|
| Framework | Spring Boot 4.0.6 (Java 21) |
| Database | MySQL 8.0 |
| Cache | Redis |
| Auth | JWT + OAuth2 (Kakao, Google) |
| Real-time | WebSocket / STOMP |
| AI | Spring AI + OpenAI (GPT-4o-mini) |
| Storage | Cloudflare R2 (S3 호환) |
| Mail | Gmail SMTP (이메일 인증) |
| API Docs | SpringDoc OpenAPI (Swagger) |

### Frontend

| 분류 | 기술 |
|------|------|
| Framework | Next.js 16 (App Router) |
| Language | TypeScript 5 |
| Styling | Tailwind CSS 4 + shadcn/ui |
| State | React Query + Context API |
| Real-time | @stomp/stompjs |

### Infra & DevOps

| 분류 | 기술 |
|------|------|
| Frontend 배포 | Vercel |
| Backend 배포 | AWS EC2 (Docker) |
| HTTPS | Caddy (자동 SSL) |
| CI | GitHub Actions (빌드 & 테스트) |
| CD | GitHub Actions - Docker Hub - AWS SSH 배포 |
| Container | Docker + Docker Compose |

---

## 시스템 아키텍처

```
                         ┌──────────────┐
                         │   Client     │
                         │  (Browser)   │
                         └──────┬───────┘
                                │
                 ┌──────────────┴──────────────┐
                 ▼                              ▼
        ┌────────────────┐            ┌─────────────────┐
        │    Vercel       │            │   AWS EC2        │
        │                 │   HTTPS    │                  │
        │  Next.js 16     │ ────────>  │  Caddy (SSL)     │
        │  (Frontend)     │            │    |              │
        │                 │            │  Spring Boot      │
        └────────────────┘            │  (Backend:8080)   │
                                      │    |       |      │
                                      │  MySQL   Redis    │
                                      └─────────────────┘
                                              |
                                      ┌──────────────┐
                                      │ Cloudflare R2 │
                                      │ (File Storage)│
                                      └──────────────┘
```

---

## CI/CD 파이프라인

```
       조직 레포 (Team)
       ─────────────────
       feature/* ──PR──> dev ──PR──> main
                          │          │
                          └── CI     │
                         (빌드&테스트) │
                                     │
       ─────────────────────────────-┘
                          │  자동 sync (1h)
                          ▼
       개인 포크 (Fork)
       ─────────────────
       main 업데이트 ──> CD 자동 트리거
                          │
              ┌───────────┴───────────┐
              ▼                       ▼
        Docker Hub               AWS SSH
        이미지 Push              배포 반영
```

| 단계 | 트리거 | 자동/수동 |
|------|--------|-----------|
| CI (빌드 & 테스트) | dev push / PR | 자동 |
| 포크 동기화 | 1시간마다 | 자동 |
| CD (Docker - AWS 배포) | main push | 자동 |
| Vercel 프론트 배포 | main push | 자동 |

---

## ERD

```
┌──────────┐     ┌───────────────────┐     ┌────────────┐
│  Member   │────>│ FreelancerProfile │<────│  Category  │
│           │     │                   │     └────────────┘
│ id        │     │ id                │
│ email     │     │ title             │     ┌────────────┐
│ name      │     │ introduction      │────>│ Portfolio   │
│ role      │     │ region, price     │     │  └ Images   │
│ provider  │     │ careerYears       │     └────────────┘
└──────┬────┘     └────────┬──────────┘
       │                   │
       │    ┌──────────────┴──────────────┐
       │    ▼                              ▼
       │  ┌──────────────┐     ┌──────────────┐
       │  │  Reservation  │     │   Bookmark   │
       │  │               │     └──────────────┘
       │  │ status        │
       │  │ reservationDt │
       │  └──────┬────────┘
       │         │
       │    ┌────┴─────┐────────────┐
       │    ▼          ▼            ▼
       │ ┌────────┐ ┌────────┐ ┌────────┐
       │ │ Review │ │ChatRoom│ │  Chat  │
       │ │        │ │        │ │ Message│
       │ │ rating │ └────────┘ └────────┘
       │ └────────┘
       │
       ├──> ┌──────────────┐     ┌────────────┐
       │    │ RecruitPost   │<────│  Proposal  │
       │    │ (구인글)       │     │ (제안서)    │
       │    │ budget, date  │     │ price      │
       │    └──────────────┘     └────────────┘
       │
       └──> ┌──────────────┐
            │    Post       │
            │ (커뮤니티)     │
            └──────────────┘
```

---

## 프로젝트 구조

```
wedge/
├── backend/
│   └── src/main/java/com/wedge/backend/
│       ├── domain/
│       │   ├── member/          # 회원, 인증, OAuth
│       │   ├── freelancer/      # 프리랜서 프로필, 포트폴리오
│       │   ├── category/        # 서비스 카테고리
│       │   ├── recruit/         # 구인글
│       │   ├── proposal/        # 제안서
│       │   ├── reservations/    # 예약
│       │   ├── review/          # 리뷰
│       │   ├── chat/            # 실시간 채팅
│       │   ├── chatbot/         # AI 견적 챗봇
│       │   ├── community/       # 커뮤니티
│       │   └── bookmark/        # 찜하기
│       └── global/              # 보안, JWT, WebSocket, 설정
│
├── frontend/src/
│   ├── app/                     # Next.js 페이지
│   ├── components/              # 공통 컴포넌트, UI
│   ├── contexts/                # React Context (UserContext)
│   ├── hooks/                   # 커스텀 훅
│   ├── lib/                     # 유틸리티 (auth, fetch)
│   └── constants/               # 상수
│
├── .github/workflows/
│   ├── ci.yml                   # CI: 빌드 & 테스트
│   └── cd.yml                   # CD: Docker Hub -> AWS 배포
│
├── docker-compose.yml           # 로컬 개발용
├── docker-compose.prod.yml      # 운영 배포용
└── .env.example                 # 환경변수 템플릿
```

---

## 로컬 실행 방법

### 사전 요구사항
- Java 21, Node.js 18+, Docker

### Backend

```bash
cd backend
cp ../.env.example ../.env   # 환경변수 설정

# Docker로 실행 (MySQL + Redis + Backend)
docker compose up -d

# 또는 직접 실행
./gradlew bootRun
```

### Frontend

```bash
cd frontend
echo "NEXT_PUBLIC_API_URL=http://localhost:8080" > .env
npm install
npm run dev    # http://localhost:3000
```

### 환경변수

| 변수 | 설명 |
|------|------|
| `DB_USERNAME` / `DB_PASSWORD` | MySQL 인증 정보 |
| `JWT_SECRET` | JWT 서명 키 |
| `KAKAO_CLIENT_ID` / `SECRET` | 카카오 OAuth |
| `GOOGLE_CLIENT_ID` / `SECRET` | 구글 OAuth |
| `OPENAI_API_KEY` | OpenAI API 키 |
| `R2_ENDPOINT` / `BUCKET` / `ACCESS_KEY` / `SECRET_KEY` | Cloudflare R2 스토리지 |
| `MAIL_USERNAME` / `MAIL_PASSWORD` | Gmail SMTP (이메일 인증) |
| `FRONTEND_URL` | 프론트엔드 URL (CORS) |

---

## 팀원 소개

| 이름 | GitHub | 담당 |
|------|--------|------|
| 윤하빈 | <a href="https://github.com/yunabin"><img src="https://github.com/yunabin.png?size=80" width="30" height="30" style="border-radius:50%"/></a> [@yunabin](https://github.com/yunabin) | |
| 정민혁 | <a href="https://github.com/haxxru"><img src="https://github.com/haxxru.png?size=80" width="30" height="30" style="border-radius:50%"/></a> [@haxxru](https://github.com/haxxru) | |
| 이창민 | <a href="https://github.com/changmin41"><img src="https://github.com/changmin41.png?size=80" width="30" height="30" style="border-radius:50%"/></a> [@changmin41](https://github.com/changmin41) | |
| 이민서 | <a href="https://github.com/p7548296-afk"><img src="https://github.com/p7548296-afk.png?size=80" width="30" height="30" style="border-radius:50%"/></a> [@p7548296-afk](https://github.com/p7548296-afk) | |
