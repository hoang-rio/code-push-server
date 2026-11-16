// Copyright (c) Microsoft Corporation.
// Licensed under the MIT License.

/**
 * JSON.parse that never throws: non-string input and malformed JSON both yield undefined.
 */
export function tryParseJSON<T = any>(value: unknown): T | undefined {
  if (typeof value !== "string") {
    return undefined;
  }

  try {
    return JSON.parse(value) as T;
  } catch {
    return undefined;
  }
}
