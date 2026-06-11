import Link from "next/link";
import Image from "next/image";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import { cn } from "@/lib/utils";
import { buttonVariants } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";

const categories = [
  { icon: "📸", label: "스냅 작가", href: "/search?category=photographer" },
  { icon: "💐", label: "플라워", href: "/search?category=flower" },
  { icon: "🏛️", label: "베뉴", href: "/search?category=venue" },
  { icon: "🍽️", label: "케이터링", href: "/search?category=catering" },
  { icon: "🎵", label: "뮤직", href: "/search?category=music" },
  { icon: "📋", label: "플래너", href: "/search?category=planning" },
];

const featured = [
  {
    id: "1",
    name: "Julian Moore",
    title: "에디토리얼 포토그래퍼",
    rating: 4.9,
    reviews: 128,
    price: "₩2,400,000~",
    img: "https://picsum.photos/seed/julian/400/400",
  },
  {
    id: "2",
    name: "Arlo Sterling",
    title: "보태니컬 아티스트",
    rating: 4.8,
    reviews: 96,
    price: "₩1,200,000~",
    img: "https://picsum.photos/seed/arlo/400/400",
  },
  {
    id: "3",
    name: "Evelyn Barnes",
    title: "수석 플래너",
    rating: 5.0,
    reviews: 214,
    price: "₩3,800,000~",
    img: "https://picsum.photos/seed/evelyn/400/400",
  },
  {
    id: "4",
    name: "Marcus Thorn",
    title: "컬리너리 아키텍트",
    rating: 4.7,
    reviews: 87,
    price: "커스텀 견적",
    img: "https://picsum.photos/seed/marcus/400/400",
  },
];

const inspirations = [
  {
    title: "Provençal Minimal Garden",
    img: "https://picsum.photos/seed/provence/600/800",
  },
  {
    title: "Dining Aesthetics",
    img: "https://picsum.photos/seed/dining/600/800",
  },
  {
    title: "Urban Romantic",
    img: "https://picsum.photos/seed/urban/600/800",
  },
  {
    title: "Coastal Twilight",
    img: "https://picsum.photos/seed/coastal/600/800",
  },
];

const communityRequests = [
  {
    title: "Lake Como 플로럴 작업 섭외 중",
    author: "Sophie L.",
    badge: "긴급",
    excerpt:
      "이탈리아 레이크 코모에서 6월 웨딩을 앞두고 있어요. 현지에서 작업 가능한 플로리스트를 찾고 있습니다.",
  },
  {
    title: "교토 필름 포토그래피 문의",
    author: "James K.",
    badge: null,
    excerpt:
      "교토 전통 정원에서 필름 카메라로 촬영해주실 작가를 찾습니다. 4월 봄 웨딩 예정입니다.",
  },
];

export default function HomePage() {
  return (
    <div className="flex flex-col min-h-screen bg-[#fbf9f2]">
      <Navbar />

      {/* Hero Section */}
      <section className="relative overflow-hidden bg-gradient-to-b from-[#f5f4ec] to-[#fbf9f2] pt-20 pb-24">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <p className="text-sm font-medium tracking-widest uppercase text-[#6f5a55] mb-4">
            Curated for Modern Couples
          </p>
          <h1 className="font-[var(--font-display)] text-4xl sm:text-5xl lg:text-6xl font-semibold text-[#1b1c18] leading-tight mb-6">
            당신의 비전을 진심으로
            <br />
            이해하는 웨딩 전문가를 만나세요
          </h1>
          <p className="text-base text-[#45483d] mb-10 max-w-xl mx-auto">
            전국 최고의 스냅 작가, 플래너, 플로리스트, 베뉴를 한 곳에서
            만나보세요.
          </p>

          {/* Search Bar */}
          <div className="bg-white rounded-2xl shadow-[0px_4px_20px_rgba(108,129,76,0.1)] p-3 max-w-3xl mx-auto flex flex-col sm:flex-row gap-2">
            <div className="flex-1 flex items-center gap-2 px-4 py-2 bg-[#f5f4ec] rounded-xl">
              <svg
                className="w-4 h-4 text-[#75786c] shrink-0"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"
                />
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"
                />
              </svg>
              <input
                className="flex-1 bg-transparent text-sm text-[#1b1c18] placeholder:text-[#75786c] outline-none"
                placeholder="지역 선택"
              />
            </div>
            <div className="flex-1 flex items-center gap-2 px-4 py-2 bg-[#f5f4ec] rounded-xl">
              <svg
                className="w-4 h-4 text-[#75786c] shrink-0"
                fill="none"
                stroke="currentColor"
                viewBox="0 0 24 24"
              >
                <path
                  strokeLinecap="round"
                  strokeLinejoin="round"
                  strokeWidth={2}
                  d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"
                />
              </svg>
              <input
                className="flex-1 bg-transparent text-sm text-[#1b1c18] placeholder:text-[#75786c] outline-none"
                placeholder="날짜 선택"
              />
            </div>
            <select className="flex-1 px-4 py-2 bg-[#f5f4ec] rounded-xl text-sm text-[#45483d] outline-none border-0 cursor-pointer">
              <option value="">카테고리</option>
              <option>스냅 작가</option>
              <option>베뉴</option>
              <option>플라워</option>
              <option>케이터링</option>
              <option>뮤직</option>
              <option>플래너</option>
            </select>
            <Link
              href="/search"
              className={cn(buttonVariants(), "bg-[#4f6231] text-white hover:bg-[#677b47] rounded-xl px-6 shrink-0")}
            >
              웨딩 전문가 찾기
            </Link>
          </div>
        </div>
      </section>

      {/* Categories */}
      <section className="py-16 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 w-full">
        <div className="grid grid-cols-3 sm:grid-cols-6 gap-4">
          {categories.map((cat) => (
            <Link
              key={cat.label}
              href={cat.href}
              className="flex flex-col items-center gap-3 p-5 rounded-2xl bg-white border border-[#efeee7] hover:border-[#4f6231] hover:shadow-[0px_4px_20px_rgba(108,129,76,0.1)] transition-all group"
            >
              <span className="text-3xl">{cat.icon}</span>
              <span className="text-xs font-medium text-[#45483d] group-hover:text-[#4f6231] text-center">
                {cat.label}
              </span>
            </Link>
          ))}
        </div>
      </section>

      {/* Featured Freelancers */}
      <section className="py-16 bg-[#f5f4ec]">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-end justify-between mb-10">
            <div>
              <p className="text-xs font-medium tracking-widest uppercase text-[#6f5a55] mb-2">
                Featured
              </p>
              <h2 className="font-[var(--font-display)] text-3xl font-semibold text-[#1b1c18]">
                이 달의 추천 전문가
              </h2>
            </div>
            <Link
              href="/search"
              className="text-sm text-[#4f6231] font-medium hover:underline"
            >
              전체 보기 →
            </Link>
          </div>
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
            {featured.map((pro) => (
              <Link
                key={pro.id}
                href={`/profile/${pro.id}`}
                className="group bg-white rounded-2xl overflow-hidden border border-[#efeee7] hover:shadow-[0px_4px_20px_rgba(108,129,76,0.1)] transition-all"
              >
                <div className="relative aspect-square overflow-hidden">
                  <Image
                    src={pro.img}
                    alt={pro.name}
                    fill
                    sizes="(max-width: 768px) 50vw, 25vw"
                    className="object-cover group-hover:scale-105 transition-transform duration-500"
                  />
                </div>
                <div className="p-4">
                  <div className="flex items-center gap-1 mb-1">
                    <svg
                      className="w-3.5 h-3.5 text-[#f59e0b] fill-current"
                      viewBox="0 0 20 20"
                    >
                      <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                    </svg>
                    <span className="text-xs text-[#45483d]">
                      {pro.rating} ({pro.reviews})
                    </span>
                  </div>
                  <h3 className="font-semibold text-[#1b1c18] text-sm mb-0.5">
                    {pro.name}
                  </h3>
                  <p className="text-xs text-[#75786c] mb-2">{pro.title}</p>
                  <p className="text-sm font-medium text-[#4f6231]">
                    {pro.price}
                  </p>
                </div>
              </Link>
            ))}
          </div>
        </div>
      </section>

      {/* Inspiration Gallery */}
      <section className="py-16 max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 w-full">
        <div className="flex items-end justify-between mb-10">
          <div>
            <p className="text-xs font-medium tracking-widest uppercase text-[#6f5a55] mb-2">
              Gallery
            </p>
            <h2 className="font-[var(--font-display)] text-3xl font-semibold text-[#1b1c18]">
              웨딩 인스피레이션
            </h2>
          </div>
          <Link
            href="/community"
            className="text-sm text-[#4f6231] font-medium hover:underline"
          >
            모든 스토리 보기 →
          </Link>
        </div>
        <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
          {inspirations.map((item, i) => (
            <div
              key={i}
              className="group relative rounded-2xl overflow-hidden aspect-[3/4] cursor-pointer"
            >
              <Image
                src={item.img}
                alt={item.title}
                fill
                sizes="(max-width: 768px) 50vw, 25vw"
                className="object-cover group-hover:scale-105 transition-transform duration-500"
              />
              <div className="absolute inset-0 bg-gradient-to-t from-black/50 to-transparent" />
              <p className="absolute bottom-4 left-4 right-4 text-white font-[var(--font-display)] text-sm font-medium">
                {item.title}
              </p>
            </div>
          ))}
        </div>
      </section>

      {/* Community Requests */}
      <section className="py-16 bg-[#f5f4ec]">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-end justify-between mb-10">
            <div>
              <p className="text-xs font-medium tracking-widest uppercase text-[#6f5a55] mb-2">
                Community
              </p>
              <h2 className="font-[var(--font-display)] text-3xl font-semibold text-[#1b1c18]">
                최근 커뮤니티 요청
              </h2>
            </div>
            <Link
              href="/community"
              className="text-sm text-[#4f6231] font-medium hover:underline"
            >
              커뮤니티 보기 →
            </Link>
          </div>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {communityRequests.map((req, i) => (
              <div
                key={i}
                className="bg-white rounded-2xl p-6 border border-[#efeee7] hover:shadow-[0px_4px_20px_rgba(108,129,76,0.08)] transition-all"
              >
                <div className="flex items-start justify-between mb-3">
                  <h3 className="font-semibold text-[#1b1c18] text-base leading-snug">
                    {req.title}
                  </h3>
                  {req.badge && (
                    <Badge className="bg-[#f6d9d3] text-[#6f5a55] border-0 text-xs ml-2 shrink-0">
                      {req.badge}
                    </Badge>
                  )}
                </div>
                <p className="text-sm text-[#75786c] mb-1">{req.author}</p>
                <p className="text-sm text-[#45483d] leading-relaxed mb-4">
                  {req.excerpt}
                </p>
                <Link
                  href="/community"
                  className="text-sm text-[#4f6231] font-medium hover:underline"
                >
                  자세히 보기 →
                </Link>
              </div>
            ))}
          </div>
        </div>
      </section>

      <Footer />
    </div>
  );
}
