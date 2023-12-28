import { IPost } from "./_types";
import editSVG from "../images/edit.svg";
import deleteSVG from "../images/delete.svg";

export const svg = {
  edit: editSVG,
  delete: deleteSVG,
};

export const attr = {
  postId: "attr-postId",
  profilemode: "attr-myprofilemode",
  editing: "attr-editing",
};

export const cssClass = {
  STOP_SCROLLING: "stop-scrolling",
};

export const createImageSrc = (item: IPost) =>
  `/file-uploads/${item.imageId}.${item.ext}`;

export const createStateReset = (element: HTMLElement) => {
  const savedState = document.createElement("template") as HTMLTemplateElement;
  savedState.innerHTML = element.innerHTML;
  return () => {
    element.innerHTML = savedState.innerHTML;
  };
};
