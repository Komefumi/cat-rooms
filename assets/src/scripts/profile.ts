import { jwtDecode } from "jwt-decode";
import { loadLoginToken } from "./_storage";
import { apiConnect } from "./_api";
console.log({ jwtDecode });
const token = loadLoginToken();
const ATTR_postId = "attr-postId";
const ATTR_myprofilemode = "attr-myprofilemode";

const postCreatorSection = document.getElementById(
  "post-creator-section"
) as HTMLElement;
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

enum MyProfileModeEnum {
  POSTS = "posts",
  SETTINGS = "settings",
}

const MyProfileModeOrderedList = [
  MyProfileModeEnum.POSTS,
  MyProfileModeEnum.SETTINGS,
];

function setMyProfileMode(e: MouseEvent) {
  e.preventDefault();
  const myProfileMode = (e.target as HTMLLIElement).getAttribute(
    ATTR_myprofilemode
  );
  console.log({ myProfileMode });
}

const modeChooserList = document.querySelectorAll(`[${ATTR_myprofilemode}]`);
modeChooserList.forEach((item) => {
  item.addEventListener("click", setMyProfileMode, true);
});
console.log({ modeChooserList });

if (!isLoggedInUser) {
  postCreatorSection.style.display = "none";
  navMenu.style.display = "none";
  postListingTitle.replaceChildren("Posts");
  // Then get another profile
} else {
  postCreatorSection.style.visibility = "";
  postCreatorSection.style.position = "";
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
  commentElement.className = "comment-item";
  const usernameElement = document.createElement("h4");
  usernameElement.className = "title";
  usernameElement.replaceChildren(username);
  const commentContentElement = document.createElement("div");
  commentContentElement.className = "content";
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
  const imageItem = (imageAttachElement.files as FileList)[0];
  if (imageItem) {
    formData.append("image", (imageAttachElement.files as FileList)[0]);
  }
  // formData.append("token", token as string);
  const result = await apiConnect("posts", [formData, token]);
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
  const { data, success } = await apiConnect<{
    comment: { id: string; username: string; content: string };
  }>(`posts/${postId}/comments`, [formData, token]);
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

    const toAppend = [
      commentFormElement,
      item.commentList.length ? commentListElement : null,
    ].filter((item) => !!item);

    commentSectionElement.append(...toAppend);

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
