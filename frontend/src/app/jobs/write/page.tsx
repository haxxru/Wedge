"use client";

import { API_BASE_URL, createAuthHeaders } from "@/lib/auth";
import Link from "next/link";
import { useRouter } from "next/navigation";
import type { FormEvent } from "react";
import { useEffect, useState } from "react";
import { JobForm } from "../_components/JobForm";
import {
  getJobWeddingDateValidationMessage,
  getTodayDateString,
} from "../job-date-utils.js";
import type { Category, JobFormValues } from "../job-form-options";
import { resolveJobRegionValue } from "../job-region-utils.js";

const INITIAL_VALUES: JobFormValues = {
  title: "",
  content: "",
  categoryId: "",
  budget: "",
  weddingDate: "",
  selectedRegion: "",
  customRegion: "",
};

export default function JobsWritePage() {
  const router = useRouter();
  const [categories, setCategories] = useState<Category[]>([]);
  const [values, setValues] = useState<JobFormValues>(INITIAL_VALUES);
  const [imageFile, setImageFile] = useState<File | null>(null);
  const [imagePreview, setImagePreview] = useState<string | null>(null);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [error, setError] = useState("");
  const minWeddingDate = getTodayDateString();

  useEffect(() => {
    fetch(`${API_BASE_URL}/api/categories`)
      .then((response) => response.json())
      .then(setCategories)
      .catch(() => {});
  }, []);

  const updateValue = <K extends keyof JobFormValues>(
    key: K,
    value: JobFormValues[K],
  ) => {
    setValues((previousValues) => ({
      ...previousValues,
      [key]: value,
    }));
  };

  const handleSubmit = async (event: FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    setError("");

    const validationMessage = getJobWeddingDateValidationMessage(
      values.weddingDate,
    );
    if (validationMessage !== null) {
      setError(validationMessage);
      return;
    }

    setIsSubmitting(true);

    try {
      const response = await fetch(`${API_BASE_URL}/api/v1/jobs`, {
        method: "POST",
        headers: { "Content-Type": "application/json", ...createAuthHeaders() },
        body: JSON.stringify({
          title: values.title,
          content: values.content,
          categoryId: Number(values.categoryId),
          budget: values.budget ? Number(values.budget) : null,
          weddingDate: values.weddingDate,
          region:
            resolveJobRegionValue(values.selectedRegion, values.customRegion) ||
            null,
        }),
      });

      if (!response.ok) {
        const data = await response.json().catch(() => null);
        throw new Error(data?.message ?? "구인글 등록에 실패했습니다.");
      }

      const { postId } = await response.json();

      if (imageFile && postId) {
        const formData = new FormData();
        formData.append("image", imageFile);
        await fetch(`${API_BASE_URL}/api/v1/jobs/${postId}/image`, {
          method: "PATCH",
          headers: createAuthHeaders(),
          body: formData,
        });
      }

      router.push("/mypage/posts");
    } catch (caughtError) {
      setError(
        caughtError instanceof Error
          ? caughtError.message
          : "구인글 등록에 실패했습니다.",
      );
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <div className="flex min-h-full flex-col bg-[#fbf9f2]">
      <div className="mx-auto w-full max-w-2xl px-4 py-12 sm:px-6 lg:px-8">
        <Link
          href="/mypage/posts"
          className="mb-8 flex items-center gap-1 text-sm text-[#75786c] hover:text-[#45483d]"
        >
          <svg className="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" />
          </svg>
          구인글 목록으로
        </Link>

        <div className="rounded-2xl border border-[#efeee7] bg-white p-6 sm:p-8">
          <h1 className="mb-2 font-[var(--font-display)] text-2xl font-semibold text-[#1b1c18]">
            구인글 작성
          </h1>
          <p className="mb-8 text-sm text-[#75786c]">
            원하는 조건을 등록하면 프리랜서가 직접 제안서를 보내드려요.
          </p>

          {/* 이미지 업로드 */}
          <div className="space-y-1.5 mb-6">
            <label className="text-sm font-medium text-[#45483d]">
              이미지 <span className="text-xs text-[#75786c] font-normal">(선택)</span>
            </label>
            {imagePreview ? (
              <div className="relative w-full h-48 rounded-xl overflow-hidden border border-[#efeee7]">
                <img src={imagePreview} alt="미리보기" className="w-full h-full object-cover" />
                <button
                  type="button"
                  onClick={() => { setImageFile(null); setImagePreview(null); }}
                  className="absolute top-2 right-2 w-7 h-7 bg-white/90 rounded-full flex items-center justify-center hover:bg-white"
                >
                  <svg className="w-4 h-4 text-[#75786c]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
                  </svg>
                </button>
              </div>
            ) : (
              <label className="flex flex-col items-center justify-center h-32 rounded-xl border-2 border-dashed border-[#c5c8ba] bg-[#f5f4ec] cursor-pointer hover:border-[#4f6231] transition-colors">
                <svg className="w-8 h-8 text-[#75786c] mb-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                  <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={1.5} d="M12 4v16m8-8H4" />
                </svg>
                <span className="text-sm text-[#75786c]">이미지 추가</span>
                <input
                  type="file"
                  accept="image/*"
                  className="hidden"
                  onChange={(e) => {
                    const file = e.target.files?.[0];
                    if (file) {
                      setImageFile(file);
                      setImagePreview(URL.createObjectURL(file));
                    }
                  }}
                />
              </label>
            )}
          </div>

          <JobForm
            values={values}
            categories={categories}
            error={error}
            isSubmitting={isSubmitting}
            submitLabel="등록하기"
            submittingLabel="등록 중..."
            minWeddingDate={minWeddingDate}
            onChange={updateValue}
            onCancel={() => router.back()}
            onSubmit={handleSubmit}
          />
        </div>
      </div>
    </div>
  );
}
