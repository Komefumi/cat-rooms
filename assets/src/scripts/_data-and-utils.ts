import { IPost, IState, NavigationInfo } from "./_types";
import editSVG from "../images/edit.svg";
import deleteSVG from "../images/delete.svg";

export const homepageNavItemMapping: {
  loggedIn: NavigationInfo[];
  loggedOut: NavigationInfo[];
} = {
  loggedIn: [["Profile", "/public/profile.html"]],
  loggedOut: [
    ["Register", "/public/register.html"],
    ["Login", "/public/login.html"],
  ],
};

export const svg = {
  edit: editSVG,
  delete: deleteSVG,
};

export const state: IState = {
  validationTriggered: {
    postNoContent: false,
  },
};

const attrKey = ["postId", "commentId", "profilemode", "editing"] as const;
type AttrKey = (typeof attrKey)[number];

export const attr = attrKey.reduce(
  (accum, currentKey) => {
    accum[currentKey] = `attr-${currentKey}`;
    return accum;
  },
  {} as Record<AttrKey, string>
);

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

interface CreateModalProps {
  title: string;
  bodyHTML: string;
  footerButtonList: HTMLElement[];
}

export const openModalFramework = (e: Event) => {
  if (!e.defaultPrevented) {
    e.preventDefault();
  }
  const existingOverlay = document.querySelector(".modal-overlay");
  if (existingOverlay) {
    alert("A modal instance is already open");
    return null;
  }
  const overlay = document.createElement("div");
  overlay.classList.add("modal-overlay");
  const closeModal = () => {
    document.body.classList.remove(cssClass.STOP_SCROLLING);
    document.body.removeChild(overlay);
  };
  const createAndOpenModal = ({
    title,
    bodyHTML,
    footerButtonList,
  }: CreateModalProps) => {
    const modal = document.createElement("div");
    overlay.classList.add("modal-overlay");
    modal.classList.add("modal");
    const areas = ["header", "body", "footer"].map((areaID, index) => {
      const element = document.createElement("section");
      element.classList.add(areaID);
      if (index === 0) {
        const titleElement = document.createElement("h4");
        titleElement.innerText = title;
        element.appendChild(titleElement);
      } else if (index === 1) {
        element.innerHTML = bodyHTML;
      } else {
        element.append(...footerButtonList);
      }
      return element;
    });
    modal.append(...areas);
    overlay.appendChild(modal);
    document.body.appendChild(overlay);
    document.body.classList.add(cssClass.STOP_SCROLLING);
  };
  return { closeModal, createAndOpenModal };
};

type ConfigModalButton = [
  text: string,
  runner: () => void,
  handleClose?: () => void,
];

interface createDefaultModalButtonsProps {
  cancel: ConfigModalButton;
  confirm: ConfigModalButton;
  reverseOrder?: boolean;
}

export function createDefaultConfirmButtons({
  cancel,
  confirm,
  reverseOrder,
}: createDefaultModalButtonsProps) {
  function handlerCommon(e: Event) {
    e.preventDefault();
  }
  const buttonList = [
    ["cancel", cancel[0]],
    ["confirm", confirm[0]],
  ].map(([buttonId, buttonText], buttonIndex) => {
    const button = document.createElement("button");
    button.classList.add(`${buttonId}-button`);
    button.innerText = buttonText;

    button.addEventListener(
      "click",
      buttonIndex === 0
        ? function (e) {
            handlerCommon(e);
            cancel[1]();
          }
        : function (e) {
            handlerCommon(e);
            try {
              confirm[1]();
            } catch (error) {
              console.log(error);
            } finally {
              confirm?.[2]();
            }
          }
    );
    return button;
  });
  if (reverseOrder) {
    buttonList.reverse();
  }
  return buttonList;
}
