"use client";

import { useState } from "react";
import Image from "next/image";
import Link from "next/link";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import { cn } from "@/lib/utils";
import { buttonVariants } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";

const filterTabs = ["전체", "스냅작가", "베뉴", "플라워 디자이너", "케이터링"];

const bookmarks = [
  {
    id: "1",
    name: "Elena Rossi",
    category: "스냅작가",
    location: "Milan, Italy",
    description: "빛과 공기를 다루는 에디토리얼 포토그래퍼. 패션 에디토리얼 경력을 바탕으로 웨딩 촬영의 새로운 미학을 제시합니다.",
    action: "포트폴리오 보기",
    img: "https://picsum.photos/seed/elena2/600/400",
  },
  {
    id: "2",
    name: "Château de Lumière",
    category: "베뉴",
    location: "Provence, France",
    description: "17세기에 지어진 역사적인 샤토. 올리브 가든과 라벤더 밭이 펼쳐지는 환상적인 프로방스 배경의 웨딩 베뉴입니다.",
    action: "가용 날짜 확인",
    img: "https://picsum.photos/seed/chateau2/600/400",
  },
  {
    id: "3",
    name: "Sage & Petal",
    category: "플라워 디자이너",
    location: "London, UK",
    description: "자연의 야생미를 담은 보태니컬 플로럴 디자인 스튜디오. 지속 가능한 재료만을 사용하는 친환경 플로리스트.",
    action: "문의하기",
    img: "https://picsum.photos/seed/sage2/600/400",
  },
];

export default function BookmarksPage() {
  const [activeFilter, setActiveFilter] = useState("전체");
  const [removed, setRemoved] = useState<Set<string>>(new Set());

  const handleRemove = (id: string) => {
    setRemoved((prev) => new Set([...prev, id]));
  };

  const filtered = bookmarks.filter((b) => {
    if (removed.has(b.id)) return false;
    if (activeFilter === "전체") return true;
    return b.category === activeFilter;
  });

  return (
    <div className="flex flex-col min-h-screen bg-[#fbf9f2]">
      <Navbar />

      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 py-12 w-full">
        <h1 className="font-[var(--font-display)] text-3xl font-semibold text-[#1b1c18] mb-2">
          관심 프리랜서
        </h1>
        <p className="text-sm text-[#75786c] mb-8">
          저장해두신 웨딩 전문가들을 한 눈에 확인하세요
        </p>

        {/* Filter tabs */}
        <div className="flex items-center gap-2 mb-8 overflow-x-auto pb-1">
          {filterTabs.map((tab) => (
            <button
              key={tab}
              onClick={() => setActiveFilter(tab)}
              className={`shrink-0 px-4 py-2 rounded-full text-sm font-medium transition-all ${
                activeFilter === tab
                  ? "bg-[#4f6231] text-white"
                  : "bg-[#f5f4ec] text-[#45483d] hover:bg-[#efeee7]"
              }`}
            >
              {tab}
            </button>
          ))}
        </div>

        {filtered.length > 0 ? (
          <div className="space-y-5">
            {filtered.map((b) => (
              <div
                key={b.id}
                className="bg-white rounded-2xl overflow-hidden border border-[#efeee7] hover:shadow-[0px_4px_20px_rgba(108,129,76,0.08)] transition-all"
              >
                <div className="flex flex-col sm:flex-row">
                  <div className="relative sm:w-64 h-44 sm:h-auto shrink-0 overflow-hidden">
                    <Image
                      src={b.img}
                      alt={b.name}
                      fill
                      className="object-cover"
                    />
                    <button
                      onClick={() => handleRemove(b.id)}
                      className="absolute top-3 right-3 w-8 h-8 rounded-full bg-white/90 flex items-center justify-center hover:bg-white transition-colors text-[#75786c] hover:text-red-500"
                    >
                      <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                      </svg>
                    </button>
                  </div>
                  <div className="p-6 flex-1 flex flex-col justify-between">
                    <div>
                      <Badge className="bg-[#f5f4ec] text-[#45483d] border-0 text-xs mb-3">
                        {b.category}
                      </Badge>
                      <h3 className="font-[var(--font-display)] text-xl font-semibold text-[#1b1c18] mb-2">
                        {b.name}
                      </h3>
                      <div className="flex items-center gap-1 text-xs text-[#75786c] mb-3">
                        <svg className="w-3.5 h-3.5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                          <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                        </svg>
                        {b.location}
                      </div>
                      <p className="text-sm text-[#45483d] leading-relaxed">
                        {b.description}
                      </p>
                    </div>
                    <div className="flex items-center gap-3 mt-4">
                      <Link
                        href={`/profile/${b.id}`}
                        className={cn(buttonVariants({ size: "sm" }), "bg-[#4f6231] text-white hover:bg-[#677b47] rounded-xl text-xs")}
                      >
                        {b.action}
                      </Link>
                      <Link
                        href={`/reserve/${b.id}`}
                        className={cn(buttonVariants({ variant: "outline", size: "sm" }), "border-[#c5c8ba] text-[#45483d] hover:border-[#4f6231] hover:text-[#4f6231] rounded-xl text-xs")}
                      >
                        예약하기
                      </Link>
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>
        ) : (
          <div className="text-center py-24">
            <div className="w-16 h-16 rounded-full bg-[#f5f4ec] flex items-center justify-center mx-auto mb-4">
              <svg className="w-8 h-8 text-[#75786c]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
              </svg>
            </div>
            <p className="font-semibold text-[#1b1c18] mb-2">저장된 항목이 없습니다</p>
            <p className="text-sm text-[#75786c] mb-6">
              마음에 드는 전문가를 저장해보세요
            </p>
            <Link href="/search" className={cn(buttonVariants(), "bg-[#4f6231] text-white hover:bg-[#677b47] rounded-xl")}>
              큐레이팅된 전문가 둘러보기
            </Link>
          </div>
        )}
      </div>

      <Footer />
    </div>
  );
}
