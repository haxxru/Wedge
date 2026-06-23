import test from "node:test";
import assert from "node:assert/strict";

import { getJobTotalCount } from "./jobs-total-count.js";

test("getJobTotalCount prefers backend totalElements over current page length", () => {
  assert.equal(
    getJobTotalCount({
      totalElements: 11,
      pageContentCount: 6,
    }),
    11,
  );
});

test("getJobTotalCount falls back to merged count when totalElements is missing", () => {
  assert.equal(
    getJobTotalCount({
      totalElements: undefined,
      pageContentCount: 6,
      mergedCount: 17,
    }),
    17,
  );
});

test("getJobTotalCount falls back to current page length as a last resort", () => {
  assert.equal(
    getJobTotalCount({
      totalElements: undefined,
      pageContentCount: 4,
      mergedCount: undefined,
    }),
    4,
  );
});
