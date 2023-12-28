export interface IComment {
  username: string;
  content: string;
}

export interface IPost {
  id: number;
  content: string;
  imageId: string;
  ext: string;
  commentList: IComment[];
}

export interface APIResponse<T> {
  message: string;
  data: null | T;
  success: boolean;
}

export interface IUserToken {
  id: string;
  username: string;
}