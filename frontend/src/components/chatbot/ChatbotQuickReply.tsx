// src/components/chatbot/ChatbotQuickReply.tsx
import type { QuickReply } from "@/types/chatbot";

interface Props {
  quickReplies: QuickReply[];
  onSelect: (value: string) => void;
  disabled: boolean;
}

export function ChatbotQuickReply({ quickReplies, onSelect, disabled }: Props) {
  if (quickReplies.length === 0) return null;

  return (
    <div className="flex flex-wrap justify-end gap-2 px-4 pt-2 pb-6">
      {quickReplies.map((reply) => (
        <button
          key={reply.value}
          onClick={() => onSelect(reply.value)}
          disabled={disabled}
          className="px-3 py-1.5 rounded-full border border-[#4f6231] text-[#4f6231] text-sm hover:bg-[#4f6231] hover:text-white disabled:opacity-40 disabled:cursor-not-allowed transition-colors"
        >
          {reply.label}
        </button>
      ))}
    </div>
  );
}
