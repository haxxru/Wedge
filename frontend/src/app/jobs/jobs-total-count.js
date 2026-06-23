export function getJobTotalCount({
  totalElements,
  pageContentCount,
  mergedCount,
}) {
  if (typeof totalElements === "number" && Number.isFinite(totalElements)) {
    return totalElements;
  }

  if (typeof mergedCount === "number" && Number.isFinite(mergedCount)) {
    return mergedCount;
  }

  if (typeof pageContentCount === "number" && Number.isFinite(pageContentCount)) {
    return pageContentCount;
  }

  return 0;
}
