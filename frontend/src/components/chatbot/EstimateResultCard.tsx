import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { API_BASE_URL } from "@/lib/auth";
import type { EstimateResult } from "@/types/chatbot";
import { useRouter } from "next/navigation";
import { useEffect, useRef } from "react";

interface Props {
  estimate: EstimateResult;
  onReset: () => void;
  showResetButton?: boolean;
}

const SERVICE_TO_CATEGORY_MAP: Record<string, number> = {
  "웨딩 스냅사진": 1,
  "스냅사진 촬영": 1,
  "웨딩 영상": 2,
  "영상 촬영": 2,
  "축가": 4,
  "헤어·메이크업": 5,
  "헤어메이크업": 5,
  "헤어 메이크업": 5,
  "웨딩 플로리스트": 6,
  "부케": 6,
  "사회자": 7,
  "드레스·정장": 8,
  "드레스 대여": 8,
  "하객알바": 9,
  "기타": 10,
};

export function EstimateResultCard({
  estimate,
  onReset,
  showResetButton = true,
}: Props) {
  const router = useRouter();
  const categoriesRef = useRef<{ id: number; name: string }[]>([]);

  useEffect(() => {
    const prefetchCategories = async () => {
      try {
        const res = await fetch(`${API_BASE_URL}/api/categories`);
        categoriesRef.current = await res.json();
      } catch {}
    };
    prefetchCategories();
  }, []);

  const handleNavigate = () => {
    const serviceName = (estimate.selectedServices[0] ?? "").trim();
  
    const categoryId = SERVICE_TO_CATEGORY_MAP[serviceName];
  
    const matched =
      categoryId ??
      categoriesRef.current.find((cat) => {
        const catName = cat.name.trim();
        return catName === serviceName || serviceName.includes(catName) || catName.includes(serviceName);
      })?.id;
  
    const url = matched ? `/search?categoryId=${matched}` : "/search";
    router.push(url);
    router.refresh();
  };

  return (
    <div className="mx-4 my-2 p-4 border border-[#efeee7] rounded-xl bg-[#f5f4ec]">
      <p className="text-xs text-[#75786c] mb-2">선택하신 서비스</p>
      <div className="flex flex-wrap gap-1.5 mb-3">
        {estimate.selectedServices.map((service) => (
          <Badge
            key={service}
            variant="outline"
            className="bg-white text-[#4f6231] border-[#efeee7] rounded-full"
          >
            {service}
          </Badge>
        ))}
      </div>

      <div className="flex justify-between items-center py-2 border-t border-[#efeee7] mb-2">
        <span className="text-sm text-[#45483d]">예상 견적</span>
        <span className="text-sm font-bold text-[#4f6231]">
          {estimate.priceRange}
        </span>
      </div>

      <p className="text-xs text-[#75786c] mb-3">{estimate.summary}</p>

      <Button
        onClick={handleNavigate}
        className="w-full bg-[#4f6231] hover:bg-[#677b47] text-white rounded-xl mb-2"
      >
        프리랜서 탐색하기 →
      </Button>

      {showResetButton && (
        <Button
          onClick={onReset}
          variant="outline"
          className="w-full border-[#4f6231] text-[#4f6231] hover:bg-[#f5f4ec] rounded-xl"
        >
          다른 서비스 견적도 보기
        </Button>
      )}
    </div>
  );
}
