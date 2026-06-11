"use client";

import { useState } from "react";
import Link from "next/link";
import Image from "next/image";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import { cn } from "@/lib/utils";
import { buttonVariants } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { Avatar, AvatarFallback } from "@/components/ui/avatar";

const portfolioImages = [
  "https://picsum.photos/seed/port1/600/500",
  "https://picsum.photos/seed/port2/600/500",
  "https://picsum.photos/seed/port3/600/500",
  "https://picsum.photos/seed/port4/600/500",
  "https://picsum.photos/seed/port5/600/500",
  "https://picsum.photos/seed/port6/600/500",
];

const reviews = [
  {
    name: "Sophia & Mark",
    date: "June 2023",
    rating: 5,
    text: "Elena는 저희 웨딩의 모든 순간을 완벽하게 포착해주셨어요. 사진 한 장 한 장이 예술 작품 같았고, 10년이 지나도 이 순간들을 생생하게 기억할 수 있을 것 같아요. 진심으로 추천합니다!",
    avatar: "SM",
  },
  {
    name: "Julian Thorne",
    date: "September 2023",
    rating: 5,
    text: "파리에서의 야외 웨딩을 담아주셨는데, 빛을 다루는 방식이 정말 탁월했어요. 편안한 분위기를 만들어 주셔서 자연스러운 표정들이 많이 남았습니다. 꼭 다시 함께하고 싶어요.",
    avatar: "JT",
  },
];

export default function ProfilePage() {
  const [bookmarked, setBookmarked] = useState(false);

  return (
    <div className="flex flex-col min-h-screen bg-[#fbf9f2]">
      <Navbar />

      {/* Cover Image */}
      <div className="relative h-72 md:h-96 overflow-hidden">
        <Image
          src="https://picsum.photos/seed/cover/1400/500"
          alt="Cover"
          fill
          className="object-cover"
        />
        <div className="absolute inset-0 bg-black/20" />
      </div>

      {/* Profile Header */}
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 w-full -mt-16 relative z-10">
        <div className="flex flex-col sm:flex-row sm:items-end gap-5 mb-6">
          <div className="relative w-28 h-28 sm:w-32 sm:h-32 rounded-2xl overflow-hidden border-4 border-white shadow-lg shrink-0">
            <Image
              src="https://picsum.photos/seed/elena/400/400"
              alt="Elena Valeska"
              fill
              className="object-cover"
            />
          </div>
          <div className="flex-1">
            <div className="flex flex-wrap items-start justify-between gap-3">
              <div>
                <Badge className="bg-[#f5f4ec] text-[#45483d] border-0 text-xs mb-2">
                  에디토리얼 포토그래퍼
                </Badge>
                <h1 className="font-[var(--font-display)] text-2xl sm:text-3xl font-semibold text-[#1b1c18]">
                  Elena Valeska
                </h1>
                <div className="flex items-center gap-3 mt-1">
                  <div className="flex items-center gap-1">
                    {[...Array(5)].map((_, i) => (
                      <svg key={i} className="w-4 h-4 text-[#f59e0b] fill-current" viewBox="0 0 20 20">
                        <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                      </svg>
                    ))}
                    <span className="text-sm text-[#45483d] ml-1">4.9 · 124 리뷰</span>
                  </div>
                  <div className="flex items-center gap-1 text-sm text-[#75786c]">
                    <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                    </svg>
                    Paris, France
                  </div>
                </div>
              </div>
              <div className="flex items-center gap-3">
                <button
                  onClick={() => setBookmarked(!bookmarked)}
                  className={`p-2.5 rounded-xl border transition-colors ${
                    bookmarked
                      ? "border-[#6f5a55] bg-[#f6d9d3] text-[#6f5a55]"
                      : "border-[#c5c8ba] text-[#75786c] hover:border-[#6f5a55]"
                  }`}
                >
                  <svg
                    className="w-5 h-5"
                    fill={bookmarked ? "currentColor" : "none"}
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z" />
                  </svg>
                </button>
                <Link href="/reserve/1" className={cn(buttonVariants(), "bg-[#4f6231] text-white hover:bg-[#677b47] rounded-xl px-6")}>
                  예약하기
                </Link>
              </div>
            </div>
          </div>
        </div>

        {/* Tabs */}
        <Tabs defaultValue="portfolio" className="w-full">
          <TabsList className="bg-transparent border-b border-[#efeee7] rounded-none p-0 h-auto gap-0 mb-8 w-full justify-start">
            {["portfolio", "reviews", "about"].map((tab) => (
              <TabsTrigger
                key={tab}
                value={tab}
                className="rounded-none px-5 py-3 text-sm font-medium text-[#75786c] data-[state=active]:text-[#4f6231] data-[state=active]:border-b-2 data-[state=active]:border-[#4f6231] data-[state=active]:bg-transparent data-[state=active]:shadow-none"
              >
                {tab === "portfolio" ? "포트폴리오" : tab === "reviews" ? "리뷰" : "소개"}
              </TabsTrigger>
            ))}
          </TabsList>

          {/* Portfolio Tab */}
          <TabsContent value="portfolio" className="mt-0">
            <div className="mb-6">
              <p className="text-sm text-[#75786c] mb-1">Capturing moments of your wedding story</p>
              <h2 className="font-[var(--font-display)] text-xl font-semibold text-[#1b1c18]">
                웨딩 이야기의 순간을 담다
              </h2>
            </div>
            <div className="grid grid-cols-2 md:grid-cols-3 gap-3 mb-6">
              {portfolioImages.map((img, i) => (
                <div key={i} className="relative aspect-[4/3] rounded-xl overflow-hidden group">
                  <Image
                    src={img}
                    alt={`Portfolio ${i + 1}`}
                    fill
                    className="object-cover group-hover:scale-105 transition-transform duration-500"
                  />
                </div>
              ))}
            </div>
            <button className="text-sm text-[#4f6231] font-medium hover:underline">
              전체 프로젝트 보기 →
            </button>
          </TabsContent>

          {/* Reviews Tab */}
          <TabsContent value="reviews" className="mt-0">
            <div className="space-y-6 max-w-2xl">
              {reviews.map((review, i) => (
                <div key={i} className="bg-white rounded-2xl p-6 border border-[#efeee7]">
                  <div className="flex items-center gap-3 mb-4">
                    <Avatar>
                      <AvatarFallback className="bg-[#d3ebac] text-[#4f6231] font-semibold text-sm">
                        {review.avatar}
                      </AvatarFallback>
                    </Avatar>
                    <div>
                      <p className="font-semibold text-[#1b1c18] text-sm">{review.name}</p>
                      <p className="text-xs text-[#75786c]">{review.date}</p>
                    </div>
                    <div className="flex items-center gap-0.5 ml-auto">
                      {[...Array(review.rating)].map((_, j) => (
                        <svg key={j} className="w-3.5 h-3.5 text-[#f59e0b] fill-current" viewBox="0 0 20 20">
                          <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                        </svg>
                      ))}
                    </div>
                  </div>
                  <p className="text-sm text-[#45483d] leading-relaxed">{review.text}</p>
                </div>
              ))}
            </div>
          </TabsContent>

          {/* About Tab */}
          <TabsContent value="about" className="mt-0">
            <div className="max-w-2xl">
              <h2 className="font-[var(--font-display)] text-xl font-semibold text-[#1b1c18] mb-4">
                렌즈 너머의 철학
              </h2>
              <p className="text-sm text-[#45483d] leading-relaxed mb-4">
                프랑스 남부 출신의 Elena는 10년 이상 패션 및 에디토리얼 분야에서 활동하다
                웨딩 포토그래피의 세계로 전향했습니다. 그녀의 작업은 고전적인 아름다움과
                현대적 감각의 균형에서 출발합니다.
              </p>
              <p className="text-sm text-[#45483d] leading-relaxed mb-4">
                현재 파리와 아말피 코스트를 기반으로 활동하며, 전 세계 커플들의 가장 소중한
                순간을 필름과 디지털로 기록합니다. 빛의 방향과 감정의 흐름을 포착하는 것이
                그녀만의 특별한 접근 방식입니다.
              </p>
              <div className="grid grid-cols-3 gap-4 mt-8 p-5 bg-[#f5f4ec] rounded-2xl">
                <div className="text-center">
                  <p className="font-[var(--font-display)] text-2xl font-bold text-[#4f6231]">10+</p>
                  <p className="text-xs text-[#75786c]">경력 연수</p>
                </div>
                <div className="text-center">
                  <p className="font-[var(--font-display)] text-2xl font-bold text-[#4f6231]">500+</p>
                  <p className="text-xs text-[#75786c]">웨딩 촬영</p>
                </div>
                <div className="text-center">
                  <p className="font-[var(--font-display)] text-2xl font-bold text-[#4f6231]">30+</p>
                  <p className="text-xs text-[#75786c]">국가 방문</p>
                </div>
              </div>
            </div>
          </TabsContent>
        </Tabs>
      </div>

      <div className="pb-16" />
      <Footer />
    </div>
  );
}
