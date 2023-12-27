import { jwtDecode } from "jwt-decode";
import { loadLoginToken } from "./_storage";
import { apiConnect } from "./_api";
import { svg, attr, createImageSrc } from "./_data-and-utils";
import { IPost, IUserToken } from "./_types";
console.log({ jwtDecode });
const token = loadLoginToken();

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
const userIdFromDecode = (decodedData as IUserToken).id;

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
    attr.profilemode
  );
  console.log({ myProfileMode });
}

const modeChooserList = document.querySelectorAll(`[${attr.profilemode}]`);
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

function createCommentSectionForPost(item: IPost) {
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
  return commentSectionElement;
}

async function handlePostSubmit(e: SubmitEvent) {
  e.preventDefault();
  const formData = new FormData();
  const contentElement = document.getElementById(
    "post-creator-content"
  ) as HTMLTextAreaElement;
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
  const postElement = target.closest(`[${attr.postId}]`) as HTMLElement;
  const postId = postElement.getAttribute(attr.postId);
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
    // Post Control
    const postControlElement = document.createElement("div");
    postControlElement.className = "post-control";
    const editTriggerElement = document.createElement("button");
    editTriggerElement.className = "edit-button";
    editTriggerElement.innerHTML = svg.edit;
    postControlElement.append(editTriggerElement);

    editTriggerElement.addEventListener("click", function (evt) {
      // evt.preventDefault();
      console.log("edit triggered");
      const triggerElement = evt.target as HTMLButtonElement;
      const postElement = triggerElement.closest(
        `[${attr.postId}]`
      ) as HTMLElement;
      const savedState = document.createElement(
        "template"
      ) as HTMLTemplateElement;
      savedState.innerHTML = postElement.innerHTML;
      savedState.content.children[0];
      const getPostContent = () =>
        postElement.querySelector(".post-content") as HTMLDivElement;
      const getPostImage = () =>
        postElement.querySelector(".post-image") as HTMLImageElement;

      console.log(postElement);
      postElement.setAttribute(attr.editing, "true");
      const postId = postElement.getAttribute(attr.postId);
      // postElement.after();
      const controlSection = postElement.querySelector(".post-control");
      const fileUploadSection = document.createElement("section");
      fileUploadSection.className = "edit--image-section";
      const fileUploaderLabel = document.createElement("label");
      fileUploaderLabel.textContent =
        "Select Image to replace with (optional): ";
      const fileUploader = document.createElement("input");
      fileUploader.type = "file";
      fileUploader.accept = "image/*";
      fileUploadSection.append(fileUploaderLabel, fileUploader);
      controlSection.after(fileUploadSection);
      fileUploader.addEventListener("change", function (evt) {
        console.log("image change happened");
        const file = fileUploader.files[0];
        const fr = new FileReader();
        fr.readAsDataURL(file);
        fr.onload = function (e) {
          const postImage = getPostImage();
          postImage.src = this.result as string;
        };
        // postElement.querySelector('img').src =
      });

      const postContent = getPostContent();
      const postContentEditing = document.createElement("textarea");
      postContentEditing.textContent = postContent.innerHTML;
      postContentEditing.className = "edit--post-content";
      postContent.replaceWith(postContentEditing);
      const editSubmitSection = document.createElement("section");
      editSubmitSection.classList.add("edit--submit-section");
      const submitButton = document.createElement("button");
      submitButton.classList.add("submit-btn");
      const cancelButton = document.createElement("button");
      submitButton.classList.add("submit-btn");
      submitButton.innerText = "Submit";
      cancelButton.classList.add("cancel-btn");
      cancelButton.innerText = "Cancel";
      function resetPostElement() {
        postElement.innerHTML = savedState.innerHTML;
      }
      cancelButton.addEventListener("click", function (e) {
        e.preventDefault();
        resetPostElement();
        console.log("cancellation success!");
      });
      submitButton.addEventListener("click", async function (e) {
        e.preventDefault();
        const formData = new FormData();
        formData.append("content", postContentEditing.value);
        const image = fileUploader.files[0];
        if (image) {
          formData.append("image", fileUploader.files[0]);
        }
        const postId = postElement.getAttribute(attr.postId);
        try {
          const result = await apiConnect<{ updatedPost: IPost }>(
            `posts/${postId}`,
            [formData, token, "put"]
          );
          if (result.success) {
            const item = result.data.updatedPost;
            resetPostElement();
            const postContent = getPostContent();
            const postImage = getPostImage();
            postContent.innerText = item.content;
            if (item.imageId && item.ext) {
              postImage.src = createImageSrc(item);
            }

            const commentSection =
              postElement.querySelector(".comment-section");
            console.log({ commentSection });

            commentSection.replaceWith(createCommentSectionForPost(item));
            postElement.removeAttribute(attr.editing);
          }
        } catch (error) {
          console.error(error);
        }
      });
      editSubmitSection.append(cancelButton, submitButton);
      postContentEditing.after(editSubmitSection);
      const commentSection = postElement.querySelector(".comment-section");
      console.log({ commentSection });
    });

    const divContainerElement = document.createElement("div");
    divContainerElement.classList.add("post-item");
    divContainerElement.setAttribute("attr-postId", item.id + "");
    const imgElement = item.imageId ? document.createElement("img") : null;
    const divContentElement = document.createElement("div");
    divContentElement.className = "post-content";

    const commentSectionElement = createCommentSectionForPost(item);

    divContentElement.append(item.content || "");
    if (imgElement) {
      imgElement.className = "post-image";
      imgElement.src = createImageSrc(item);
      const summary = (item.content || "").slice(0, 20);
      imgElement.alt = summary.length <= 20 ? summary : summary + "...";
      divContainerElement.appendChild(imgElement);
    }

    divContainerElement.append(
      ...[
        postControlElement,
        imgElement,
        divContentElement,
        commentSectionElement,
      ].filter((item) => item)
    );

    postListActual.appendChild(divContainerElement);
  });
}

document.addEventListener("DOMContentLoaded", fetchPosts, true);
