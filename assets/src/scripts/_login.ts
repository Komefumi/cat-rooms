import { saveLoginToken, loadLoginToken } from "./_storage";
import { apiConnect } from "./_api";
// mode = 'login' | 'register'
export function setupLogin(mode = "login") {
  const form = document.getElementById(`${mode}-form`);
  async function onSubmit(e: SubmitEvent) {
    e.preventDefault();
    const username = (document.getElementById("username") as HTMLInputElement)
      .value;
    const password = (document.getElementById("password") as HTMLInputElement)
      .value;
    const formData = new FormData();
    formData.append("username", username);
    formData.append("password", password);
    const result =
      mode === "login"
        ? await apiConnect<{ token: string }>(mode, {
            method: "post",
            body: formData,
          })
        : await apiConnect<{ id: string }>(mode, {
            method: "post",
            body: formData,
          });
    alert(
      mode === "login"
        ? "Successfully logged in"
        : `User created with id ${(result?.data as { id: string })?.id}`
    );
    console.log({ result });

    if (mode === "login") {
      saveLoginToken((result.data as { token: string }).token);
      window.location.assign("/public/index.html");
    }
  }
  form!.addEventListener("submit", onSubmit, true);
}

function toggleElement(id: string, enableAtLogin: boolean) {
  const element = document.getElementById(id);
  const token = loadLoginToken();
  const shouldShow = enableAtLogin ? !!token : !token;
  element!.style.display = shouldShow ? "block" : "none";
}

export function toggleInHomePageByLogin() {
  [
    ["logged-out-nav", false],
    ["logged-in-nav", true],
  ].forEach(([id, enableAtLogin]: [id: string, enableAtLogin: boolean]) => {
    toggleElement(id, enableAtLogin);
  });
}
