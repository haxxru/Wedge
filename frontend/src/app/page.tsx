"use client";

import { API_BASE_URL } from "@/lib/auth";
import { useQuery } from "@tanstack/react-query";
import "swiper/css";
import "swiper/css/effect-coverflow";
import "swiper/css/navigation";
import { Autoplay, EffectCoverflow, Navigation } from "swiper/modules";
import { Swiper, SwiperSlide } from "swiper/react";

import { buttonVariants } from "@/components/ui/button";
import { cn } from "@/lib/utils";
import Image from "next/image";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { useState } from "react";

type FeaturedFreelancer = {
  freelancerProfileId: number;
  memberName: string;
  title: string;
  price: number | null;
  portfolioImageUrl: string | null;
};

async function fetchFeaturedFreelancers(): Promise<FeaturedFreelancer[]> {
  const res = await fetch(`${API_BASE_URL}/api/freelancers/featured`);
  if (!res.ok) throw new Error("추천 프리랜서 목록 조회 실패");
  return res.json();
}

function formatPrice(price: number | null): string {
  return price ? `₩${price.toLocaleString()}~` : "협의";
}

const platformValues = [
  {
    img: "/icons/search.png",
    title: "전문가를 한 곳에서",
    desc: "스냅 작가부터 플래너까지\n키워드 검색으로 바로 비교하세요",
  },
  {
    img: "/icons/phone.png",
    title: "견적 문의, 바로 여기서",
    desc: "AI 챗봇으로 사전 견적을 받고\n원하는 전문가에게 바로 연결하세요",
  },
  {
    img: "/icons/calendar.png",
    title: "예약까지 한 번에",
    desc: "날짜 조율부터 예약 확정까지\n플랫폼 안에서 모두 완결됩니다",
  },
  {
    img: "/icons/portfolio.png",
    title: "검증된 포트폴리오",
    desc: "실제 작업물과 리뷰로 확인하고\n믿고 맡길 수 있는 전문가를 선택하세요",
  },
];

const platformFeatures = [
  {
    bg: "#e6ede3",
    img: "/icons/card3-ai-quote.svg",
    title: "AI로 사전 견적을 받아 보세요",
    desc: "원하는 서비스와 예산을 입력하면\nAI가 맞춤 견적을 먼저 제안해드려요.\n견적 후 바로 전문가 탐색까지 연결됩니다.",
    cta: "전문가 탐색하기",
    href: "/search",
  },
  {
    bg: "#fdf3e7",
    img: "/icons/card2-community.svg",
    title: "웨딩 후기와 꿀팁을 나눠요",
    desc: "실제 결혼을 준비한 예비부부들의\n생생한 후기와 알짜 꿀팁을 한 곳에서 만나 보세요.",
    cta: "커뮤니티 보기",
    href: "/community",
  },
  {
    bg: "#e8edd6",
    img: "/icons/card1-freelancer.svg",
    title: "프리랜서가 나를 찾아옵니다",
    desc: "원하는 조건과 예산을 올리면\n관심 있는 프리랜서가 직접 제안서를 보내 드려요.\n여러 제안을 비교하고 최적의 전문가를 선택하세요.",
    cta: "구인글 올리기",
    href: "/jobs",
  },
];

const calcArc = (swiper: any) => {
  const BASE_VW = 1280;
  const depth = (BASE_VW / 5) * 0.03;
  const lift = 20;

  swiper.slides.forEach((slide: any) => {
    const progress = slide.progress;
    const translateY =
      progress * progress * depth - lift * Math.max(0, 1 - Math.abs(progress));
    const rotate = progress * -3.5;
    const innerEl = slide.querySelector(".card-inner") as HTMLElement;
    if (innerEl) {
      innerEl.style.transform = `translateY(${translateY}px) rotate(${rotate}deg)`;
    }
  });
};

export default function HomePage() {
  const router = useRouter();
  const [keyword, setKeyword] = useState("");

  const { data: featured = [], isLoading: isFeaturedLoading } = useQuery({
    queryKey: ["featuredFreelancers"],
    queryFn: fetchFeaturedFreelancers,
  });

  const handleSearch = () => {
    if (keyword.trim()) {
      router.push(`/search?keyword=${encodeURIComponent(keyword.trim())}`);
    } else {
      router.push("/search");
    }
  };

  return (
    <div className="flex flex-col min-h-full bg-[#fbf9f2]">
      {/* 히어로 섹션 */}
      <section className="relative min-h-screen flex items-center overflow-hidden">
        {" "}
        <div className="absolute inset-0">
          <Image
            src="/hero.jpg"
            alt="웨딩 테이블 데코레이션"
            fill
            priority
            className="object-cover"
          />
          <div className="absolute inset-0 bg-[#fbf9f2]/75" />
        </div>
        <div className="relative max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex flex-col items-center text-center">
            <div className="w-full max-w-2xl">
              <h1 className="font-[var(--font-display)] text-4xl sm:text-5xl font-semibold text-[#1b1c18] leading-tight mb-8">
                설렘부터 완성까지,
                <br />
                <span className="text-[#4f6231]">딱 맞는 웨딩 전문가</span>를
                <br />
                찾아보세요
              </h1>

              {/* 검색바 */}
              <div className="flex items-center gap-2 bg-white rounded-2xl shadow-[0px_4px_20px_rgba(108,129,76,0.12)] p-2 mb-6">
                <div className="flex-1 flex items-center gap-2 px-4 py-2">
                  <svg
                    className="w-5 h-5 text-[#75786c] shrink-0"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      strokeWidth={2}
                      d="M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z"
                    />
                  </svg>
                  <input
                    value={keyword}
                    onChange={(e) => setKeyword(e.target.value)}
                    onKeyDown={(e) => e.key === "Enter" && handleSearch()}
                    className="flex-1 bg-transparent text-sm text-[#1b1c18] placeholder:text-[#75786c] outline-none"
                    placeholder="어떤 웨딩 전문가가 필요하세요?"
                  />
                </div>
                <button
                  onClick={handleSearch}
                  className={cn(
                    buttonVariants(),
                    "bg-[#4f6231] text-white hover:bg-[#677b47] rounded-xl px-6 shrink-0 cursor-pointer",
                  )}
                >
                  전문가 찾기
                </button>
              </div>

              {/* 빠른 카테고리 태그 */}
              <div className="flex flex-wrap gap-2 justify-center">
                {[
                  { label: "웨딩 사진작가", href: "/search?categoryId=1" },
                  { label: "웨딩 영상", href: "/search?categoryId=2" },
                  { label: "헤어·메이크업", href: "/search?categoryId=3" },
                  { label: "웨딩 플로리스트", href: "/search?categoryId=4" },
                  { label: "웨딩 플래너", href: "/search?categoryId=5" },
                  { label: "사회자", href: "/search?categoryId=9" },
                ].map((tag) => (
                  <Link
                    key={tag.label}
                    href={tag.href}
                    className="text-xs font-medium px-4 py-2 rounded-full bg-white border border-[#dddcd4] text-[#45483d] hover:border-[#4f6231] hover:text-[#4f6231] transition-colors"
                  >
                    {tag.label}
                  </Link>
                ))}
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* 인기 전문가 캐러셀 섹션 */}
      {!isFeaturedLoading && featured.length > 0 && (
        <section className="py-20 bg-[#fbf9f2] overflow-hidden relative">
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center mb-16">
            <h2 className="font-[var(--font-display)] text-3xl sm:text-4xl font-semibold text-[#1b1c18]">
              이번 달 가장 사랑받은{" "}
              <span className="text-[#4f6231]">웨딩 전문가</span>
            </h2>
          </div>
          <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative">
            <div
              style={{ height: "clamp(240px, 32vw, 440px)" }}
              className="relative"
            >
              <div
                className="absolute pointer-events-none"
                style={{
                  width: "50%",
                  height: "120%",
                  bottom: "-10%",
                  left: "50%",
                  transform: "translateX(-50%)",
                  background:
                    "radial-gradient(ellipse, #e8c9a0 0%, #f0d4b0 30%, transparent 70%)",
                  filter: "blur(64px)",
                  opacity: 0.7,
                  zIndex: 0,
                }}
              />
              <Swiper
                modules={[Navigation, EffectCoverflow, Autoplay]}
                effect="coverflow"
                grabCursor={true}
                centeredSlides={true}
                loop={true}
                autoplay={{
                  delay: 4000,
                  disableOnInteraction: false,
                  pauseOnMouseEnter: true,
                }}
                initialSlide={Math.floor(featured.length / 2)}
                spaceBetween={16}
                breakpoints={{
                  0: { slidesPerView: 3 },
                  640: { slidesPerView: 4 },
                  1024: { slidesPerView: 5 },
                }}
                coverflowEffect={{
                  rotate: 0,
                  stretch: 0,
                  depth: 0,
                  modifier: 1,
                  slideShadows: false,
                }}
                navigation={{ prevEl: ".feat-prev", nextEl: ".feat-next" }}
                onProgress={(swiper) => calcArc(swiper)}
                onResize={(swiper) => calcArc(swiper)}
                onSetTransition={(swiper, speed) => {
                  swiper.slides.forEach((slide) => {
                    const innerEl = slide.querySelector(
                      ".card-inner",
                    ) as HTMLElement;
                    if (innerEl)
                      innerEl.style.transitionDuration = `${speed}ms`;
                  });
                }}
                className="w-full !overflow-visible h-full"
                style={{ position: "relative", zIndex: 1 }}
              >
                {featured.map((pro, i) => (
                  <SwiperSlide
                    key={pro.freelancerProfileId}
                    className="!flex !items-center !overflow-visible"
                  >
                    {({ isActive }) => (
                      <div className="relative w-full">
                        <div className="card-inner transition-all duration-500 origin-center w-full">
                          <Link
                            href={`/profile/${pro.freelancerProfileId}`}
                            className="group block"
                          >
                            <div
                              className="relative overflow-hidden rounded-2xl transition-all duration-500 bg-[#f5f4ec] flex items-center justify-center"
                              style={{ aspectRatio: isActive ? "3/4" : "1/1" }}
                            >
                              {pro.portfolioImageUrl ? (
                                <Image
                                  src={pro.portfolioImageUrl}
                                  alt={pro.memberName}
                                  fill
                                  sizes="(max-width: 640px) 33vw, (max-width: 1024px) 25vw, 20vw"
                                  loading={i === 0 ? "eager" : "lazy"}
                                  className="object-cover group-hover:scale-105 transition-transform duration-500"
                                />
                              ) : (
                                <span className="text-[#75786c] text-xs">
                                  이미지 없음
                                </span>
                              )}
                              {isActive && (
                                <>
                                  <div className="absolute inset-0 bg-gradient-to-t from-black/50 to-transparent" />
                                  <div className="absolute bottom-4 left-4 right-4">
                                    <p className="text-white text-xs font-medium mb-1">
                                      {pro.title}
                                    </p>
                                    <h3 className="text-white font-bold text-base mb-1">
                                      {pro.memberName}
                                    </h3>
                                    <p className="text-white/80 text-xs">
                                      {formatPrice(pro.price)}
                                    </p>
                                  </div>
                                </>
                              )}
                            </div>
                          </Link>
                          {!isActive && (
                            <div className="mt-2 text-center">
                              <p className="text-[#75786c] text-xs mb-0.5 truncate">
                                {pro.title}
                              </p>
                              <h3 className="text-[#1b1c18] font-semibold text-xs sm:text-sm truncate">
                                {pro.memberName}
                              </h3>
                            </div>
                          )}
                        </div>
                      </div>
                    )}
                  </SwiperSlide>
                ))}
              </Swiper>
            </div>
            <div className="flex items-center justify-center gap-8 mt-1">
              <button className="feat-prev p-2 rounded-full border border-[#1b1c18] hover:bg-[#1b1c18]/5 transition-colors">
                <svg width="32" height="16" viewBox="0 0 48 24" fill="none">
                  <line
                    x1="48"
                    y1="12"
                    x2="8"
                    y2="12"
                    stroke="#1b1c18"
                    strokeWidth="1.5"
                  />
                  <polyline
                    points="20,2 8,12 20,22"
                    fill="none"
                    stroke="#1b1c18"
                    strokeWidth="1.5"
                    strokeLinejoin="round"
                  />
                </svg>
              </button>
              <button className="feat-next p-2 rounded-full border border-[#1b1c18] hover:bg-[#1b1c18]/5 transition-colors">
                <svg width="32" height="16" viewBox="0 0 48 24" fill="none">
                  <line
                    x1="0"
                    y1="12"
                    x2="40"
                    y2="12"
                    stroke="#1b1c18"
                    strokeWidth="1.5"
                  />
                  <polyline
                    points="28,2 40,12 28,22"
                    fill="none"
                    stroke="#1b1c18"
                    strokeWidth="1.5"
                    strokeLinejoin="round"
                  />
                </svg>
              </button>
            </div>
          </div>
        </section>
      )}

      {/* 플랫폼 가치 섹션 */}
      <section className="py-20 bg-[#fbf9f2]">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center mb-16">
            <h2 className="font-[var(--font-display)] text-3xl sm:text-4xl font-semibold text-[#1b1c18]">
              쉽고, 믿을 수 있는{" "}
              <span className="text-[#4f6231]">웨딩 준비</span>
            </h2>
          </div>
          <div className="grid grid-cols-2 lg:grid-cols-4 gap-8">
            {platformValues.map((item, i) => (
              <div
                key={i}
                className="flex flex-col items-center text-center gap-4"
              >
                {/* 이미지 */}
                <div className="w-32 h-32 flex items-center justify-center">
                  <Image
                    src={item.img}
                    alt={item.title}
                    width={120}
                    height={120}
                    className="object-contain drop-shadow-md"
                  />
                </div>
                {/* 텍스트 */}
                <div>
                  <h3 className="font-semibold text-[#1b1c18] text-base mb-2">
                    {item.title}
                  </h3>
                  <p className="text-sm text-[#75786c] leading-relaxed whitespace-pre-line">
                    {item.desc}
                  </p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Wedge 활용 섹션 */}
      <section className="py-20 bg-[#fbf9f2]">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="text-center mb-12">
            <h2 className="font-[var(--font-display)] text-3xl sm:text-4xl font-semibold text-[#1b1c18]">
              결혼 준비, 이렇게 하면 더 쉬워요
            </h2>
          </div>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            {platformFeatures.map((feat, i) => (
              <div
                key={i}
                className="flex flex-col rounded-2xl overflow-hidden bg-white border border-[#efeee7] hover:shadow-[0px_8px_30px_rgba(79,98,49,0.1)] transition-all group"
              >
                <div
                  className="relative h-48 flex items-center justify-center overflow-hidden"
                  style={{ backgroundColor: feat.bg }}
                >
                  <Image
                    src={feat.img}
                    alt={feat.title}
                    width={140}
                    height={140}
                    className="object-contain drop-shadow-md transition-transform duration-300 group-hover:scale-110"
                  />
                </div>
                <div className="flex flex-col flex-1 p-6 gap-3">
                  <h3 className="font-semibold text-[#1b1c18] text-lg leading-snug">
                    {feat.title}
                  </h3>
                  <p className="text-sm text-[#75786c] leading-relaxed whitespace-pre-line flex-1">
                    {feat.desc}
                  </p>
                  <Link
                    href={feat.href}
                    className="mt-2 inline-flex items-center gap-1 text-sm font-medium text-[#4f6231] border border-[#4f6231] rounded-lg px-4 py-2 hover:bg-[#4f6231] hover:text-white transition-colors w-fit"
                  >
                    {feat.cta} →
                  </Link>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>
    </div>
  );
}
