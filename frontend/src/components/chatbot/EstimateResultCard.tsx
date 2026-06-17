import type { EstimateResult } from "@/types/chatbot";
import { useRouter } from "next/navigation";

interface Props {
  estimate: EstimateResult;
}

function parsePriceRange(priceRange: string): { min: number; max: number } {
  const numbers = priceRange.match(/\d+/g);
  if (!numbers || numbers.length < 2) return { min: 0, max: 0 };
  return {
    min: parseInt(numbers[0]) * 10000,
    max: parseInt(numbers[1]) * 10000,
  };
}

export function EstimateResultCard({ estimate }: Props) {
  const router = useRouter();

  const handleNavigate = () => {
    const { min, max } = parsePriceRange(estimate.priceRange);
    router.push(`/freelancers?minPrice=${min}&maxPrice=${max}`);
  };

  return (
    <div className="mx-4 my-2 p-4 bg-[#f5f4ec] rounded-2xl border border-[#efeee7]">
      {/* 선택 서비스 목록 */}
      <p className="text-xs text-gray-400 mb-2">선택하신 서비스</p>
      <div className="flex flex-wrap gap-1.5 mb-3">
        {estimate.selectedServices.map((service) => (
          <span
            key={service}
            className="px-2.5 py-1 bg-white rounded-full text-xs text-[#4f6231] border border-[#efeee7]"
          >
            {service}
          </span>
        ))}
      </div>

      {/* 가격 범위 */}
      <div className="flex justify-between items-center py-2 border-t border-rose-100 mb-2">
        <span className="text-sm text-gray-600">예상 견적</span>
        <span className="text-sm font-bold text-[#4f6231]">
          {estimate.priceRange}
        </span>
      </div>

      {/* 요약 멘트 */}
      <p className="text-xs text-gray-500 mb-3">{estimate.summary}</p>

      {/* CTA 버튼 */}
      <button
        onClick={handleNavigate}
        className="w-full py-2.5 bg-[#4f6231] hover:bg-[#677b47] text-white text-sm font-semibold rounded-xl transition-colors"
      >
        프리랜서 탐색하기 →
      </button>
    </div>
  );
}
