interface Props {
  onClose: () => void;
}

export function ChatbotHeader({ onClose }: Props) {
  return (
    <div className="flex items-center justify-between px-4 py-3 border-b border-gray-100">
      <div className="flex items-center gap-2">
        <span className="text-lg">💍</span>
        <div>
          <p className="text-sm font-semibold text-gray-800">웨리</p>
          <p className="text-xs text-gray-400">
            3가지 질문으로 웨딩 견적을 뽑아드려요
          </p>
        </div>
      </div>
      <button
        onClick={onClose}
        className="text-gray-400 hover:text-gray-600 transition-colors text-lg"
      >
        ✕
      </button>
    </div>
  );
}
