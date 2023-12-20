const LOGIN_TOKEN_STORAGE_KEY = "LOGIN_TOKEN_STORAGE_KEY";

let token = null;

export const saveLoginToken = (tokenString) => {
  localStorage.setItem(LOGIN_TOKEN_STORAGE_KEY, tokenString);
};

export const loadLoginToken = () => {
  if (token == null) {
    token = localStorage.getItem(LOGIN_TOKEN_STORAGE_KEY);
  }
  return token;
};
