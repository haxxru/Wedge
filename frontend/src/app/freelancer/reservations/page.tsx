"use client";

import { useState } from "react";
import Image from "next/image";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import { Button } from "@/components/ui/button";
import { Badge } from "@/components/ui/badge";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import {
  Dialog,
  DialogContent,
  DialogHeader,
  DialogTitle,
  DialogFooter,
} from "@/components/ui/dialog";
import { Textarea } from "@/components/ui/textarea";

const requests = [
  {
    id: "1",
    coupleNames: "Eleanor & James",
    location: "서울 마포구 합정동",
    weddingDate: "2024. 08. 24",
    packageType: "Full Day Editorial",
    message: "두 분의 웨딩을 처음부터 끝까지 함께하고 싶습니다. 야외 정원 배경을 선호합니다.",
    status: "new",
    img: "https://picsum.photos/seed/couple1/200/200",
  },
  {
    id: "2",
    coupleNames: "Mia & Thomas",
    location: "경기도 가평 자라섬",
    weddingDate: "2024. 09. 07",
    packageType: "Half Day Editorial",
    message: "자연스러운 필름 감성의 사진을 원합니다. 골든아워 촬영을 희망해요.",
    status: "new",
    img: "https://picsum.photos/seed/couple2/200/200",
  },
  {
    id: "3",
    coupleNames: "Sora & Jin",
    location: "서울 종로구 경복궁 인근",
    weddingDate: "2024. 07. 14",
    packageType: "Full Day + Second Shooter",
    message: "한복과 드레스 두 가지 스타일 촬영을 원합니다. 전통 한옥 배경 포함.",
    status: "confirmed",
    img: "https://picsum.photos/seed/couple3/200/200",
  },
  {
    id: "4",
    coupleNames: "Laura & Patrick",
    location: "강원도 강릉 해변",
    weddingDate: "2024. 05. 18",
    packageType: "Destination Editorial",
    message: "바다를 배경으로 한 캐주얼한 웨딩 촬영입니다.",
    status: "completed",
    img: "https://picsum.photos/seed/couple4/200/200",
  },
];

const statusMap = {
  new: { label: "신규 요청", color: "bg-[#d3ebac] text-[#4f6231]" },
  confirmed: { label: "확정됨", color: "bg-[#f5f4ec] text-[#45483d]" },
  completed: { label: "완료됨", color: "bg-[#efeee7] text-[#75786c]" },
  cancelled: { label: "거절됨", color: "bg-[#f6d9d3] text-[#6f5a55]" },
};

type Status = keyof typeof statusMap;

const declineReasons = [
  "해당 날짜에 이미 예약이 있습니다",
  "요청 지역으로 출장이 어렵습니다",
  "원하시는 스타일과 맞지 않습니다",
  "기타 (직접 입력)",
];

export default function FreelancerReservationsPage() {
  const [activeTab, setActiveTab] = useState("new");
  const [declineModal, setDeclineModal] = useState<string | null>(null);
  const [declineReason, setDeclineReason] = useState(declineReasons[0]);
  const [declineNote, setDeclineNote] = useState("");

  const filtered = requests.filter((r) => {
    if (activeTab === "new") return r.status === "new";
    if (activeTab === "confirmed") return r.status === "confirmed";
    if (activeTab === "completed") return r.status === "completed";
    if (activeTab === "cancelled") return r.status === "cancelled";
    return true;
  });

  return (
    <div className="flex flex-col min-h-screen bg-[#fbf9f2]">
      <Navbar />

      <div className="max-w-4xl mx-auto px-4 sm:px-6 lg:px-8 py-12 w-full">
        <h1 className="font-[var(--font-display)] text-3xl font-semibold text-[#1b1c18] mb-2">
          예약 관리
        </h1>
        <p className="text-sm text-[#75786c] mb-8">
          전 세계 커플들과의 연결을 관리하세요
        </p>

        <Tabs value={activeTab} onValueChange={setActiveTab}>
          <TabsList className="bg-[#f5f4ec] rounded-xl p-1 h-auto gap-1 mb-8">
            {[
              { value: "new", label: "신규 요청" },
              { value: "confirmed", label: "확정됨" },
              { value: "completed", label: "완료됨" },
              { value: "cancelled", label: "거절됨" },
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
                {filtered.map((r) => {
                  const st = statusMap[r.status as Status];
                  return (
                    <div
                      key={r.id}
                      className="bg-white rounded-2xl border border-[#efeee7] overflow-hidden hover:shadow-[0px_4px_20px_rgba(108,129,76,0.08)] transition-all"
                    >
                      <div className="p-5">
                        <div className="flex items-start gap-4">
                          <div className="relative w-14 h-14 rounded-xl overflow-hidden shrink-0">
                            <Image
                              src={r.img}
                              alt={r.coupleNames}
                              fill
                              className="object-cover"
                            />
                          </div>
                          <div className="flex-1 min-w-0">
                            <div className="flex items-start justify-between gap-2 mb-1">
                              <h3 className="font-semibold text-[#1b1c18] text-base">
                                {r.coupleNames}
                              </h3>
                              <Badge className={`${st.color} border-0 text-xs shrink-0`}>
                                {st.label}
                              </Badge>
                            </div>
                            <div className="flex flex-wrap gap-3 text-xs text-[#45483d] mb-2">
                              <span className="flex items-center gap-1">
                                <svg className="w-3 h-3 text-[#75786c]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                                </svg>
                                {r.location}
                              </span>
                              <span className="flex items-center gap-1">
                                <svg className="w-3 h-3 text-[#75786c]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                                </svg>
                                {r.weddingDate}
                              </span>
                            </div>
                            <Badge className="bg-[#f5f4ec] text-[#45483d] border-0 text-xs mb-3">
                              {r.packageType}
                            </Badge>
                            <p className="text-sm text-[#75786c] leading-relaxed line-clamp-2">
                              &ldquo;{r.message}&rdquo;
                            </p>
                          </div>
                        </div>
                        {r.status === "new" && (
                          <div className="flex justify-end gap-2 mt-4 pt-4 border-t border-[#efeee7]">
                            <Button
                              size="sm"
                              variant="outline"
                              onClick={() => setDeclineModal(r.id)}
                              className="text-xs h-9 border-[#c5c8ba] text-[#45483d] rounded-xl hover:border-red-300 hover:text-red-500"
                            >
                              거절하기
                            </Button>
                            <Button
                              size="sm"
                              className="text-xs h-9 bg-[#4f6231] text-white hover:bg-[#677b47] rounded-xl"
                            >
                              수락하기
                            </Button>
                          </div>
                        )}
                      </div>
                    </div>
                  );
                })}
              </div>
            ) : (
              <div className="text-center py-20">
                <div className="w-16 h-16 rounded-full bg-[#f5f4ec] flex items-center justify-center mx-auto mb-4">
                  <svg className="w-8 h-8 text-[#75786c]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2" />
                  </svg>
                </div>
                <p className="text-[#45483d] font-medium mb-1">모든 업무를 확인하셨습니다!</p>
                <p className="text-sm text-[#75786c]">새로운 요청이 도착하면 알려드릴게요</p>
              </div>
            )}
          </TabsContent>
        </Tabs>
      </div>

      {/* Decline Modal */}
      <Dialog open={!!declineModal} onOpenChange={() => setDeclineModal(null)}>
        <DialogContent className="bg-white rounded-2xl max-w-md">
          <DialogHeader>
            <DialogTitle className="font-[var(--font-display)] text-lg font-semibold text-[#1b1c18]">
              요청 거절
            </DialogTitle>
          </DialogHeader>
          <div className="space-y-3 py-2">
            <p className="text-sm text-[#75786c]">거절 사유를 선택해주세요</p>
            {declineReasons.map((reason) => (
              <label key={reason} className="flex items-center gap-3 cursor-pointer">
                <input
                  type="radio"
                  name="declineReason"
                  value={reason}
                  checked={declineReason === reason}
                  onChange={() => setDeclineReason(reason)}
                  className="w-4 h-4 accent-[#4f6231]"
                />
                <span className="text-sm text-[#45483d]">{reason}</span>
              </label>
            ))}
            {declineReason === "기타 (직접 입력)" && (
              <Textarea
                value={declineNote}
                onChange={(e) => setDeclineNote(e.target.value)}
                placeholder="사유를 직접 입력해주세요"
                className="bg-[#f5f4ec] border-[#efeee7] text-sm resize-none mt-2"
                rows={3}
              />
            )}
          </div>
          <DialogFooter className="gap-2">
            <Button
              variant="outline"
              onClick={() => setDeclineModal(null)}
              className="border-[#c5c8ba] text-[#45483d] rounded-xl"
            >
              취소
            </Button>
            <Button
              onClick={() => setDeclineModal(null)}
              className="bg-[#6f5a55] text-white hover:bg-[#6f5a55]/90 rounded-xl"
            >
              거절 확정
            </Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>

      <Footer />
    </div>
  );
}
