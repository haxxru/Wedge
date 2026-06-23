"use client";

import { API_BASE_URL, createAuthHeaders } from "@/lib/auth";
import Link from "next/link";
import { useParams, useRouter } from "next/navigation";
import type { FormEvent } from "react";
import { useEffect, useState } from "react";
import { JobForm } from "../../_components/JobForm";
import type { Category, JobFormValues } from "../../job-form-options";
import {
  createInitialRegionSelection,
  resolveJobRegionValue,
} from "../../job-region-utils.js";

const INITIAL_VALUES: JobFormValues = {
  title: "",
  content: "",
  categoryId: "",
  budget: "",
  weddingDate: "",
  selectedRegion: "",
  customRegion: "",
};

export default function JobEditPage() {
  const { id } = useParams<{ id: string }>();
  const router = useRouter();
  const [categories, setCategories] = useState<Category[]>([]);
  const [values, setValues] = useState<JobFormValues>(INITIAL_VALUES);
  const [imageFile, setImageFile] = useState<File | null>(null);
  const [imagePreview, setImagePreview] = useState<string | null>(null);
  const [isSubmitting, setIsSubmitting] = useState(false);
  const [error, setError] = useState("");

  useEffect(() => {
    fetch(`${API_BASE_URL}/api/categories`)
      .then((response) => response.json())
      .then(setCategories)
      .catch(() => {});

    fetch(`${API_BASE_URL}/api/v1/jobs/${id}`)
      .then((response) => response.json())
      .then((data) => {
        if (data.status === "CLOSED") {
          alert("마감된 구인글은 수정할 수 없습니다.");
          router.push(`/jobs/${id}`);
          return;
        }

        const regionSelection = createInitialRegionSelection(data.region ?? "");
        setValues({
          title: data.title ?? "",
          content: data.content ?? "",
          categoryId: data.categoryId ?? "",
          budget: data.budget != null ? String(data.budget) : "",
          weddingDate: data.weddingDate ?? "",
          selectedRegion: regionSelection.selectedRegion,
          customRegion: regionSelection.customRegion,
        });
        setImagePreview(data.imageUrl ?? null);
      })
      .catch(() => router.push("/jobs"));
  }, [id, router]);

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
    setIsSubmitting(true);

    try {
      const response = await fetch(`${API_BASE_URL}/api/v1/jobs/${id}`, {
        method: "PATCH",
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
        throw new Error(data?.message ?? "수정에 실패했습니다.");
      }

      if (imageFile) {
        const formData = new FormData();
        formData.append("image", imageFile);
        await fetch(`${API_BASE_URL}/api/v1/jobs/${id}/image`, {
          method: "PATCH",
          headers: createAuthHeaders(),
          body: formData,
        });
      }

      router.push(`/jobs/${id}`);
    } catch (caughtError) {
      setError(
        caughtError instanceof Error ? caughtError.message : "수정에 실패했습니다.",
      );
    } finally {
      setIsSubmitting(false);
    }
  };

  return (
    <div className="flex min-h-full flex-col bg-[#fbf9f2]">
      <div className="mx-auto w-full max-w-2xl px-4 py-12 sm:px-6 lg:px-8">
        <Link
          href={`/jobs/${id}`}
          className="mb-8 flex items-center gap-1 text-sm text-[#75786c] hover:text-[#45483d]"
        >
          <svg className="h-4 w-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
            <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" />
          </svg>
          구인글로 돌아가기
        </Link>

        <div className="rounded-2xl border border-[#efeee7] bg-white p-6 sm:p-8">
          <h1 className="mb-2 font-[var(--font-display)] text-2xl font-semibold text-[#1b1c18]">
            구인글 수정
          </h1>
          <p className="mb-8 text-sm text-[#75786c]">
            내용을 수정하고 저장해주세요.
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
            submitLabel="수정하기"
            submittingLabel="수정 중..."
            onChange={updateValue}
            onCancel={() => router.back()}
            onSubmit={handleSubmit}
          />
        </div>
      </div>
    </div>
  );
}
