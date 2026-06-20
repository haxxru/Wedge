import Link from "next/link";

export default function AboutPage() {
  return (
    <div className="flex flex-1 flex-col bg-[#fbf9f2]">
      <div className="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8 py-16 w-full">
        <h1 className="font-[var(--font-display)] text-3xl sm:text-4xl font-semibold text-[#1b1c18] mb-4">
          Wedge 소개
        </h1>
        <p className="text-[#75786c] mb-12">
          현대적인 커플을 위한 큐레이팅된 웨딩 전문가 매칭 플랫폼
        </p>

        <section className="space-y-10 text-[#45483d] leading-relaxed">
          <div>
            <h2 className="text-xl font-semibold text-[#1b1c18] mb-3">우리가 만드는 가치</h2>
            <p>
              Wedge는 결혼을 준비하는 예비부부와 웨딩 분야 프리랜서를 연결하는 매칭 플랫폼입니다.
              스냅 사진작가, 영상 감독, 플로리스트, 메이크업 아티스트, 웨딩 플래너 등
              다양한 전문가를 한 곳에서 비교하고, 검증된 포트폴리오와 리뷰를 통해
              나에게 꼭 맞는 전문가를 찾을 수 있습니다.
            </p>
          </div>

          <div>
            <h2 className="text-xl font-semibold text-[#1b1c18] mb-3">어떻게 작동하나요?</h2>
            <ul className="space-y-3 list-disc list-inside">
              <li>원하는 카테고리와 지역으로 전문가를 검색하세요.</li>
              <li>포트폴리오와 리뷰를 확인하고 마음에 드는 전문가를 찜하세요.</li>
              <li>AI 챗봇으로 사전 견적을 받아보고, 바로 예약까지 진행할 수 있습니다.</li>
              <li>구인글을 올리면 관심 있는 프리랜서가 직접 제안서를 보내드립니다.</li>
            </ul>
          </div>

          <div>
            <h2 className="text-xl font-semibold text-[#1b1c18] mb-3">프리랜서라면</h2>
            <p>
              Wedge에 프로필을 등록하고, 포트폴리오를 올려 예비부부에게 나를 알리세요.
              구인글에 제안서를 보내거나, 검색을 통해 고객이 직접 찾아올 수 있습니다.
              예약 관리와 리뷰 시스템으로 신뢰를 쌓아가세요.
            </p>
          </div>

          <div className="pt-6 border-t border-[#efeee7]">
            <p className="text-sm text-[#75786c]">
              문의사항이 있으시면{" "}
              <Link href="mailto:support@wedge.kr" className="text-[#4f6231] hover:underline">
                support@wedge.kr
              </Link>
              로 연락해 주세요.
            </p>
          </div>
        </section>
      </div>
    </div>
  );
}
