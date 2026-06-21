"use client";

import { useEffect, useRef, useState } from "react";
import Link from "next/link";
import { useRouter } from "next/navigation";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { API_BASE_URL } from "@/lib/auth";

type UserType = "couple" | "freelancer" | null;
type Step = 1 | 2 | 3;

export default function SignupPage() {
  const router = useRouter();
  const [step, setStep] = useState<Step>(1);
  const [userType, setUserType] = useState<UserType>(null);
  const [agreed, setAgreed] = useState({ terms: false, privacy: false, marketing: false });
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [phone, setPhone] = useState("");
  const [password, setPassword] = useState("");
  const [passwordConfirm, setPasswordConfirm] = useState("");
  const [showPassword, setShowPassword] = useState(false);
  const [showPasswordConfirm, setShowPasswordConfirm] = useState(false);
  const [emailCode, setEmailCode] = useState("");
  const [emailVerified, setEmailVerified] = useState(false);
  const [emailSending, setEmailSending] = useState(false);
  const [emailTimer, setEmailTimer] = useState(0);
  const [errorMessage, setErrorMessage] = useState("");
  const [isSubmitting, setIsSubmitting] = useState(false);

  const timerRef = useRef<NodeJS.Timeout | null>(null);

  useEffect(() => {
    if (emailTimer > 0) {
      timerRef.current = setTimeout(() => setEmailTimer(emailTimer - 1), 1000);
    }
    return () => { if (timerRef.current) clearTimeout(timerRef.current); };
  }, [emailTimer]);

  const handleSendCode = async () => {
    if (!email.trim() || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
      setErrorMessage("올바른 이메일 형식을 입력해주세요.");
      return;
    }
    setEmailSending(true);
    setErrorMessage("");
    try {
      const res = await fetch(`${API_BASE_URL}/api/v1/auth/email/send-code`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email }),
      });
      if (!res.ok) {
        const data = await res.json().catch(() => null);
        throw new Error(data?.message ?? "인증 코드 발송에 실패했습니다.");
      }
      setEmailTimer(300);
      setErrorMessage("");
    } catch (error) {
      setErrorMessage(error instanceof Error ? error.message : "인증 코드 발송에 실패했습니다.");
    } finally {
      setEmailSending(false);
    }
  };

  const handleVerifyCode = async () => {
    try {
      const res = await fetch(`${API_BASE_URL}/api/v1/auth/email/verify`, {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ email, code: emailCode }),
      });
      const data = await res.json();
      if (data.verified) {
        setEmailVerified(true);
        setErrorMessage("");
      } else {
        setErrorMessage("인증 코드가 일치하지 않습니다.");
      }
    } catch {
      setErrorMessage("인증 확인에 실패했습니다.");
    }
  };

  const role = userType === "freelancer" ? "FREELANCER" : "CLIENT";

  const handleSignup = async () => {
    if (!userType) {
      setErrorMessage("회원 유형을 선택해주세요.");
      return;
    }

    setErrorMessage("");
    setIsSubmitting(true);

    try {
      const response = await fetch(`${API_BASE_URL}/api/v1/auth/signup`, {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          email,
          password,
          name,
          phone,
          role,
        }),
      });

      const data = await response.json().catch(() => null);

      if (!response.ok) {
        throw new Error(data?.message ?? "회원가입에 실패했습니다.");
      }

      router.push("/login");
    } catch (error) {
      setErrorMessage(
        error instanceof Error ? error.message : "회원가입에 실패했습니다."
      );
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <div className="min-h-screen bg-[#fbf9f2] flex flex-col items-center justify-center px-4 py-12">
      {/* Logo */}
      <Link
        href="/"
        className="font-[var(--font-display)] text-3xl font-semibold text-[#4f6231] mb-2"
      >
        Wedge
      </Link>
      <p className="text-xs text-[#75786c] tracking-wider mb-10">
        현대적인 커플을 위한 큐레이팅된 추억
      </p>

      {/* Step Indicator */}
      <div className="flex items-center gap-2 mb-8">
        {([1, 2, 3] as Step[]).map((s) => (
          <div key={s} className="flex items-center gap-2">
            <div
              className={`w-8 h-8 rounded-full flex items-center justify-center text-sm font-semibold transition-all ${
                step >= s
                  ? "bg-[#4f6231] text-white"
                  : "bg-[#efeee7] text-[#75786c]"
              }`}
            >
              {s}
            </div>
            {s < 3 && (
              <div
                className={`w-12 h-0.5 transition-all ${
                  step > s ? "bg-[#4f6231]" : "bg-[#efeee7]"
                }`}
              />
            )}
          </div>
        ))}
      </div>

      <div className="w-full max-w-md bg-white rounded-3xl shadow-[0px_4px_20px_rgba(108,129,76,0.08)] p-8">
        {/* Step 1: User Type Selection */}
        {step === 1 && (
          <div>
            <h1 className="font-[var(--font-display)] text-2xl font-semibold text-[#1b1c18] mb-2">
              어떤 분이신가요?
            </h1>
            <p className="text-sm text-[#75786c] mb-8">
              나에게 맞는 유형을 선택해주세요
            </p>
            <div className="space-y-4">
              <button
                onClick={() => { setUserType("couple"); setStep(2); }}
                className={`w-full p-5 rounded-2xl border-2 text-left transition-all hover:border-[#4f6231] hover:shadow-[0px_4px_20px_rgba(108,129,76,0.1)] ${
                  userType === "couple" ? "border-[#4f6231] bg-[#f5f4ec]" : "border-[#efeee7]"
                }`}
              >
                <div className="flex items-center justify-between">
                  <div className="flex items-center gap-4">
                    <div className="w-12 h-12 rounded-full bg-[#f6d9d3] flex items-center justify-center text-2xl">
                      💑
                    </div>
                    <div>
                      <p className="font-semibold text-[#1b1c18] mb-1">예비 커플</p>
                      <p className="text-xs text-[#75786c] leading-relaxed max-w-xs">
                        엄선된 럭셔리 프리랜서를 찾고 꿈같은 기념일을 계획합니다
                      </p>
                    </div>
                  </div>
                  <svg className="w-5 h-5 text-[#4f6231] shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                  </svg>
                </div>
              </button>

              <button
                onClick={() => { setUserType("freelancer"); setStep(2); }}
                className={`w-full p-5 rounded-2xl border-2 text-left transition-all hover:border-[#4f6231] hover:shadow-[0px_4px_20px_rgba(108,129,76,0.1)] ${
                  userType === "freelancer" ? "border-[#4f6231] bg-[#f5f4ec]" : "border-[#efeee7]"
                }`}
              >
                <div className="flex items-center justify-between">
                  <div className="flex items-center gap-4">
                    <div className="w-12 h-12 rounded-full bg-[#d3ebac] flex items-center justify-center text-2xl">
                      📷
                    </div>
                    <div>
                      <p className="font-semibold text-[#1b1c18] mb-1">프리랜서</p>
                      <p className="text-xs text-[#75786c] leading-relaxed max-w-xs">
                        사진, 케이터링, 플라워, 베뉴 등 프리미엄 서비스를 제공합니다
                      </p>
                    </div>
                  </div>
                  <svg className="w-5 h-5 text-[#4f6231] shrink-0" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
                  </svg>
                </div>
              </button>
            </div>
          </div>
        )}

        {/* Step 2: Account Info */}
        {step === 2 && (
          <div>
            <button
              onClick={() => setStep(1)}
              className="flex items-center gap-1 text-sm text-[#75786c] hover:text-[#45483d] mb-6"
            >
              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" />
              </svg>
              이전 단계
            </button>
            <h1 className="font-[var(--font-display)] text-2xl font-semibold text-[#1b1c18] mb-2">
              계정 정보 입력
            </h1>
            <p className="text-sm text-[#75786c] mb-8">
              기본 정보를 입력해주세요
            </p>
            <form className="space-y-5" onSubmit={(e) => {
              e.preventDefault();
              setErrorMessage("");
              if (!name.trim()) { setErrorMessage("성함을 입력해주세요."); return; }
              if (!email.trim() || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) { setErrorMessage("올바른 이메일 형식을 입력해주세요."); return; }
              if (!emailVerified) { setErrorMessage("이메일 인증을 완료해주세요."); return; }
              if (!phone.trim() || !/^01[016789]-?\d{3,4}-?\d{4}$/.test(phone)) { setErrorMessage("올바른 전화번호를 입력해주세요. (예: 010-1234-5678)"); return; }
              if (password.length < 8) { setErrorMessage("비밀번호는 8자 이상이어야 합니다."); return; }
              if (!/[!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?]/.test(password)) { setErrorMessage("비밀번호에 특수문자를 1개 이상 포함해주세요."); return; }
              if (password !== passwordConfirm) { setErrorMessage("비밀번호가 일치하지 않습니다."); return; }
              setStep(3);
            }}>
              <div className="space-y-1.5">
                <Label className="text-sm font-medium text-[#45483d]">성함 <span className="text-red-500">*</span></Label>
                <Input
                  value={name}
                  onChange={(e) => setName(e.target.value)}
                  placeholder="홍길동"
                  required
                  className="h-11 bg-[#f5f4ec] border-[#efeee7] focus-visible:ring-[#4f6231]"
                />
              </div>
              <div className="space-y-1.5">
                <Label className="text-sm font-medium text-[#45483d]">이메일 주소 <span className="text-red-500">*</span></Label>
                <div className="flex gap-2">
                  <Input
                    type="email"
                    value={email}
                    onChange={(e) => { setEmail(e.target.value); setEmailVerified(false); }}
                    placeholder="hello@example.com"
                    required
                    disabled={emailVerified}
                    className="h-11 bg-[#f5f4ec] border-[#efeee7] focus-visible:ring-[#4f6231] flex-1"
                  />
                  <Button
                    type="button"
                    onClick={handleSendCode}
                    disabled={emailSending || emailVerified}
                    className="h-11 px-4 bg-[#4f6231] hover:bg-[#677b47] text-white rounded-xl text-sm shrink-0"
                  >
                    {emailVerified ? "인증완료" : emailSending ? "발송중..." : emailTimer > 0 ? "재발송" : "인증번호"}
                  </Button>
                </div>
                {emailTimer > 0 && !emailVerified && (
                  <div className="flex gap-2 mt-2">
                    <Input
                      value={emailCode}
                      onChange={(e) => setEmailCode(e.target.value)}
                      placeholder="인증 코드 6자리"
                      maxLength={6}
                      className="h-10 bg-[#f5f4ec] border-[#efeee7] focus-visible:ring-[#4f6231] flex-1"
                    />
                    <Button
                      type="button"
                      onClick={handleVerifyCode}
                      variant="outline"
                      className="h-10 px-4 border-[#4f6231] text-[#4f6231] rounded-xl text-sm shrink-0"
                    >
                      확인
                    </Button>
                    <span className="text-xs text-[#75786c] flex items-center shrink-0">
                      {Math.floor(emailTimer / 60)}:{String(emailTimer % 60).padStart(2, '0')}
                    </span>
                  </div>
                )}
                {emailVerified && (
                  <p className="text-xs text-[#4f6231] mt-1">이메일 인증이 완료되었습니다.</p>
                )}
              </div>
              <div className="space-y-1.5">
                <Label className="text-sm font-medium text-[#45483d]">전화번호 <span className="text-red-500">*</span></Label>
                <Input
                  type="tel"
                  value={phone}
                  onChange={(e) => setPhone(e.target.value)}
                  placeholder="010-0000-0000"
                  required
                  className="h-11 bg-[#f5f4ec] border-[#efeee7] focus-visible:ring-[#4f6231]"
                />
              </div>
              <div className="space-y-1.5">
                <Label className="text-sm font-medium text-[#45483d]">비밀번호 <span className="text-red-500">*</span></Label>
                <div className="relative">
                  <Input
                    type={showPassword ? "text" : "password"}
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                    placeholder="8자 이상, 특수문자 1개 포함"
                    required
                    className="h-11 bg-[#f5f4ec] border-[#efeee7] focus-visible:ring-[#4f6231] pr-11"
                  />
                  <button
                    type="button"
                    onClick={() => setShowPassword(!showPassword)}
                    className="absolute right-3 top-1/2 -translate-y-1/2 text-[#75786c] hover:text-[#45483d]"
                  >
                    {showPassword ? (
                      <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21" />
                      </svg>
                    ) : (
                      <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                      </svg>
                    )}
                  </button>
                </div>
              </div>
              <div className="space-y-1.5">
                <Label className="text-sm font-medium text-[#45483d]">비밀번호 확인 <span className="text-red-500">*</span></Label>
                <div className="relative">
                  <Input
                    type={showPasswordConfirm ? "text" : "password"}
                    value={passwordConfirm}
                    onChange={(e) => setPasswordConfirm(e.target.value)}
                    placeholder="비밀번호를 다시 입력해주세요"
                    required
                    className="h-11 bg-[#f5f4ec] border-[#efeee7] focus-visible:ring-[#4f6231] pr-11"
                  />
                  <button
                    type="button"
                    onClick={() => setShowPasswordConfirm(!showPasswordConfirm)}
                    className="absolute right-3 top-1/2 -translate-y-1/2 text-[#75786c] hover:text-[#45483d]"
                  >
                    {showPasswordConfirm ? (
                      <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.88 9.88l-3.29-3.29m7.532 7.532l3.29 3.29M3 3l3.59 3.59m0 0A9.953 9.953 0 0112 5c4.478 0 8.268 2.943 9.543 7a10.025 10.025 0 01-4.132 5.411m0 0L21 21" />
                      </svg>
                    ) : (
                      <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 12a3 3 0 11-6 0 3 3 0 016 0z" />
                        <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z" />
                      </svg>
                    )}
                  </button>
                </div>
              </div>
              {errorMessage && (
                <p className="text-sm text-red-500">{errorMessage}</p>
              )}
              <Button type="submit" className="w-full h-11 bg-[#4f6231] hover:bg-[#677b47] text-white rounded-xl">
                다음 단계
              </Button>
            </form>
          </div>
        )}

        {/* Step 3: Terms */}
        {step === 3 && (
          <div>
            <button
              onClick={() => setStep(2)}
              className="flex items-center gap-1 text-sm text-[#75786c] hover:text-[#45483d] mb-6"
            >
              <svg className="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" />
              </svg>
              이전 단계
            </button>
            <h1 className="font-[var(--font-display)] text-2xl font-semibold text-[#1b1c18] mb-2">
              약관 동의
            </h1>
            <p className="text-sm text-[#75786c] mb-8">
              서비스 이용을 위해 약관에 동의해주세요
            </p>
            <div className="space-y-4 mb-8">
              <label className="flex items-start gap-3 cursor-pointer">
                <input
                  type="checkbox"
                  checked={agreed.terms}
                  onChange={(e) => setAgreed({ ...agreed, terms: e.target.checked })}
                  className="mt-0.5 w-4 h-4 accent-[#4f6231]"
                />
                <div>
                  <p className="text-sm font-medium text-[#1b1c18]">
                    이용약관 동의 <span className="text-red-500">*</span>
                  </p>
                  <p className="text-xs text-[#75786c]">서비스 이용에 관한 약관에 동의합니다</p>
                </div>
              </label>
              <label className="flex items-start gap-3 cursor-pointer">
                <input
                  type="checkbox"
                  checked={agreed.privacy}
                  onChange={(e) => setAgreed({ ...agreed, privacy: e.target.checked })}
                  className="mt-0.5 w-4 h-4 accent-[#4f6231]"
                />
                <div>
                  <p className="text-sm font-medium text-[#1b1c18]">
                    개인정보 처리방침 및 쿠키 동의 <span className="text-red-500">*</span>
                  </p>
                  <p className="text-xs text-[#75786c]">개인정보 수집·이용에 동의합니다</p>
                </div>
              </label>
              <label className="flex items-start gap-3 cursor-pointer">
                <input
                  type="checkbox"
                  checked={agreed.marketing}
                  onChange={(e) => setAgreed({ ...agreed, marketing: e.target.checked })}
                  className="mt-0.5 w-4 h-4 accent-[#4f6231]"
                />
                <div>
                  <p className="text-sm font-medium text-[#1b1c18]">
                    마케팅 정보 수신 동의{" "}
                    <span className="text-xs font-normal text-[#75786c]">(선택)</span>
                  </p>
                  <p className="text-xs text-[#75786c]">웨딩 트렌드 및 특별 혜택을 받아보세요</p>
                </div>
              </label>
            </div>
            {errorMessage && (
              <p className="text-sm text-red-500 mb-4">{errorMessage}</p>
            )}
            <Button
              onClick={handleSignup}
              className="w-full h-11 bg-[#4f6231] hover:bg-[#677b47] text-white rounded-xl"
              disabled={!agreed.terms || !agreed.privacy || isSubmitting}
            >
              가입 완료하기
            </Button>
          </div>
        )}

        <p className="text-center text-sm text-[#75786c] mt-6">
          이미 계정이 있으신가요?{" "}
          <Link href="/login" className="text-[#4f6231] font-medium hover:underline">
            로그인
          </Link>
        </p>
      </div>

    </div>
  );
}
