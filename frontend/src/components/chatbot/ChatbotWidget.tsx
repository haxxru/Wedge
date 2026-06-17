"use client";

import { Card } from "@/components/ui/card";
import { useChatbot } from "@/hooks/useChatbot";
import { useState } from "react";
import { ChatbotHeader } from "./ChatbotHeader";
import { ChatbotMessageList } from "./ChatbotMessageList";
import { ChatbotQuickReply } from "./ChatbotQuickReply";
import { ChatbotToggleButton } from "./ChatbotToggleButton";
import { EstimateResultCard } from "./EstimateResultCard";

export function ChatbotWidget() {
  const [isOpen, setIsOpen] = useState(false);
  const {
    messages,
    currentQuickReplies,
    isCompleted,
    estimate,
    isLoading,
    sendMessage,
  } = useChatbot();

  return (
    <>
      {isOpen && (
        <Card className="fixed bottom-24 right-6 z-40 w-[380px] bg-white border border-[#efeee7] shadow-xl flex flex-col max-h-[calc(100vh-176px)] max-sm:w-full max-sm:right-0 max-sm:bottom-0 max-sm:rounded-b-none max-sm:max-h-[85vh] p-0 gap-0">
          <ChatbotHeader onClose={() => setIsOpen(false)} />
          <ChatbotMessageList messages={messages} isLoading={isLoading} />
          {isCompleted && estimate && (
            <EstimateResultCard estimate={estimate} />
          )}
          <ChatbotQuickReply
            quickReplies={currentQuickReplies}
            onSelect={sendMessage}
            disabled={isLoading}
          />
        </Card>
      )}

      <ChatbotToggleButton
        isOpen={isOpen}
        onClick={() => setIsOpen((prev) => !prev)}
      />
    </>
  );
}
