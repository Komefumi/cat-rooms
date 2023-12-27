import { APIResponse } from "./_types";

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
