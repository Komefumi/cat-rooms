import { jwtDecode } from "jwt-decode";
import { loadLoginToken } from "./_storage";
import { apiConnect } from "./_api";
console.log({ jwtDecode });
const token = loadLoginToken();
const ATTR_postId = "attr-postId";

const postCreatorForm = document.getElementById(
  "post-creator"
) as HTMLFormElement;
const postListingTitle = document.getElementById(
  "post-listing-title"
) as HTMLTitleElement;
const navMenu = document.getElementById("nav-menu") as HTMLElement;

const urlParams = new URLSearchParams(window.location.search);
const userId = urlParams.get("userId");

const decodedData = jwtDecode(token);
const userIdFromDecode = (decodedData as any).id;

const isLoggedInUser = userIdFromDecode === userId || !userId;

if (!isLoggedInUser) {
  postCreatorForm.style.display = "none";
  navMenu.style.display = "none";
  postListingTitle.replaceChildren("Posts");
  // Then get another profile
} else {
  postCreatorForm.style.display = "block";
  postListingTitle.replaceChildren("Your Posts");
  // Just get my profile
}

function createCommentElement({
  username,
  content,
}: {
  username: string;
  content: string;
}) {
  const commentElement = document.createElement("div");
  const usernameElement = document.createElement("h4");
  usernameElement.replaceChildren(username);
  const commentContentElement = document.createElement("div");
  commentContentElement.replaceChildren(content);
  commentElement.append(usernameElement, commentContentElement);
  return commentElement;
}

async function handlePostSubmit(e: SubmitEvent) {
  e.preventDefault();
  const formData = new FormData();
  const contentElement = document.getElementById(
    "post-creator-content"
  ) as HTMLInputElement;
  const imageAttachElement = document.getElementById(
    "post-creator-image-attach"
  ) as HTMLInputElement;
  formData.append("content", contentElement.value);
  formData.append("image", (imageAttachElement.files as FileList)[0]);
  formData.append("token", token as string);
  const result = await apiConnect("post", { body: formData });
  console.log({ result });
  if (result.success) {
    alert(result.message);
    fetchPosts();
    contentElement.value = "";
    imageAttachElement.value = "";
  }
}
postCreatorForm.addEventListener("submit", handlePostSubmit, true);

async function handleCommentSubmit(e: SubmitEvent) {
  e.preventDefault();
  const target = e.target as HTMLElement;
  const commentTextarea = target.querySelector(
    "textarea"
  ) as HTMLTextAreaElement;
  const postElement = target.closest(`[${ATTR_postId}]`) as HTMLElement;
  const postId = postElement.getAttribute(ATTR_postId);
  const commentContent = commentTextarea.value;
  console.log({ commentContent, postId });

  const formData = new FormData();
  formData.append("commentContent", commentContent);
  formData.append("postId", postId as string);
  const { data, success } = await apiConnect<{
    comment: { id: string; username: string; content: string };
  }>("post/comment", [formData, token]);
  if (success) {
    alert("Successfully posted comment");
    const commentElement = createCommentElement({ ...data.comment });
    const postCommentSection = target.closest(
      ".comment-section"
    ) as HTMLSelectElement;
    const commentList = postCommentSection.querySelector(
      ":scope .post-comment-list"
    ) as HTMLElement;
    commentList.prepend(commentElement);
  }
}

async function fetchPosts() {
  const {
    data: { posts },
  } = await apiConnect<{
    posts: {
      id: number;
      content: string;
      imageId: string;
      ext: string;
      commentList: { username: string; content: string }[];
    }[];
  }>(`posts${userId ? `/${userId}` : ""}`, {
    method: "get",
    headers: {
      "Content-Type": "application/json",
      Authorization: `token: ${token}`,
    },
  });
  // const {
  //   data: { posts },
  // } = await (
  //   await fetch(`http://localhost:3000/posts${userId ? `/${userId}` : ""}`, {
  //     method: "get",
  //     headers: {
  //       "Content-Type": "application/json",
  //       Authorization: `token: ${token}`,
  //     },
  //   })
  // ).json();

  const postListActual = document.getElementById(
    "post-list-actual"
  ) as HTMLElement;
  postListActual.replaceChildren("");
  posts.forEach((item) => {
    const divContainerElement = document.createElement("div");
    divContainerElement.setAttribute("attr-postId", item.id + "");
    const imgElement = document.createElement("img");
    const divContentElement = document.createElement("div");

    // Comments
    const commentSectionElement = document.createElement("section");
    commentSectionElement.className = "comment-section";

    const commentFormElement = document.createElement("form");
    commentFormElement.className = "post-comment-form";
    commentFormElement.action = "/post/comment";
    commentFormElement.method = "post";

    const commentTextarea = document.createElement("textarea");
    commentTextarea.name = "commentText";
    commentTextarea.placeholder = "New comment...";
    commentFormElement.appendChild(commentTextarea);
    const commentSubmitBtn = document.createElement("button");
    commentSubmitBtn.type = "submit";
    commentSubmitBtn.replaceChildren("Submit");
    commentFormElement.appendChild(commentSubmitBtn);
    commentFormElement.addEventListener("submit", handleCommentSubmit, true);

    const commentListElement = document.createElement("div");
    commentListElement.className = "post-comment-list";

    item.commentList.forEach((commentItem) => {
      const commentElement = createCommentElement({ ...commentItem });
      commentListElement.append(commentElement);
    });

    commentSectionElement.append(commentFormElement, commentListElement);

    imgElement.src = `/file-uploads/${item.imageId}.${item.ext}`;
    const summary = (item.content || "").slice(0, 20);
    imgElement.alt = summary.length <= 20 ? summary : summary + "...";
    // divContentElement.value = item.content || "";
    divContentElement.append(item.content || "");
    divContainerElement.appendChild(imgElement);
    divContainerElement.appendChild(divContentElement);
    divContainerElement.appendChild(commentSectionElement);
    postListActual.appendChild(divContainerElement);
  });
}
document.addEventListener("DOMContentLoaded", fetchPosts, true);
