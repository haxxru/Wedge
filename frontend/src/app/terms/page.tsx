export default function TermsPage() {
  return (
    <div className="flex flex-1 flex-col bg-[#fbf9f2]">
      <div className="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8 py-16 w-full">
        <h1 className="font-[var(--font-display)] text-3xl sm:text-4xl font-semibold text-[#1b1c18] mb-4">
          이용약관
        </h1>
        <p className="text-sm text-[#75786c] mb-12">시행일: 2026년 6월 19일</p>

        <div className="space-y-10 text-[#45483d] leading-relaxed text-sm">
          <section>
            <h2 className="text-base font-semibold text-[#1b1c18] mb-2">제1조 (목적)</h2>
            <p>
              이 약관은 Wedge(이하 &quot;회사&quot;)가 제공하는 웨딩 프리랜서 매칭 플랫폼 서비스(이하 &quot;서비스&quot;)의
              이용과 관련하여 회사와 이용자 간의 권리, 의무 및 책임사항을 규정함을 목적으로 합니다.
            </p>
          </section>

          <section>
            <h2 className="text-base font-semibold text-[#1b1c18] mb-2">제2조 (정의)</h2>
            <ul className="space-y-2 list-disc list-inside">
              <li>&quot;서비스&quot;란 회사가 제공하는 웨딩 전문가 매칭, 예약, 커뮤니티 등 일체의 서비스를 말합니다.</li>
              <li>&quot;회원&quot;이란 이 약관에 동의하고 회원가입을 완료한 자를 말합니다.</li>
              <li>&quot;예비부부&quot;란 웨딩 서비스를 의뢰하는 회원을 말합니다.</li>
              <li>&quot;프리랜서&quot;란 웨딩 관련 서비스를 제공하는 전문가 회원을 말합니다.</li>
            </ul>
          </section>

          <section>
            <h2 className="text-base font-semibold text-[#1b1c18] mb-2">제3조 (약관의 효력)</h2>
            <p>
              이 약관은 서비스 화면에 게시하거나 기타의 방법으로 회원에게 공지함으로써 효력이 발생합니다.
              회사는 관련 법령을 위배하지 않는 범위에서 이 약관을 개정할 수 있으며,
              개정 시 적용일자 7일 전부터 공지합니다.
            </p>
          </section>

          <section>
            <h2 className="text-base font-semibold text-[#1b1c18] mb-2">제4조 (회원가입)</h2>
            <p>
              회원가입은 이용자가 약관에 동의하고 회원정보를 기입한 후 회사가 이를 승인함으로써 체결됩니다.
              회사는 다음 각 호에 해당하는 경우 가입을 거부할 수 있습니다.
            </p>
            <ul className="space-y-1 list-disc list-inside mt-2">
              <li>타인의 정보를 도용한 경우</li>
              <li>허위 정보를 기재한 경우</li>
              <li>기타 회사가 정한 이용요건을 충족하지 못한 경우</li>
            </ul>
          </section>

          <section>
            <h2 className="text-base font-semibold text-[#1b1c18] mb-2">제5조 (서비스의 제공)</h2>
            <p>
              회사는 다음의 서비스를 제공합니다.
            </p>
            <ul className="space-y-1 list-disc list-inside mt-2">
              <li>웨딩 전문가 검색 및 프로필 조회</li>
              <li>예약 및 일정 관리</li>
              <li>AI 기반 사전 견적 서비스</li>
              <li>구인·구직 게시판</li>
              <li>커뮤니티 (웨딩 후기, 팁 공유)</li>
              <li>리뷰 및 평점 시스템</li>
            </ul>
          </section>

          <section>
            <h2 className="text-base font-semibold text-[#1b1c18] mb-2">제6조 (회원의 의무)</h2>
            <ul className="space-y-1 list-disc list-inside">
              <li>회원은 서비스 이용 시 관계법령 및 이 약관의 규정을 준수해야 합니다.</li>
              <li>타인의 개인정보를 수집하거나 서비스를 방해하는 행위를 해서는 안 됩니다.</li>
              <li>프리랜서 회원은 허위 포트폴리오를 등록해서는 안 됩니다.</li>
            </ul>
          </section>

          <section>
            <h2 className="text-base font-semibold text-[#1b1c18] mb-2">제7조 (서비스 이용의 제한)</h2>
            <p>
              회사는 회원이 이 약관을 위반하거나 서비스의 정상적인 운영을 방해한 경우,
              사전 통지 후 서비스 이용을 제한하거나 회원자격을 상실시킬 수 있습니다.
            </p>
          </section>

          <section>
            <h2 className="text-base font-semibold text-[#1b1c18] mb-2">제8조 (면책)</h2>
            <p>
              회사는 예비부부와 프리랜서 간의 거래에 대해 중개 역할만을 수행하며,
              거래 당사자 간 분쟁에 대해서는 직접적인 책임을 지지 않습니다.
              다만, 회사는 분쟁 해결을 위해 성실히 협조합니다.
            </p>
          </section>

          <section className="pt-6 border-t border-[#efeee7]">
            <p className="text-xs text-[#75786c]">
              본 약관은 2026년 6월 19일부터 시행됩니다.
            </p>
          </section>
        </div>
      </div>
    </div>
  );
}
