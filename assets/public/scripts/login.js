// mode = 'login' | 'register'
function setupLogin(mode = "login") {
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
        : `User created with id ${data?.id}`
    );
    console.log({ data });
  }
  form.addEventListener("submit", onSubmit, true);
}
