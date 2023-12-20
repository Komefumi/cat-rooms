import 'package:dbcrypt/dbcrypt.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:cat_rooms/error.dart';
import 'package:cat_rooms/src/generated/prisma/prisma_client.dart';

import './config.dart';

class Model {
  static final config = Config();
}

class Comment {
  Comment._create(
      {required this.id,
      required this.content,
      required this.postId,
      required this.userId,
      required this.username});
  final int id;
  String content;
  int postId;
  int userId;
  String username;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'postId': postId,
      'userId': userId,
      'username': username
    };
  }
}

class Post {
  Post.create(
      {required this.id,
      this.imageId,
      this.ext,
      required this.content,
      this.commentList = (const [])});
  final int id;
  String? imageId;
  String? ext;
  String content;
  List<Comment> commentList;

  static final config = Config();

  static Future<List<Comment>> getComments(
      {required Iterable<int> postIdList}) async {
    final commentListPrisma = await config.prisma.comment
        .findMany(where: CommentWhereInput(postId: IntFilter($in: postIdList)));
    Map<int, User?> idToUser = {};
    final failedLookup = <int>[];
    final commentList = <Comment>[];
    for (final item in commentListPrisma) {
      final userId = item.userId;
      if (failedLookup.contains(userId)) continue;
      final userPrisma = await config.prisma.user
          .findUnique(where: UserWhereUniqueInput(id: userId));
      if (userPrisma == null) {
        idToUser[userId] = null;
        failedLookup.add(userId);
        continue;
      } else {
        idToUser[userId] =
            User._create(id: userPrisma.id, username: userPrisma.username);
      }

      final comment = Comment._create(
          id: item.id,
          content: item.content,
          postId: item.postId,
          userId: item.userId,
          username: idToUser[userId]!.username);
      commentList.add(comment);
    }

    return commentList;
  }

  static Future<Post> fromId({required int postId}) async {
    final postPrisma = await config.prisma.post
        .findFirst(where: PostWhereInput(id: IntFilter(equals: postId)));
    if (postPrisma == null) {
      throw Exception('Post not found');
    }
    final commentList = await Post.getComments(postIdList: [postId]);

    return Post.create(
        id: postPrisma.id,
        content: postPrisma.content,
        imageId: postPrisma.imageId,
        ext: postPrisma.ext,
        commentList: commentList);
  }

  Future<Comment> addComment(
      {required String content,
      required int userId,
      required String username}) async {
    final commentPrisma = await config.prisma.comment.create(
        data: CommentCreateInput(
            content: content,
            post: PostCreateNestedOneWithoutCommentsInput(
                connect: PostWhereUniqueInput(id: id)),
            user: UserCreateNestedOneWithoutCommentsInput(
                connect: UserWhereUniqueInput(id: userId))));
    return Comment._create(
        id: commentPrisma.id,
        content: commentPrisma.content,
        postId: id,
        userId: userId,
        username: username);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'imageId': imageId,
      'ext': ext,
      'content': content,
      'commentList': commentList
    };
  }
}

class User {
  final int id;
  String username;
  // String passwordHash;

  static final config = Config();
  User._create({required this.id, required this.username});
  static Future<User> create(
      {required String username, required String password}) async {
    final bcrypt = DBCrypt();
    final passwordHash = bcrypt.hashpw(password, bcrypt.gensalt());
    try {
      final existingUser = await config.prisma.user.findFirst(
          where: UserWhereInput(username: StringFilter(equals: username)));
      if (existingUser != null) {
        throw UsernameInUseError(username);
      }
      final createdData = await config.prisma.user.create(
          data:
              UserCreateInput(username: username, passwordHash: passwordHash));
      final user =
          User._create(id: createdData.id, username: createdData.username);
      return user;
    } catch (error) {
      print(error);
      throw FailedToCreateUserError(error);
    }
  }

  static Future<String> loginAndGetToken(
      {required String username, required String candidatePassword}) async {
    try {
      final foundUser = await config.prisma.user.findFirst(
          where: UserWhereInput(username: StringFilter(equals: username)));

      if (foundUser == null) {
        throw UsernameNotFoundError(username);
      }
      final bcrypt = DBCrypt();
      final isMatch = bcrypt.checkpw(candidatePassword, foundUser.passwordHash);
      if (!isMatch) {
        throw IncorrectPasswordError();
      }
      final user = User._create(id: foundUser.id, username: foundUser.username);
      final jwt = JWT(user.toJson());
      final token = jwt.sign(SecretKey(config.env['JWT_SECRET']!));
      return token;
      // return User._create(foundUser.id, foundUser.username);
    } catch (error) {
      throw FailedToLoginUserError(error);
    }
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'username': username};
  }

  static Future<User> fromToken(String token) async {
    final decoded =
        JWT.tryVerify(token, SecretKey(config.env['JWT_SECRET'] as String));
    if (decoded == null) {
      // TODO: Dedicated Error
      throw Exception('Token validation failed');
    }
    final userId = decoded.payload['id'];
    final foundUser = await config.prisma.user
        .findUnique(where: UserWhereUniqueInput(id: userId));
    if (foundUser == null) {
      // TODO: Dedicated Error
      throw Exception('User not found');
    }
    return User._create(id: foundUser.id, username: foundUser.username);
  }

  static Future<User> fromId(int userId) async {
    final userFromPrisma = await config.prisma.user
        .findUnique(where: UserWhereUniqueInput(id: userId));
    if (userFromPrisma == null) {
      throw Exception('User not found');
    }
    return User._create(
        id: userFromPrisma.id, username: userFromPrisma.username);
  }

  Future<Post> addPost(
      {required String content, String? imageId, String? ext}) async {
    final postPrisma = await config.prisma.post.create(
        data: PostCreateInput(
            content: content,
            imageId: imageId,
            ext: ext,
            user: UserCreateNestedOneWithoutPostsInput(
                connect: UserWhereUniqueInput(id: id))));
    return Post.create(
        id: postPrisma.id,
        imageId: postPrisma.imageId,
        content: postPrisma.content);
  }

  Future<List<Post>> getPosts() async {
    final postListPrisma = await config.prisma.post
        .findMany(where: PostWhereInput(userId: IntFilter(equals: id)));
    final postIdList = postListPrisma.map((item) => item.id);
    final combinedCommentList = await Post.getComments(postIdList: postIdList);
    final postList = (postListPrisma.map((item) {
      final commentList = (combinedCommentList
              .where((commentItem) => commentItem.postId == item.id))
          .toList()
          .reversed
          .toList();
      return Post.create(
          id: item.id,
          imageId: item.imageId,
          ext: item.ext,
          content: item.content,
          commentList: commentList);
    })).toList().reversed.toList();
    return postList;
  }
}
