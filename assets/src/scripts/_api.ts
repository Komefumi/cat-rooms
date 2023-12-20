interface APIResponse {
  message: string;
  data: null | Record<string, unknown>;
  success: boolean;
}

export async function APIFetch(
  path: string,
  options: RequestInit
): Promise<APIResponse> {
  return (
    await fetch(`http://localhost:3000/${path}`, options)
  ).json() as Promise<APIResponse>;
}
