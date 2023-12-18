import { saveLoginToken, loadLoginToken } from "./storage.js";
// mode = 'login' | 'register'
export function setupLogin(mode = "login") {
  const form = document.getElementById(`${mode}-form`);
  async function onSubmit(e) {
    e.preventDefault();
    const username = document.getElementById("username").value;
    const password = document.getElementById("password").value;
    const data = await (
      await fetch(`http://localhost:3000/${mode}`, {
        method: "post",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({ username, password }),
      })
    ).json();
    alert(
      mode === "login"
        ? "Successfully logged in"
        : `User created with id ${data?.data?.id}`
    );
    console.log({ data });

    if (mode === "login") {
      saveLoginToken(data.data.token);
      window.location.assign("/public/index.html");
    }
  }
  form.addEventListener("submit", onSubmit, true);
}

function toggleElement(id, enableAtLogin) {
  const element = document.getElementById(id);
  const token = loadLoginToken();
  const shouldShow = enableAtLogin ? !!token : !token;
  element.style.display = shouldShow ? "block" : "none";
}

export function toggleInHomePageByLogin() {
  [
    ["logged-out-nav", false],
    ["logged-in-nav", true],
  ].forEach(([id, enableAtLogin]) => {
    toggleElement(id, enableAtLogin);
  });
}
