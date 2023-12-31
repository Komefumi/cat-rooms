import { jwtDecode } from "jwt-decode";
import { loadLoginToken } from "./_storage";
import {
  apiConnect,
  apiDelete,
  apiGet,
  createTokenAndJSONHeaders,
} from "./_api";
import {
  svg,
  attr,
  createImageSrc,
  cssClass,
  createStateReset,
  state,
  openModalFramework,
  createDefaultConfirmButtons,
} from "./_data-and-utils";
import { IComment, IPost, IUserToken } from "./_types";
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
}

const modeChooserList = document.querySelectorAll(`[${attr.profilemode}]`);
modeChooserList.forEach((item) => {
  item.addEventListener("click", setMyProfileMode, true);
});

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
  id,
  username,
  content,
}: {
  id: number;
  username: string;
  content: string;
}) {
  const commentElement = document.createElement("div");
  commentElement.className = "comment-item";
  commentElement.setAttribute(attr.commentId, id + "");
  const headElement = document.createElement("div");
  headElement.className = "head";
  const titleElement = document.createElement("h4");
  titleElement.classList.add("title");
  titleElement.innerText = username;
  const utilSection = document.createElement("section");
  utilSection.classList.add("util-section");
  const editButton = document.createElement("button");
  editButton.innerHTML = svg.edit;
  editButton.addEventListener("click", function (e) {
    e.preventDefault();
    console.log("edit button clicked");
    const existingContentArea = commentElement.querySelector(".content");
    console.log({ existingContentArea });
    const newContentArea = document.createElement("textarea");
    newContentArea.classList.add("edit-content");
    newContentArea.innerText = existingContentArea.innerHTML;
    existingContentArea.replaceWith(newContentArea);
    const editControlSection = document.createElement("section");
    editControlSection.classList.add("edit-control-section");

    const buttonList = createDefaultConfirmButtons({
      cancel: [
        "Cancel Edit",
        function () {
          editControlSection.replaceWith(utilSection);
          newContentArea.replaceWith(existingContentArea);
        },
      ],
      confirm: [
        "Confirm Edit",
        async function () {
          const commentId = commentElement.getAttribute(attr.commentId);
          const formData = new FormData();
          formData.append("content", newContentArea.value);
          const result = await apiConnect<{ updatedComment: IComment }>(
            `posts/comments/${commentId}`,
            [formData, token, "put"]
          );
          if (result.success) {
            const newContentNode =
              existingContentArea.cloneNode() as HTMLDivElement;
            newContentNode.innerText = result.data.updatedComment.content;
            newContentArea.replaceWith(newContentNode);
          }
        },
      ],
    });
    editControlSection.append(...buttonList);
    utilSection.replaceWith(editControlSection);
  });
  const deleteButton = document.createElement("button");
  deleteButton.innerHTML = svg.delete;
  deleteButton.addEventListener("click", function (e) {
    const openModalResult = openModalFramework(e);
    if (!openModalResult) {
      return;
    }
    const { closeModal, createAndOpenModal } = openModalResult;
    const commentId = commentElement.getAttribute(attr.commentId);
    const buttonList = createDefaultConfirmButtons({
      cancel: [
        "Cancel Deletion",
        function () {
          closeModal();
        },
      ],
      confirm: [
        "Confirm Deletion",
        async function () {
          const { success } = await apiConnect(`posts/comments/${commentId}`, {
            method: "delete",
            headers: createTokenAndJSONHeaders(),
          });
          if (success) {
            commentElement.remove();
            alert("Successfully deleted comment");
          } else {
            alert("Comment deletion failed");
          }
        },
        closeModal,
      ],
    });
    createAndOpenModal({
      title: "Are you sure you wish to delete comment?",
      bodyHTML: "This action cannot be reversed",
      footerButtonList: buttonList,
    });
  });
  utilSection.append(deleteButton, editButton);
  headElement.append(titleElement, utilSection);
  const commentContentElement = document.createElement("div");
  commentContentElement.className = "content";
  commentContentElement.replaceChildren(content);
  commentElement.append(headElement, commentContentElement);
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
  const toAppend = [commentFormElement, commentListElement].filter(
    (item) => !!item
  );

  commentSectionElement.append(...toAppend);
  return commentSectionElement;
}

function togglePostSubmitError() {
  const existingValidationError = document.querySelector(
    "#post-creator .validation-error"
  );
  state.validationTriggered.postNoContent = existingValidationError
    ? false
    : true;
  if (existingValidationError) {
    existingValidationError.remove();
  } else {
    const submitButton = document.querySelector(
      '#post-creator input[type="submit"]'
    );
    const validationError = document.createElement("span");
    validationError.classList.add("validation-error");
    validationError.innerText = "Post content cannot be empty";
    submitButton.before(validationError);
  }
}

const postCreatorTextarea = document.getElementById("post-creator-content");
postCreatorTextarea.addEventListener("input", function (e) {
  e.preventDefault();
  if ((e.target as HTMLTextAreaElement).value.length > 0) {
    if (state.validationTriggered.postNoContent) togglePostSubmitError();
  }
});

async function handlePostSubmit(e: SubmitEvent) {
  e.preventDefault();
  const formData = new FormData();
  const contentElement = document.getElementById(
    "post-creator-content"
  ) as HTMLTextAreaElement;
  const imageAttachElement = document.getElementById(
    "post-creator-image-attach"
  ) as HTMLInputElement;
  const content = contentElement.value;
  if (content.length === 0) {
    if (!state.validationTriggered.postNoContent) togglePostSubmitError();
    return;
  }
  formData.append("content", contentElement.value);
  const imageItem = (imageAttachElement.files as FileList)[0];
  if (imageItem) {
    formData.append("image", (imageAttachElement.files as FileList)[0]);
  }
  // formData.append("token", token as string);
  const result = await apiConnect("posts", [formData, token]);
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

  const formData = new FormData();
  formData.append("commentContent", commentContent);
  const { data, success } = await apiConnect<{
    comment: IComment;
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
  } = await apiGet<{ posts: IPost[] }>(`posts${userId ? `/${userId}` : ""}`);

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
    function eventListenerCommon(evt: Event) {
      evt.preventDefault();
      const triggerElement = evt.target as HTMLButtonElement;
      const postElement = triggerElement.closest(
        `[${attr.postId}]`
      ) as HTMLElement;
      const postId = postElement.getAttribute(attr.postId);
      return { postElement, postId };
    }
    postControlElement.append(
      ...["edit", "delete"].map((id, idx) => {
        const button = document.createElement("button");
        button.classList.add(`${id}-button`);
        button.innerHTML = idx === 0 ? svg.edit : svg.delete;

        button.addEventListener(
          "click",
          idx === 0
            ? function (evt) {
                const { postElement, postId } = eventListenerCommon(evt);
                const getPostContent = () =>
                  postElement.querySelector(".post-content") as HTMLDivElement;
                const getPostImage = () =>
                  postElement.querySelector(".post-image") as HTMLImageElement;

                postElement.setAttribute(attr.editing, "true");
                const controlSection =
                  postElement.querySelector(".post-control");
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
                  const file = fileUploader.files[0];
                  const fr = new FileReader();
                  fr.readAsDataURL(file);
                  fr.onload = function (e) {
                    const postImage = getPostImage();
                    postImage.src = this.result as string;
                  };
                });

                const postContent = getPostContent();
                const postContentEditing = document.createElement("textarea");
                postContentEditing.textContent = postContent.innerHTML;
                postContentEditing.className = "edit--post-content";
                postContent.replaceWith(postContentEditing);
                const editSubmitSection = document.createElement("section");
                editSubmitSection.classList.add("edit--submit-section");
                const resetPostElement = () => {
                  postElement.removeAttribute(attr.editing);
                  fileUploadSection.remove();
                  postContentEditing.replaceWith(postContent);
                  editSubmitSection.remove();
                };
                const editSubmitButtonList = createDefaultConfirmButtons({
                  cancel: [
                    "Cancel Post Edit",
                    function () {
                      resetPostElement();
                    },
                  ],
                  confirm: [
                    "Confirm Edit",
                    async function () {
                      const formData = new FormData();
                      formData.append("content", postContentEditing.value);
                      const image = fileUploader.files[0];
                      if (image) {
                        formData.append("image", fileUploader.files[0]);
                      }
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

                        commentSection.replaceWith(
                          createCommentSectionForPost(item)
                        );
                        postElement.removeAttribute(attr.editing);
                      }
                    },
                  ],
                });
                editSubmitSection.append(...editSubmitButtonList);
                postContentEditing.after(editSubmitSection);
              }
            : function (evt) {
                const { postId } = eventListenerCommon(evt);
                const openResult = openModalFramework(evt);
                if (!openResult) return;
                const { closeModal, createAndOpenModal } = openResult;
                const deletionButtonList = createDefaultConfirmButtons({
                  cancel: [
                    "Cancel Deletion",
                    function () {
                      closeModal();
                    },
                  ],
                  confirm: [
                    "Confirm Deletion",
                    async function () {
                      const { success } = await apiDelete<null>(
                        `posts/${postId}`
                      );
                      if (success) {
                        document
                          .querySelector(`[${attr.postId}="${postId}"]`)
                          ?.remove();
                        alert("Successfully deleted post");
                      } else {
                        alert("Failed to delete post");
                      }
                    },
                    closeModal,
                  ],
                });
                createAndOpenModal({
                  title: "Confirm Deletion",
                  bodyHTML:
                    "Your post will be deleted - this action cannot be reversed",
                  footerButtonList: deletionButtonList,
                });
              }
        );
        return button;
      })
    );

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
