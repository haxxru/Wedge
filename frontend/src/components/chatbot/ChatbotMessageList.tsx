import type { ChatMessage } from "@/types/chatbot";
import { useEffect, useRef } from "react";

interface Props {
  messages: ChatMessage[];
  isLoading: boolean;
}

export function ChatbotMessageList({ messages, isLoading }: Props) {
  const bottomRef = useRef<HTMLDivElement>(null);

  // 메시지 추가될 때마다 자동 스크롤
  useEffect(() => {
    bottomRef.current?.scrollIntoView({ behavior: "smooth" });
  }, [messages]);

  return (
    <div className="flex-1 overflow-y-auto px-4 py-3 space-y-3">
      {messages.map((msg, idx) => (
        <div
          key={idx}
          className={`flex ${msg.role === "bot" ? "justify-start" : "justify-end"}`}
        >
          <div
            className={`max-w-[75%] px-4 py-2.5 rounded-2xl text-sm leading-relaxed whitespace-pre-line
              ${
                msg.role === "bot"
                  ? "bg-gray-100 text-gray-800 rounded-tl-none"
                  : "bg-[#4f6231] text-white rounded-tr-none"
              }`}
          >
            {msg.content}
          </div>
        </div>
      ))}

      {/* 로딩 중 */}
      {isLoading && (
        <div className="flex justify-start">
          <div className="bg-gray-100 px-4 py-3 rounded-2xl rounded-tl-none flex items-center gap-1">
            <span
              className="w-1.5 h-1.5 rounded-full animate-bounce [animation-delay:0ms] bg-gray-300 [animation-name:bounce-color]"
              style={{ animation: "bounceColor 1s ease-in-out infinite 0ms" }}
            />
            <span
              className="w-1.5 h-1.5 rounded-full animate-bounce [animation-delay:150ms]"
              style={{ animation: "bounceColor 1s ease-in-out infinite 150ms" }}
            />
            <span
              className="w-1.5 h-1.5 rounded-full animate-bounce [animation-delay:300ms]"
              style={{ animation: "bounceColor 1s ease-in-out infinite 300ms" }}
            />
          </div>
        </div>
      )}

      <div ref={bottomRef} />
    </div>
  );
}
