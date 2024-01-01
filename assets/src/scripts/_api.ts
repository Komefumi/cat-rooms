import { APIResponse } from "./_types";
import { loadLoginToken } from "./_storage";

export const createTokenAndJSONHeaders = (): HeadersInit => {
  const token = loadLoginToken();
  return {
    "Content-Type": "application/json",
    Authorization: `token: ${token}`,
  };
};

export async function apiConnect<T>(
  path: string,
  options: RequestInit | [data: FormData, token: string, method?: string]
): Promise<APIResponse<T>> {
  return (
    await fetch(
      `${process.env.BACKEND_PATH}/${path}`,
      options instanceof Array
        ? {
            method: options[2] || "post",
            body: options[0],
            headers: {
              Authorization: `token: ${options[1]}`,
            },
          }
        : options
    )
  ).json() as Promise<APIResponse<T>>;
}

export async function apiGet<T>(path: string) {
  return apiConnect<T>(path, {
    method: "get",
    headers: createTokenAndJSONHeaders(),
  });
}

export async function apiDelete<T>(path: string) {
  return apiConnect<T>(path, {
    method: "delete",
    headers: createTokenAndJSONHeaders(),
  });
}
