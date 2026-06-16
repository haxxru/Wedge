import Image from "next/image";
import Link from "next/link";
import Navbar from "@/components/Navbar";
import Footer from "@/components/Footer";
import { Badge } from "@/components/ui/badge";
import { Avatar, AvatarFallback } from "@/components/ui/avatar";

const tabs = ["웨딩 후기", "꿀팁", "구인", "게시판", "재능기부"];

const posts = [
  {
    category: "웨딩 후기",
    title: "빌라 아우라에서 찾은 평온함",
    excerpt: "이탈리아 토스카나 빌라에서의 웨딩은 기대 이상이었어요. 올리브 나무 사이의 황혼 속 세레모니가 꿈만 같았습니다.",
    author: "Elena Rossi",
    initials: "EA",
    img: "https://picsum.photos/seed/villa/600/400",
  },
  {
    category: "꿀팁",
    title: "식물 미니멀리즘의 미학",
    excerpt: "웨딩 플라워를 최소화하면서도 최대의 임팩트를 주는 방법. 그린 위주의 보태니컬 스타일 가이드.",
    author: "Marcus K.",
    initials: "MK",
    img: "https://picsum.photos/seed/botanic/600/400",
  },
  {
    category: "재능기부",
    title: "빛을 담다: 무료 필름 워크숍",
    excerpt: "비영리 웨딩을 위한 무료 필름 포토그래피 워크숍입니다. 저소득층 예비 부부 3쌍 선발.",
    author: "Sophia Owens",
    initials: "SO",
    img: "https://picsum.photos/seed/workshop/600/400",
  },
  {
    category: "구인",
    title: "스테이셔너리 아티스트 모집",
    excerpt: "2024년 9월 가을 웨딩을 위한 캘리그래피 & 스테이셔너리 아티스트를 찾습니다. 경력자 우대.",
    author: "Julian Hayes",
    initials: "JH",
    img: "https://picsum.photos/seed/stationery/600/400",
  },
  {
    category: "꿀팁",
    title: "웨딩 예산 절약의 기술",
    excerpt: "평균 웨딩 비용이 5000만원을 넘는 요즘, 럭셔리한 느낌을 유지하면서도 합리적으로 준비하는 방법.",
    author: "Anna Lee",
    initials: "AL",
    img: "https://picsum.photos/seed/budget/600/400",
  },
  {
    category: "게시판",
    title: "결혼 준비 D-6개월 체크리스트",
    excerpt: "결혼식 6개월 전부터 시작해야 할 것들의 완벽한 타임라인. 놓치기 쉬운 항목들을 정리했어요.",
    author: "David V.",
    initials: "DV",
    img: "https://picsum.photos/seed/checklist/600/400",
  },
];

const popular = [
  { title: "코모 호수에서의 드레스 선택기", comments: 32, img: "https://picsum.photos/seed/pop1/80/80" },
  { title: "웨딩 촬영 전 알아야 할 것들", comments: 18, img: "https://picsum.photos/seed/pop2/80/80" },
  { title: "플로럴 아치 DIY 완전 가이드", comments: 45, img: "https://picsum.photos/seed/pop3/80/80" },
];

const experts = [
  { name: "Studio Aurelia", location: "Milan", img: "https://picsum.photos/seed/exp1/200/200" },
  { name: "Green & Grace", location: "London", img: "https://picsum.photos/seed/exp2/200/200" },
  { name: "Noir Lens", location: "New York", img: "https://picsum.photos/seed/exp3/200/200" },
];

const categoryColor: Record<string, string> = {
  "웨딩 후기": "bg-[#d3ebac] text-[#4f6231]",
  "꿀팁": "bg-[#f6d9d3] text-[#6f5a55]",
  "재능기부": "bg-[#efeee7] text-[#45483d]",
  "구인": "bg-[#f5f4ec] text-[#4f6231]",
  "게시판": "bg-[#efeee7] text-[#45483d]",
};

export default function CommunityPage() {
  return (
    <div className="flex flex-col min-h-screen bg-[#fbf9f2]">
      <Navbar />

      {/* Hero */}
      <section className="bg-[#f5f4ec] py-14">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 text-center">
          <p className="text-xs font-medium tracking-widest uppercase text-[#6f5a55] mb-3">
            Community
          </p>
          <h1 className="font-[var(--font-display)] text-4xl font-semibold text-[#1b1c18] mb-3">
            커뮤니티
          </h1>
          <p className="text-sm text-[#75786c] max-w-md mx-auto">
            현대적인 커플과 전문가들이 지혜를 나누는 큐레이팅된 공간
          </p>
        </div>
      </section>

      {/* Tabs */}
      <div className="border-b border-[#efeee7] bg-white">
        <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
          <div className="flex items-center gap-1 overflow-x-auto py-3">
            {tabs.map((tab, i) => (
              <button
                key={tab}
                className={`shrink-0 px-5 py-2 rounded-full text-sm font-medium transition-all ${
                  i === 0
                    ? "bg-[#4f6231] text-white"
                    : "text-[#45483d] hover:bg-[#f5f4ec]"
                }`}
              >
                {tab}
              </button>
            ))}
          </div>
        </div>
      </div>

      <div className="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12 w-full">
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-8">
          {/* Main Content */}
          <div className="lg:col-span-2 space-y-6">
            {posts.map((post, i) => (
              <article
                key={i}
                className="bg-white rounded-2xl overflow-hidden border border-[#efeee7] hover:shadow-[0px_4px_20px_rgba(108,129,76,0.08)] transition-all flex flex-col sm:flex-row"
              >
                <div className="relative sm:w-52 h-44 sm:h-auto shrink-0 overflow-hidden">
                  <Image
                    src={post.img}
                    alt={post.title}
                    fill
                    className="object-cover"
                  />
                </div>
                <div className="p-5 flex flex-col justify-between">
                  <div>
                    <Badge
                      className={`${categoryColor[post.category] || "bg-[#efeee7] text-[#45483d]"} border-0 text-xs mb-3`}
                    >
                      {post.category}
                    </Badge>
                    <h3 className="font-[var(--font-display)] font-semibold text-[#1b1c18] text-base mb-2 leading-snug">
                      {post.title}
                    </h3>
                    <p className="text-sm text-[#75786c] leading-relaxed line-clamp-2">
                      {post.excerpt}
                    </p>
                  </div>
                  <div className="flex items-center gap-2 mt-4">
                    <Avatar className="w-7 h-7">
                      <AvatarFallback className="bg-[#d3ebac] text-[#4f6231] text-xs font-semibold">
                        {post.initials}
                      </AvatarFallback>
                    </Avatar>
                    <span className="text-xs text-[#75786c]">{post.author}</span>
                  </div>
                </div>
              </article>
            ))}
          </div>

          {/* Sidebar */}
          <div className="space-y-6">
            {/* Popular Posts */}
            <div className="bg-white rounded-2xl border border-[#efeee7] p-5">
              <h3 className="font-[var(--font-display)] text-base font-semibold text-[#1b1c18] mb-4">
                인기 게시물
              </h3>
              <div className="space-y-4">
                {popular.map((p, i) => (
                  <div key={i} className="flex items-center gap-3">
                    <div className="relative w-12 h-12 rounded-xl overflow-hidden shrink-0">
                      <Image src={p.img} alt={p.title} fill sizes="48px" className="object-cover" />
                    </div>
                    <div className="flex-1 min-w-0">
                      <p className="text-sm font-medium text-[#1b1c18] line-clamp-2 leading-snug mb-1">
                        {p.title}
                      </p>
                      <p className="text-xs text-[#75786c]">댓글 {p.comments}개</p>
                    </div>
                  </div>
                ))}
              </div>
            </div>

            {/* Featured Experts */}
            <div className="bg-white rounded-2xl border border-[#efeee7] p-5">
              <h3 className="font-[var(--font-display)] text-base font-semibold text-[#1b1c18] mb-4">
                주목할 전문가
              </h3>
              <div className="space-y-4">
                {experts.map((exp, i) => (
                  <div key={i} className="flex items-center gap-3">
                    <div className="relative w-12 h-12 rounded-full overflow-hidden shrink-0">
                      <Image src={exp.img} alt={exp.name} fill sizes="48px" className="object-cover" />
                    </div>
                    <div>
                      <p className="text-sm font-medium text-[#1b1c18]">{exp.name}</p>
                      <p className="text-xs text-[#75786c]">{exp.location}</p>
                    </div>
                    <button className="ml-auto text-xs text-[#4f6231] font-medium hover:underline shrink-0">
                      팔로우
                    </button>
                  </div>
                ))}
              </div>
            </div>

            {/* Quote */}
            <div className="bg-[#4f6231] rounded-2xl p-6 text-white">
              <p className="font-[var(--font-display)] text-sm italic leading-relaxed">
                &ldquo;Weddings shine brightest when the soul outshines the decorations.&rdquo;
              </p>
              <p className="text-xs text-[#d3ebac] mt-3">— Wedge Editorial</p>
            </div>
          </div>
        </div>
      </div>

      <Footer />
    </div>
  );
}
