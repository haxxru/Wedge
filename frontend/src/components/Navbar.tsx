"use client";

import Link from "next/link";
import { useState } from "react";
import { useRouter, usePathname } from "next/navigation";
import { Button } from "@/components/ui/button";
import { Sheet, SheetContent, SheetTrigger } from "@/components/ui/sheet";
import { API_BASE_URL, clearAccessToken, createAuthHeaders } from "@/lib/auth";
import { cn } from "@/lib/utils";
import { buttonVariants } from "@/components/ui/button";
import { Heart } from "lucide-react";
import { useUser } from "@/contexts/UserContext";

const mypageMenu = [
  { label: "회원 정보 수정", href: "/mypage?tab=info" },
  { label: "예약 현황", href: "/reservations" },
  { label: "관심 프리랜서", href: "/bookmarks" },
  { label: "리뷰 내역", href: "/mypage?tab=reviews" },
];

const clientMenu = [
  { label: "내 구인글", href: "/mypage/posts" },
];

const freelancerMenu = [
  { label: "내 제안서", href: "/mypage/proposals" },
  { label: "프로필 수정", href: "/mypage?tab=profile" },
  { label: "포트폴리오 수정", href: "/mypage?tab=portfolio" },
];

export default function Navbar() {
  const router = useRouter();
  const pathname = usePathname();
  const [mobileOpen, setMobileOpen] = useState(false);
  const { user, isLoggedIn, isLoading, clearUser } = useUser();

  const navLinks = [
    { href: "/search", label: "전문가 탐색" },
    { href: "/community", label: "커뮤니티" },
    { href: "/jobs", label: "구인" },
  ];

  const handleLogout = async () => {
    try {
      await fetch(`${API_BASE_URL}/api/v1/auth/logout`, {
        method: "POST",
        credentials: "include",
        headers: { ...createAuthHeaders() },
      });
    } catch {}

    clearAccessToken();
    clearUser();
    setMobileOpen(false);
    router.push("/");
    router.refresh();
  };

  const isActive = (href: string) => pathname.startsWith(href);

  const dropdownMenu = [
    ...mypageMenu,
    ...(user?.role === "CLIENT" ? clientMenu : []),
    ...(user?.role === "FREELANCER" ? freelancerMenu : []),
  ];

  return (
    <header className="sticky top-0 z-50 bg-[#fbf9f2] border-b border-[#c5c8ba]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div className="relative flex items-center justify-between h-16">
          {/* Logo */}
          <Link
            href="/"
            className="font-[var(--font-display)] text-2xl font-semibold text-[#4f6231] tracking-tight"
          >
            Wedge
          </Link>

          {/* Desktop Nav */}
          <nav className="hidden md:flex absolute left-1/2 -translate-x-1/2 items-center gap-8">
            {navLinks.map((link) => (
              <Link
                key={link.href}
                href={link.href}
                className={cn(
                  "text-sm font-medium transition-colors relative py-5",
                  isActive(link.href)
                    ? "text-[#4f6231]"
                    : "text-[#45483d] hover:text-[#4f6231]"
                )}
              >
                {link.label}
                {isActive(link.href) && (
                  <span className="absolute bottom-0 left-0 right-0 h-0.5 bg-[#4f6231] rounded-full" />
                )}
              </Link>
            ))}
          </nav>

          {/* Desktop Auth */}
          <div className="hidden md:flex items-center gap-3">
            {isLoading ? (
              <div className="flex items-center gap-3 w-48">
                <div className="h-8 w-20 rounded-full bg-[#efeee7] animate-pulse" />
                <div className="h-8 w-20 rounded-full bg-[#efeee7] animate-pulse" />
              </div>
            ) : isLoggedIn ? (
              <>
                <Link
                  href="/bookmarks"
                  className={cn(
                    buttonVariants({ variant: "ghost", size: "sm" }),
                    "text-[#45483d] hover:text-[#e85454] hover:bg-[#f5f4ec] p-2"
                  )}
                >
                  <Heart className="w-6 h-6" />
                </Link>
                <div className="relative group">
                  <Link
                    href="/mypage"
                    className={cn(
                      buttonVariants({ variant: "ghost", size: "sm" }),
                      "text-[#45483d] hover:text-[#4f6231] hover:bg-[#f5f4ec] gap-1.5"
                    )}
                  >
                    마이페이지
                    {user?.role && (
                      <span className={`text-[10px] font-medium px-1.5 py-0.5 rounded-full ${
                        user.role === "FREELANCER"
                          ? "bg-[#d3ebac] text-[#4f6231]"
                          : "bg-[#f6d9d3] text-[#6f5a55]"
                      }`}>
                        {user.role === "FREELANCER" ? "프리랜서" : "예비부부"}
                      </span>
                    )}
                  </Link>
                  <div className="absolute right-0 top-full pt-1 hidden group-hover:block z-50">
                    <div className="bg-white rounded-xl border border-[#efeee7] shadow-lg py-2 w-44">
                      {dropdownMenu.map((item) => (
                        <Link
                          key={item.href}
                          href={item.href}
                          className="block px-4 py-2 text-sm text-[#45483d] hover:bg-[#f5f4ec] hover:text-[#4f6231] transition-colors"
                        >
                          {item.label}
                        </Link>
                      ))}
                      <div className="border-t border-[#efeee7] mt-1 pt-1">
                        <button
                          onClick={handleLogout}
                          className="block w-full text-left px-4 py-2 text-sm text-[#75786c] hover:bg-[#f5f4ec] hover:text-[#45483d] transition-colors"
                        >
                          로그아웃
                        </button>
                      </div>
                    </div>
                  </div>
                </div>
                <Button
                  onClick={handleLogout}
                  variant="outline"
                  size="sm"
                  className="rounded-full border-[#c5c8ba] text-[#45483d] hover:bg-[#f5f4ec]"
                >
                  로그아웃
                </Button>
              </>
            ) : (
              <>
                <Link
                  href="/login"
                  className={cn(
                    buttonVariants({ variant: "ghost", size: "sm" }),
                    "text-[#45483d] hover:text-[#4f6231] hover:bg-[#f5f4ec]"
                  )}
                >
                  로그인
                </Link>
                <Link
                  href="/signup"
                  className={cn(
                    buttonVariants({ size: "sm" }),
                    "bg-[#4f6231] text-white hover:bg-[#677b47] rounded-full px-5"
                  )}
                >
                  회원가입
                </Link>
              </>
            )}
          </div>

          {/* Mobile Menu */}
          <Sheet open={mobileOpen} onOpenChange={setMobileOpen}>
            <SheetTrigger
              className="md:hidden"
              render={
                <Button variant="ghost" size="sm" className="p-2">
                  <svg
                    className="w-5 h-5"
                    fill="none"
                    stroke="currentColor"
                    viewBox="0 0 24 24"
                  >
                    <path
                      strokeLinecap="round"
                      strokeLinejoin="round"
                      strokeWidth={2}
                      d="M4 6h16M4 12h16M4 18h16"
                    />
                  </svg>
                </Button>
              }
            />
            <SheetContent side="right" className="!w-72 bg-[#fbf9f2] p-6">
              <div className="flex flex-col gap-6 mt-6">
                <Link
                  href="/"
                  className="font-[var(--font-display)] text-2xl font-semibold text-[#4f6231]"
                  onClick={() => setMobileOpen(false)}
                >
                  Wedge
                </Link>
                <nav className="flex flex-col gap-4">
                  {navLinks.map((link) => (
                    <Link
                      key={link.href}
                      href={link.href}
                      className={cn(
                        "text-base font-medium transition-colors",
                        isActive(link.href)
                          ? "text-[#4f6231]"
                          : "text-[#45483d] hover:text-[#4f6231]"
                      )}
                      onClick={() => setMobileOpen(false)}
                    >
                      {link.label}
                    </Link>
                  ))}
                </nav>
                <div className="flex flex-col gap-3 pt-4 border-t border-[#c5c8ba]">
                  {isLoading ? (
                    <div className="flex flex-col gap-3">
                      <div className="h-9 rounded-md bg-[#efeee7] animate-pulse" />
                      <div className="h-9 rounded-md bg-[#efeee7] animate-pulse" />
                    </div>
                  ) : isLoggedIn ? (
                    <>
                      <Link
                        href="/bookmarks"
                        onClick={() => setMobileOpen(false)}
                        className={cn(
                          buttonVariants({ variant: "outline" }),
                          "w-full justify-center gap-2"
                        )}
                      >
                        <Heart className="w-4 h-4" />
                        찜목록
                      </Link>
                      <Link
                        href="/mypage"
                        onClick={() => setMobileOpen(false)}
                        className={cn(
                          buttonVariants({ variant: "outline" }),
                          "w-full justify-center gap-1.5"
                        )}
                      >
                        마이페이지
                        {user?.role && (
                          <span className={`text-[10px] font-medium px-1.5 py-0.5 rounded-full ${
                            user.role === "FREELANCER"
                              ? "bg-[#d3ebac] text-[#4f6231]"
                              : "bg-[#f6d9d3] text-[#6f5a55]"
                          }`}>
                            {user.role === "FREELANCER" ? "프리랜서" : "예비부부"}
                          </span>
                        )}
                      </Link>
                      <Button
                        onClick={handleLogout}
                        className="w-full justify-center bg-[#4f6231] text-white hover:bg-[#677b47]"
                      >
                        로그아웃
                      </Button>
                    </>
                  ) : (
                    <>
                      <Link
                        href="/login"
                        onClick={() => setMobileOpen(false)}
                        className={cn(
                          buttonVariants({ variant: "outline" }),
                          "w-full justify-center"
                        )}
                      >
                        로그인
                      </Link>
                      <Link
                        href="/signup"
                        onClick={() => setMobileOpen(false)}
                        className={cn(
                          buttonVariants(),
                          "w-full justify-center bg-[#4f6231] text-white hover:bg-[#677b47]"
                        )}
                      >
                        회원가입
                      </Link>
                    </>
                  )}
                </div>
              </div>
            </SheetContent>
          </Sheet>
        </div>
      </div>
    </header>
  );
}
