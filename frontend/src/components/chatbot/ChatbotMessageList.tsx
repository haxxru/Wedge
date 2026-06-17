"use client";

import type { ChatMessage } from "@/types/chatbot";

interface Props {
  messages: ChatMessage[];
  isLoading: boolean;
}

export function ChatbotMessageList({ messages, isLoading }: Props) {
  return (
    <div className="px-4 py-3 space-y-3">
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

      {isLoading && (
        <div className="flex justify-start">
          <div className="bg-gray-100 px-4 py-3 rounded-2xl rounded-tl-none flex items-center gap-1">
            <span
              className="w-1.5 h-1.5 rounded-full"
              style={{ animation: "bounceColor 1s ease-in-out infinite 0ms" }}
            />
            <span
              className="w-1.5 h-1.5 rounded-full"
              style={{ animation: "bounceColor 1s ease-in-out infinite 150ms" }}
            />
            <span
              className="w-1.5 h-1.5 rounded-full"
              style={{ animation: "bounceColor 1s ease-in-out infinite 300ms" }}
            />
          </div>
        </div>
      )}
    </div>
  );
}
