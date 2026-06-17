// src/components/chatbot/ChatbotToggleButton.tsx

interface Props {
  isOpen: boolean;
  onClick: () => void;
}

export function ChatbotToggleButton({ isOpen, onClick }: Props) {
  return (
    <button
      onClick={onClick}
      className="fixed bottom-6 right-6 z-50 flex items-center group"
    >
      {!isOpen && (
        <span className="bg-white text-[#45483d] text-sm font-medium pl-4 pr-16 py-2.5 rounded-full shadow-md border border-[#efeee7] group-hover:bg-[#f5f4ec] transition-colors">
          견적 문의하기
        </span>
      )}

      <div className="w-14 h-14 rounded-full bg-[#4f6231] group-hover:bg-[#677b47] text-white shadow-lg flex items-center justify-center transition-all text-xl shrink-0 -ml-12">
        {isOpen ? "✕" : "💍"}
      </div>
    </button>
  );
}
