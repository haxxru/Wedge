"use client";

import { useState } from "react";
import Image from "next/image";
import Link from "next/link";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { Separator } from "@/components/ui/separator";

export default function ReservePage() {
  const [date, setDate] = useState("");
  const [venue, setVenue] = useState("");
  const [notes, setNotes] = useState("");

  return (
    <div className="flex flex-col min-h-screen bg-[#fbf9f2]">
      <Navbar />

      <div className="max-w-5xl mx-auto px-4 sm:px-6 lg:px-8 py-12 w-full">
        <div className="mb-8">
          <Link
            href="/search"
            className="flex items-center gap-1 text-sm text-[#75786c] hover:text-[#45483d] mb-4"
          >
            <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" />
            </svg>
            전문가 목록으로
          </Link>
          <h1 className="font-[var(--font-display)] text-3xl font-semibold text-[#1b1c18]">
            예약 신청
          </h1>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-8">
          {/* Left: Form */}
          <div className="space-y-6">
            {/* Freelancer Card */}
            <div className="flex items-center gap-4 bg-white rounded-2xl border border-[#efeee7] p-5">
              <div className="relative w-16 h-16 rounded-xl overflow-hidden shrink-0">
                <Image
                  src="https://picsum.photos/seed/julianne/200/200"
                  alt="Julianne Reed"
                  fill
                  className="object-cover"
                />
              </div>
              <div className="flex-1">
                <h3 className="font-semibold text-[#1b1c18] text-sm mb-0.5">Julianne Reed</h3>
                <p className="text-xs text-[#75786c] mb-2">
                  당신의 소중한 순간을 감각적인 에디토리얼로 담아드립니다
                </p>
                <div className="flex items-center gap-3 text-xs text-[#45483d]">
                  <span className="flex items-center gap-1">
                    <svg className="w-3 h-3 text-[#75786c]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                      <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                    </svg>
                    런던 및 해외 출장 가능
                  </span>
                  <span className="flex items-center gap-1">
                    <svg className="w-3 h-3 text-[#f59e0b] fill-current" viewBox="0 0 20 20">
                      <path d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z" />
                    </svg>
                    4.9 (124 리뷰)
                  </span>
                </div>
              </div>
              <div className="text-right shrink-0">
                <p className="text-lg font-bold text-[#4f6231]">£2,400</p>
                <p className="text-xs text-[#75786c]">부터</p>
              </div>
            </div>

            {/* Form Fields */}
            <div className="bg-white rounded-2xl border border-[#efeee7] p-6 space-y-5">
              <h2 className="font-[var(--font-display)] text-lg font-semibold text-[#1b1c18]">
                예약 정보
              </h2>

              <div className="space-y-1.5">
                <Label className="text-sm font-medium text-[#45483d]">
                  예식 날짜
                </Label>
                <div className="relative">
                  <Input
                    type="date"
                    value={date}
                    onChange={(e) => setDate(e.target.value)}
                    className="h-11 bg-[#f5f4ec] border-[#efeee7] focus-visible:ring-[#4f6231] text-[#1b1c18] pl-10"
                  />
                  <svg className="w-4 h-4 text-[#75786c] absolute left-3 top-1/2 -translate-y-1/2 pointer-events-none" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                  </svg>
                </div>
              </div>

              <div className="space-y-1.5">
                <Label className="text-sm font-medium text-[#45483d]">
                  예식 장소
                </Label>
                <div className="relative">
                  <Input
                    value={venue}
                    onChange={(e) => setVenue(e.target.value)}
                    placeholder="예: 서울 용산구 한남동 OO웨딩홀"
                    className="h-11 bg-[#f5f4ec] border-[#efeee7] focus-visible:ring-[#4f6231] text-[#1b1c18] placeholder:text-[#75786c] pl-10"
                  />
                  <svg className="w-4 h-4 text-[#75786c] absolute left-3 top-1/2 -translate-y-1/2 pointer-events-none" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                  </svg>
                </div>
              </div>

              <div className="space-y-1.5">
                <Label className="text-sm font-medium text-[#45483d]">
                  요청사항
                </Label>
                <Textarea
                  value={notes}
                  onChange={(e) => setNotes(e.target.value)}
                  placeholder="원하시는 촬영 스타일, 특별히 담고 싶은 순간 등을 자유롭게 작성해주세요"
                  className="bg-[#f5f4ec] border-[#efeee7] focus-visible:ring-[#4f6231] text-[#1b1c18] placeholder:text-[#75786c] resize-none"
                  rows={4}
                />
              </div>
            </div>
          </div>

          {/* Right: Summary */}
          <div className="space-y-4">
            <div className="bg-white rounded-2xl border border-[#efeee7] p-6 sticky top-24">
              <h2 className="font-[var(--font-display)] text-lg font-semibold text-[#1b1c18] mb-5">
                예약 요약
              </h2>

              <div className="space-y-3">
                <div className="flex justify-between text-sm">
                  <span className="text-[#75786c]">프리랜서</span>
                  <span className="text-[#1b1c18] font-medium">Julianne Reed</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-[#75786c]">서비스</span>
                  <span className="text-[#1b1c18] font-medium">에디토리얼 웨딩 스냅</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-[#75786c]">응답 시간</span>
                  <span className="text-[#1b1c18] font-medium">24시간 이내</span>
                </div>
                <div className="flex justify-between text-sm">
                  <span className="text-[#75786c]">플랫폼 수수료</span>
                  <span className="text-[#4f6231] font-medium">포함</span>
                </div>
              </div>

              <Separator className="my-4 bg-[#efeee7]" />

              <div className="flex justify-between">
                <span className="font-semibold text-[#1b1c18]">예상 금액</span>
                <span className="font-bold text-[#4f6231] text-lg">£2,400</span>
              </div>

              <Button className="w-full h-12 bg-[#4f6231] text-white hover:bg-[#677b47] rounded-xl mt-5 font-medium">
                예약 신청하기
              </Button>

              <div className="mt-4 p-3 bg-[#f5f4ec] rounded-xl">
                <p className="text-xs text-[#75786c] text-center mb-1">
                  프리랜서가 수락하기 전까지는 결제가 진행되지 않습니다
                </p>
                <div className="flex items-center justify-center gap-1.5">
                  <svg className="w-3.5 h-3.5 text-[#4f6231]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z" />
                  </svg>
                  <span className="text-xs text-[#4f6231] font-medium">48시간 이내 무료 취소 가능</span>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <Footer />
    </div>
  );
}
