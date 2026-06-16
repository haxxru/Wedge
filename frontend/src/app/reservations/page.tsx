"use client";

import { useState } from "react";
import Image from "next/image";
import Link from "next/link";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import { cn } from "@/lib/utils";
import { buttonVariants } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";

const reservations = [
  {
    id: "1",
    freelancer: "Elena Valeska",
    service: "에디토리얼 웨딩 스냅",
    date: "2024. 06. 14",
    location: "서울 용산구 한남동",
    price: "₩2,400,000",
    status: "confirmed",
    img: "https://picsum.photos/seed/elena/200/200",
  },
  {
    id: "2",
    freelancer: "Sage & Petal",
    service: "웨딩 플로럴 풀패키지",
    date: "2024. 06. 14",
    location: "서울 강남구 청담동",
    price: "₩1,500,000",
    status: "pending",
    img: "https://picsum.photos/seed/sage/200/200",
  },
  {
    id: "3",
    freelancer: "Marcus Chen",
    service: "파인다이닝 케이터링",
    date: "2024. 04. 20",
    location: "경기도 파주",
    price: "₩3,200,000",
    status: "completed",
    img: "https://picsum.photos/seed/mchen/200/200",
  },
  {
    id: "4",
    freelancer: "Luna Strings",
    service: "현악 사중주 2시간",
    date: "2024. 03. 10",
    location: "서울 종로구",
    price: "₩1,200,000",
    status: "cancelled",
    img: "https://picsum.photos/seed/luna/200/200",
  },
];

const statusMap = {
  confirmed: { label: "확정됨", color: "bg-[#d3ebac] text-[#4f6231]" },
  pending: { label: "대기 중", color: "bg-[#f6d9d3] text-[#6f5a55]" },
  completed: { label: "완료됨", color: "bg-[#efeee7] text-[#45483d]" },
  cancelled: { label: "취소됨", color: "bg-[#efeee7] text-[#75786c]" },
};

type Status = keyof typeof statusMap;

function ReservationCard({ r }: { r: typeof reservations[0] }) {
  const st = statusMap[r.status as Status];
  return (
    <div className="bg-white rounded-2xl border border-[#efeee7] overflow-hidden hover:shadow-[0px_4px_20px_rgba(108,129,76,0.08)] transition-all">
      <div className="flex gap-4 p-5">
        <div className="relative w-16 h-16 rounded-xl overflow-hidden shrink-0">
          <Image src={r.img} alt={r.freelancer} fill sizes="64px" className="object-cover" />
        </div>
        <div className="flex-1 min-w-0">
          <div className="flex items-start justify-between gap-2 mb-1">
            <h3 className="font-semibold text-[#1b1c18] text-sm">{r.freelancer}</h3>
            <Badge className={`${st.color} border-0 text-xs shrink-0`}>{st.label}</Badge>
          </div>
          <p className="text-xs text-[#75786c] mb-2">{r.service}</p>
          <div className="flex flex-wrap gap-3 text-xs text-[#45483d]">
            <span className="flex items-center gap-1">
              <svg className="w-3 h-3 text-[#75786c]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
              </svg>
              {r.date}
            </span>
            <span className="flex items-center gap-1">
              <svg className="w-3 h-3 text-[#75786c]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
              </svg>
              {r.location}
            </span>
          </div>
        </div>
      </div>
      <div className="border-t border-[#efeee7] px-5 py-3 flex items-center justify-between">
        <span className="text-sm font-semibold text-[#4f6231]">{r.price}</span>
        <div className="flex gap-2">
          {r.status === "completed" && (
            <Link href={`/review/${r.id}`} className={cn(buttonVariants({ variant: "outline", size: "sm" }), "text-xs h-8 border-[#c5c8ba] text-[#45483d] rounded-xl hover:border-[#4f6231] hover:text-[#4f6231]")}>
              리뷰 작성
            </Link>
          )}
          <Link href={`/profile/${r.id}`} className={cn(buttonVariants({ variant: "outline", size: "sm" }), "text-xs h-8 border-[#c5c8ba] text-[#45483d] rounded-xl hover:border-[#4f6231] hover:text-[#4f6231]")}>
            상세 보기
          </Link>
        </div>
      </div>
    </div>
  );
}

export default function ReservationsPage() {
  const [activeTab, setActiveTab] = useState("all");

  const filtered = reservations.filter((r) => {
    if (activeTab === "all") return true;
    return r.status === activeTab;
  });

  return (
    <div className="flex flex-col min-h-screen bg-[#fbf9f2]">
      <Navbar />

      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-12 w-full">
        <h1 className="font-[var(--font-display)] text-3xl font-semibold text-[#1b1c18] mb-2">
          예약 내역
        </h1>
        <p className="text-sm text-[#75786c] mb-8">
          요청하신 웨딩 전문가 예약 현황을 확인하세요
        </p>

        <Tabs value={activeTab} onValueChange={setActiveTab}>
          <TabsList className="bg-[#f5f4ec] rounded-xl p-1 h-auto gap-1 mb-8">
            {[
              { value: "all", label: "전체" },
              { value: "pending", label: "대기 중" },
              { value: "confirmed", label: "확정됨" },
              { value: "completed", label: "완료됨" },
              { value: "cancelled", label: "취소됨" },
            ].map((tab) => (
              <TabsTrigger
                key={tab.value}
                value={tab.value}
                className="px-4 py-2 text-sm rounded-lg data-[state=active]:bg-white data-[state=active]:text-[#4f6231] data-[state=active]:shadow-sm text-[#75786c]"
              >
                {tab.label}
              </TabsTrigger>
            ))}
          </TabsList>

          <TabsContent value={activeTab} className="mt-0">
            {filtered.length > 0 ? (
              <div className="space-y-4">
                {filtered.map((r) => (
                  <ReservationCard key={r.id} r={r} />
                ))}
              </div>
            ) : (
              <div className="text-center py-20">
                <div className="w-16 h-16 rounded-full bg-[#f5f4ec] flex items-center justify-center mx-auto mb-4">
                  <svg className="w-8 h-8 text-[#75786c]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                  </svg>
                </div>
                <p className="text-[#75786c] text-sm">해당하는 예약이 없습니다</p>
                <Link href="/search" className={cn(buttonVariants(), "mt-4 bg-[#4f6231] text-white hover:bg-[#677b47] rounded-xl")}>
                  전문가 찾기
                </Link>
              </div>
            )}
          </TabsContent>
        </Tabs>
      </div>

      <Footer />
    </div>
  );
}
