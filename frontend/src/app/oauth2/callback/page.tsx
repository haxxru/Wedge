"use client";

import { Suspense, useEffect } from "react";
import { useRouter, useSearchParams } from "next/navigation";
import { useUser } from "@/contexts/UserContext";
import { setAccessToken } from "@/lib/auth";

function OAuth2CallbackContent() {
  const router = useRouter();
  const { refreshUser } = useUser();
  const searchParams = useSearchParams();
  const accessToken = searchParams.get("accessToken");
  const needsOnboarding = searchParams.get("needsOnboarding") === "true";
  const hasToken = Boolean(accessToken);

  useEffect(() => {
    if (!accessToken) {
      const timer = window.setTimeout(() => {
        router.replace("/login");
      }, 1500);

      return () => window.clearTimeout(timer);
    }

    const applyAuth = async () => {
      setAccessToken(accessToken);
      await refreshUser();

      if (needsOnboarding) {
        router.replace("/select-role");
      } else {
        router.replace("/");
      }
      router.refresh();
    };

    void applyAuth();
  }, [accessToken, needsOnboarding, refreshUser, router]);

  return (
    <div className="flex min-h-screen items-center justify-center bg-[#fbf9f2] px-4 text-center">
      <div className="flex flex-col items-center gap-3">
        {hasToken && (
          <div className="w-8 h-8 border-2 border-[#4f6231] border-t-transparent rounded-full animate-spin" />
        )}
        <p className="text-sm text-[#45483d]">
          {hasToken
            ? "소셜 로그인 처리 중입니다..."
            : "토큰 정보를 찾을 수 없습니다. 다시 로그인해주세요."}
        </p>
      </div>
    </div>
  );
}

export default function OAuth2CallbackPage() {
  return (
    <Suspense fallback={null}>
      <OAuth2CallbackContent />
    </Suspense>
  );
}
