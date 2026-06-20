export default function PrivacyPage() {
  return (
    <div className="flex flex-1 flex-col bg-[#fbf9f2]">
      <div className="max-w-3xl mx-auto px-4 sm:px-6 lg:px-8 py-16 w-full">
        <h1 className="font-[var(--font-display)] text-3xl sm:text-4xl font-semibold text-[#1b1c18] mb-4">
          개인정보 처리방침
        </h1>
        <p className="text-sm text-[#75786c] mb-12">시행일: 2026년 6월 19일</p>

        <div className="space-y-10 text-[#45483d] leading-relaxed text-sm">
          <section>
            <h2 className="text-base font-semibold text-[#1b1c18] mb-2">1. 개인정보의 수집 항목 및 방법</h2>
            <p className="mb-2">회사는 서비스 제공을 위해 다음의 개인정보를 수집합니다.</p>
            <ul className="space-y-1 list-disc list-inside">
              <li><strong>필수항목:</strong> 이름, 이메일 주소, 비밀번호</li>
              <li><strong>선택항목:</strong> 프로필 사진, 전화번호, 활동 지역</li>
              <li><strong>프리랜서 추가항목:</strong> 카테고리, 소개글, 포트폴리오 이미지, 경력사항</li>
              <li><strong>자동수집:</strong> 접속 로그, 쿠키, 접속 IP</li>
            </ul>
          </section>

          <section>
            <h2 className="text-base font-semibold text-[#1b1c18] mb-2">2. 개인정보의 수집 및 이용 목적</h2>
            <ul className="space-y-1 list-disc list-inside">
              <li>회원가입 및 본인 확인</li>
              <li>웨딩 전문가 매칭 및 예약 서비스 제공</li>
              <li>프리랜서 프로필 및 포트폴리오 공개</li>
              <li>커뮤니티 서비스 운영</li>
              <li>서비스 개선 및 통계 분석</li>
              <li>고객 문의 응대</li>
            </ul>
          </section>

          <section>
            <h2 className="text-base font-semibold text-[#1b1c18] mb-2">3. 개인정보의 보유 및 이용 기간</h2>
            <p>
              회원의 개인정보는 회원탈퇴 시 즉시 파기합니다.
              다만, 관계법령에 따라 보존이 필요한 경우에는 해당 법령에서 정한 기간 동안 보관합니다.
            </p>
            <ul className="space-y-1 list-disc list-inside mt-2">
              <li>계약 또는 청약철회 등에 관한 기록: 5년</li>
              <li>대금결제 및 재화 등의 공급에 관한 기록: 5년</li>
              <li>소비자의 불만 또는 분쟁처리에 관한 기록: 3년</li>
              <li>접속 로그: 3개월</li>
            </ul>
          </section>

          <section>
            <h2 className="text-base font-semibold text-[#1b1c18] mb-2">4. 개인정보의 제3자 제공</h2>
            <p>
              회사는 원칙적으로 회원의 개인정보를 외부에 제공하지 않습니다.
              다만, 다음의 경우에는 예외로 합니다.
            </p>
            <ul className="space-y-1 list-disc list-inside mt-2">
              <li>회원이 사전에 동의한 경우</li>
              <li>예약 성사 시 거래 상대방에게 필요한 최소한의 정보 (이름, 연락처)</li>
              <li>법률에 특별한 규정이 있는 경우</li>
            </ul>
          </section>

          <section>
            <h2 className="text-base font-semibold text-[#1b1c18] mb-2">5. 개인정보의 파기</h2>
            <p>
              보유 기간이 경과하거나 처리 목적이 달성된 경우, 해당 개인정보를 지체 없이 파기합니다.
              전자적 파일 형태의 정보는 복구할 수 없는 방법으로 삭제하며,
              종이 문서에 기록된 정보는 분쇄하거나 소각하여 파기합니다.
            </p>
          </section>

          <section>
            <h2 className="text-base font-semibold text-[#1b1c18] mb-2">6. 이용자의 권리</h2>
            <p>회원은 언제든지 다음의 권리를 행사할 수 있습니다.</p>
            <ul className="space-y-1 list-disc list-inside mt-2">
              <li>개인정보 열람, 정정, 삭제 요청</li>
              <li>개인정보 처리 정지 요청</li>
              <li>회원탈퇴를 통한 개인정보 삭제</li>
            </ul>
            <p className="mt-2">
              마이페이지에서 직접 수정·삭제하거나, 고객센터를 통해 요청할 수 있습니다.
            </p>
          </section>

          <section>
            <h2 className="text-base font-semibold text-[#1b1c18] mb-2">7. 쿠키의 사용</h2>
            <p>
              회사는 로그인 유지 및 서비스 개선을 위해 쿠키를 사용합니다.
              브라우저 설정을 통해 쿠키 저장을 거부할 수 있으나,
              이 경우 일부 서비스 이용에 제한이 있을 수 있습니다.
            </p>
          </section>

          <section>
            <h2 className="text-base font-semibold text-[#1b1c18] mb-2">8. 개인정보 보호책임자</h2>
            <p>
              개인정보 처리에 관한 문의는 아래로 연락해 주시기 바랍니다.
            </p>
            <div className="mt-2 p-4 bg-[#f5f4ec] rounded-xl text-sm">
              <p>개인정보 보호책임자: Wedge 운영팀</p>
              <p>이메일: privacy@wedge.kr</p>
            </div>
          </section>

          <section className="pt-6 border-t border-[#efeee7]">
            <p className="text-xs text-[#75786c]">
              본 개인정보 처리방침은 2026년 6월 19일부터 시행됩니다.
            </p>
          </section>
        </div>
      </div>
    </div>
  );
}
