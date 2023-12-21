interface APIResponse<T> {
  message: string;
  data: null | T;
  success: boolean;
}

export async function apiConnect<T>(
  path: string,
  options: RequestInit | [FormData, string]
): Promise<APIResponse<T>> {
  return (
    await fetch(
      `${process.env.BACKEND_PATH}/${path}`,
      options instanceof Array
        ? {
            method: "post",
            body: options[0],
            headers: {
              Authorization: `token: ${options[1]}`,
            },
          }
        : options
    )
  ).json() as Promise<APIResponse<T>>;
}
