import { apiGet } from "./_api";
import { setupNavInHomeByLogin } from "./_login";
import { IPost } from "./_types";

setupNavInHomeByLogin();

async function fetchPosts() {
  const result = await apiGet<{ posts: IPost[] }>("posts/latest");
  if (result.success) {
    alert("Succcesfully retrieved posts");
    console.log({ posts: result.data.posts });
  }
}

document.addEventListener("DOMContentLoaded", fetchPosts, true);
