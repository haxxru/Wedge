/**
 * @param {Date} [now]
 * @returns {string}
 */
export function getTodayDateString(now = new Date()) {
  const year = now.getFullYear();
  const month = String(now.getMonth() + 1).padStart(2, "0");
  const day = String(now.getDate()).padStart(2, "0");

  return `${year}-${month}-${day}`;
}

/**
 * @param {string} selectedDate
 * @param {Date} [now]
 * @returns {boolean}
 */
export function isPastJobWeddingDate(selectedDate, now = new Date()) {
  if (!selectedDate) {
    return false;
  }

  const selectedDateTime = new Date(`${selectedDate}T00:00:00`);
  const todayDateTime = new Date(`${getTodayDateString(now)}T00:00:00`);

  return Number.isFinite(selectedDateTime.getTime())
    && selectedDateTime.getTime() < todayDateTime.getTime();
}

/**
 * @param {string} selectedDate
 * @param {Date} [now]
 * @returns {string | null}
 */
export function getJobWeddingDateValidationMessage(
  selectedDate,
  now = new Date(),
) {
  if (!selectedDate) {
    return "웨딩 예정일을 선택해주세요.";
  }

  if (isPastJobWeddingDate(selectedDate, now)) {
    return "지난 날짜는 선택할 수 없습니다.";
  }

  return null;
}
