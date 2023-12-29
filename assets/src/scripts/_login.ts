import { saveLoginToken, loadLoginToken } from "./_storage";
import { apiConnect } from "./_api";
import { homepageNavItemMapping } from "./_data-and-utils";
// mode = 'login' | 'register'
export function setupLogin(mode = "login") {
  const form = document.getElementById(`${mode}-form`);
  const token = loadLoginToken();
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
        ? await apiConnect<{ token: string }>(mode, [formData, token])
        : await apiConnect<{ id: string }>(mode, [formData, token]);
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

export function setupNavInHomeByLogin() {
  const token = loadLoginToken();
  const nav = document.getElementById("homepage-nav");
  const listTypeToUse: keyof typeof homepageNavItemMapping = token
    ? "loggedIn"
    : "loggedOut";
  const listToUse = homepageNavItemMapping[listTypeToUse];
  nav.append(
    ...listToUse.map(([label, path]) => {
      const link = document.createElement("a");
      link.innerText = label;
      link.href = path;
      return link;
    })
  );
}
