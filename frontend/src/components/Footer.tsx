import Link from "next/link";

export default function Footer() {
  return (
    <footer className="bg-[#1b1c18] text-[#c5c8ba]">
      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
        <div className="grid grid-cols-1 md:grid-cols-4 gap-8">
          {/* Brand */}
          <div className="md:col-span-1">
            <Link
              href="/"
              className="font-display text-2xl font-semibold text-white mb-3 block"
            >
              Wedge
            </Link>
            <p className="text-sm text-[#75786c] leading-relaxed">
              현대적인 커플을 위한
              <br />
              큐레이팅된 추억
            </p>
          </div>

          {/* Platform */}
          <div>
            <h4 className="text-sm font-semibold text-white mb-4">플랫폼</h4>
            <ul className="space-y-2">
              <li>
                <Link
                  href="/about"
                  className="text-sm text-[#75786c] hover:text-white transition-colors"
                >
                  소개
                </Link>
              </li>
              <li>
                <Link
                  href="/faq"
                  className="text-sm text-[#75786c] hover:text-white transition-colors"
                >
                  FAQ
                </Link>
              </li>
              <li>
                <Link
                  href="/terms"
                  className="text-sm text-[#75786c] hover:text-white transition-colors"
                >
                  이용약관
                </Link>
              </li>
            </ul>
          </div>

          {/* Support */}
          <div>
            <h4 className="text-sm font-semibold text-white mb-4">고객지원</h4>
            <ul className="space-y-2">
              <li>
                <Link
                  href="/contact"
                  className="text-sm text-[#75786c] hover:text-white transition-colors"
                >
                  문의하기
                </Link>
              </li>
              <li>
                <Link
                  href="/privacy"
                  className="text-sm text-[#75786c] hover:text-white transition-colors"
                >
                  개인정보 처리방침
                </Link>
              </li>
              <li>
                <Link
                  href="/careers"
                  className="text-sm text-[#75786c] hover:text-white transition-colors"
                >
                  채용
                </Link>
              </li>
            </ul>
          </div>

          {/* Social */}
          <div>
            <h4 className="text-sm font-semibold text-white mb-4">소셜</h4>
            <ul className="space-y-2">
              <li>
                <a
                  href="#"
                  className="text-sm text-[#75786c] hover:text-white transition-colors"
                >
                  Instagram
                </a>
              </li>
              <li>
                <a
                  href="#"
                  className="text-sm text-[#75786c] hover:text-white transition-colors"
                >
                  Pinterest
                </a>
              </li>
              <li>
                <a
                  href="#"
                  className="text-sm text-[#75786c] hover:text-white transition-colors"
                >
                  Twitter
                </a>
              </li>
            </ul>
          </div>
        </div>

        <div className="border-t border-[#45483d] mt-10 pt-6 text-center text-xs text-[#75786c]">
          © 2024 Wedge V4. All rights reserved.
        </div>
      </div>
    </footer>
  );
}
