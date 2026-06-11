"use client";

import { useState } from "react";
import Link from "next/link";
import Image from "next/image";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import { cn } from "@/lib/utils";
import { buttonVariants } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";

const filterChips = [
  "전체", "헤어·메이크업", "스냅작가", "사회자", "축가", "드레스·정장", "하객알바"
];

const professionals = [
  {
    id: "1",
    name: "Elena Rossi",
    title: "에디토리얼 웨딩 포토그래퍼",
    location: "서울 · 전국 출장 가능",
    rating: 4.9,
    reviews: 128,
    price: "₩2,400,000~",
    img: "https://picsum.photos/seed/elena/400/500",
    category: "스냅작가",
  },
  {
    id: "2",
    name: "Château de Lumière",
    title: "프로방스 스타일 베뉴",
    location: "경기도 가평",
    rating: 4.8,
    reviews: 76,
    price: "₩8,000,000~",
    img: "https://picsum.photos/seed/chateau/400/500",
    category: "베뉴",
  },
  {
    id: "3",
    name: "Sage & Petal",
    title: "보태니컬 플로럴 디자이너",
    location: "서울 성수",
    rating: 5.0,
    reviews: 203,
    price: "₩1,500,000~",
    img: "https://picsum.photos/seed/sage/400/500",
    category: "플라워",
  },
  {
    id: "4",
    name: "Marcus Chen",
    title: "파인다이닝 케이터링",
    location: "서울 · 경기",
    rating: 4.7,
    reviews: 91,
    price: "₩3,200,000~",
    img: "https://picsum.photos/seed/mchen/400/500",
    category: "케이터링",
  },
  {
    id: "5",
    name: "Luna Strings",
    title: "클래식 현악 앙상블",
    location: "서울 전 지역",
    rating: 4.9,
    reviews: 54,
    price: "₩1,200,000~",
    img: "https://picsum.photos/seed/luna/400/500",
    category: "뮤직",
  },
  {
    id: "6",
    name: "James Olivier",
    title: "웨딩 플래너 & 코디네이터",
    location: "서울 · 부산",
    rating: 4.8,
    reviews: 167,
    price: "커스텀 견적",
    img: "https://picsum.photos/seed/james/400/500",
    category: "플래너",
  },
  {
    id: "7",
    name: "Aria Kim",
    title: "브라이덜 헤어 & 메이크업",
    location: "서울 강남",
    rating: 4.9,
    reviews: 312,
    price: "₩800,000~",
    img: "https://picsum.photos/seed/aria/400/500",
    category: "헤어·메이크업",
  },
  {
    id: "8",
    name: "Yuki Tanaka",
    title: "필름 포토그래퍼",
    location: "서울 · 해외",
    rating: 4.7,
    reviews: 88,
    price: "₩3,800,000~",
    img: "https://picsum.photos/seed/yuki/400/500",
    category: "스냅작가",
  },
  {
    id: "9",
    name: "Bloom Studio",
    title: "미니멀 웨딩 플라워",
    location: "서울 마포",
    rating: 4.6,
    reviews: 145,
    price: "₩900,000~",
    img: "https://picsum.photos/seed/bloom/400/500",
    category: "플라워",
  },
  {
    id: "10",
    name: "Grand Pavilion",
    title: "가든 웨딩 베뉴",
    location: "강원도 평창",
    rating: 4.9,
    reviews: 62,
    price: "₩12,000,000~",
    img: "https://picsum.photos/seed/grand/400/500",
    category: "베뉴",
  },
  {
    id: "11",
    name: "Sora Catering",
    title: "한식 웨딩 케이터링",
    location: "서울 전 지역",
    rating: 4.8,
    reviews: 109,
    price: "₩2,800,000~",
    img: "https://picsum.photos/seed/sora/400/500",
    category: "케이터링",
  },
  {
    id: "12",
    name: "Daniel Park",
    title: "웨딩 사회자",
    location: "서울 · 경기",
    rating: 4.9,
    reviews: 237,
    price: "₩600,000~",
    img: "https://picsum.photos/seed/daniel/400/500",
    category: "사회자",
  },
];

export default function SearchPage() {
  const [activeChip, setActiveChip] = useState("전체");
  const [bookmarked, setBookmarked] = useState<Set<string>>(new Set());

  const toggleBookmark = (id: string) => {
    setBookmarked((prev) => {
      const next = new Set(prev);
      if (next.has(id)) next.delete(id);
      else next.add(id);
      return next;
    });
  };

  const filtered =
    activeChip === "전체"
      ? professionals
      : professionals.filter((p) => p.category === activeChip);

  return (
    <div className="flex flex-col min-h-screen bg-[#fbf9f2]">
      <Navbar />

      {/* Header */}
      <div className="bg-[#f5f4ec] py-10">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <h1 className="font-[var(--font-display)] text-3xl font-semibold text-[#1b1c18] mb-2">
            전문가 찾기
          </h1>
          <p className="text-sm text-[#75786c]">
            당신의 특별한 기념일을 위한 엄선된 전문가들을 만나보세요
          </p>
        </div>
      </div>

      {/* Filters */}
      <div className="border-b border-[#efeee7] bg-white sticky top-16 z-40">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-4">
          <div className="flex items-center gap-3 overflow-x-auto scrollbar-hide pb-1">
            {filterChips.map((chip) => (
              <button
                key={chip}
                onClick={() => setActiveChip(chip)}
                className={`shrink-0 px-4 py-2 rounded-full text-sm font-medium transition-all ${
                  activeChip === chip
                    ? "bg-[#4f6231] text-white"
                    : "bg-[#f5f4ec] text-[#45483d] hover:bg-[#efeee7]"
                }`}
              >
                {chip}
              </button>
            ))}
          </div>
        </div>
      </div>

      {/* Sort & Filter bar */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-5 w-full">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-3">
            <button className="flex items-center gap-1.5 px-4 py-2 rounded-xl border border-[#c5c8ba] text-sm text-[#45483d] hover:border-[#4f6231] transition-colors">
              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
              </svg>
              지역
              <svg className="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
              </svg>
            </button>
            <button className="flex items-center gap-1.5 px-4 py-2 rounded-xl border border-[#c5c8ba] text-sm text-[#45483d] hover:border-[#4f6231] transition-colors">
              가격
              <svg className="w-3 h-3" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M19 9l-7 7-7-7" />
              </svg>
            </button>
            <button className="flex items-center gap-1.5 px-4 py-2 rounded-xl border border-[#c5c8ba] text-sm text-[#45483d] hover:border-[#4f6231] transition-colors">
              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
              </svg>
              날짜
            </button>
          </div>
          <div className="flex items-center gap-2">
            <span className="text-sm text-[#75786c]">
              총 <span className="font-medium text-[#1b1c18]">{filtered.length}</span>명
            </span>
            <select className="px-3 py-2 rounded-xl border border-[#c5c8ba] text-sm text-[#45483d] bg-white outline-none cursor-pointer">
              <option>최신순</option>
              <option>평점순</option>
              <option>가격 낮은순</option>
              <option>리뷰 많은순</option>
            </select>
          </div>
        </div>
      </div>

      {/* Grid */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 pb-16 w-full">
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-5">
          {filtered.map((pro) => (
            <div
              key={pro.id}
              className="group bg-white rounded-2xl overflow-hidden border border-[#efeee7] hover:shadow-[0px_4px_20px_rgba(108,129,76,0.1)] transition-all"
            >
              <div className="relative aspect-[4/5] overflow-hidden">
                <Image
                  src={pro.img}
                  alt={pro.name}
                  fill
                  className="object-cover group-hover:scale-105 transition-transform duration-500"
                />
                <button
                  onClick={() => toggleBookmark(pro.id)}
                  className="absolute top-3 right-3 w-8 h-8 rounded-full bg-white/90 flex items-center justify-center hover:bg-white transition-colors"
                >
                  <svg
                    className={`w-4 h-4 ${bookmarked.has(pro.id) ? "fill-[#6f5a55] text-[#6f5a55]" : "text-[#75786c]"}`}
                    fill={bookmarked.has(pro.id) ? "currentColor" : "none"}
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                  </svg>
                </button>
              </div>
              <div className="p-4">
                <Badge className="bg-[#f5f4ec] text-[#45483d] border-0 text-xs mb-2">
                  {pro.category}
                </Badge>
                <h3 className="font-semibold text-[#1b1c18] text-sm mb-0.5">{pro.name}</h3>
                <p className="text-xs text-[#75786c] mb-2">{pro.title}</p>
                <div className="flex items-center gap-1 mb-1">
                  <svg className="w-3 h-3 text-[#75786c]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                  </svg>
                  <span className="text-xs text-[#75786c]">{pro.location}</span>
                </div>
                <div className="flex items-center gap-1 mb-3">
                  <svg className="w-3 h-3 text-[#f59e0b] fill-current" viewBox="0 0 20 20">
                    <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                  </svg>
                  <span className="text-xs text-[#45483d]">
                    {pro.rating} ({pro.reviews} 리뷰)
                  </span>
                </div>
                <div className="flex items-center justify-between">
                  <span className="text-sm font-semibold text-[#4f6231]">{pro.price}</span>
                  <Link
                    href={`/profile/${pro.id}`}
                    className={cn(buttonVariants({ variant: "outline", size: "sm" }), "text-xs h-8 border-[#4f6231] text-[#4f6231] hover:bg-[#4f6231] hover:text-white rounded-xl")}
                  >
                    프로필 보기
                  </Link>
                </div>
              </div>
            </div>
          ))}
        </div>
      </div>

      <Footer />
    </div>
  );
}
