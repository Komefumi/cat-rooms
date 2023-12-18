const LOGIN_TOKEN_STORAGE_KEY = "LOGIN_TOKEN_STORAGE_KEY";

export const saveLoginToken = (tokenString) => {
  localStorage.setItem(LOGIN_TOKEN_STORAGE_KEY, tokenString);
};

export const loadLoginToken = () => {
  localStorage.getItem(LOGIN_TOKEN_STORAGE_KEY);
};
