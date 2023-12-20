import 'package:dbcrypt/dbcrypt.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:cat_rooms/error.dart';
import 'package:cat_rooms/src/generated/prisma/prisma_client.dart';

import './config.dart';

class Model {
  static final config = Config();
}

class Comment {
  Comment.create(
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
      {required this.id, this.imageId, this.ext, required this.content});
  final int id;
  String? imageId;
  String? ext;
  String content;

  static final config = Config();

  static Future<Post> fromId({required int postId}) async {
    final postPrisma = await config.prisma.post
        .findFirst(where: PostWhereInput(id: IntFilter(equals: postId)));
    if (postPrisma == null) {
      throw Exception('Post not found');
    }
    return Post.create(
        id: postPrisma.id,
        content: postPrisma.content,
        imageId: postPrisma.imageId,
        ext: postPrisma.ext);
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
    return Comment.create(
        id: commentPrisma.id,
        content: commentPrisma.content,
        postId: id,
        userId: userId,
        username: username);
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'imageId': imageId, 'ext': ext, 'content': content};
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
    final postList = postListPrisma.map((item) => Post.create(
        id: item.id,
        imageId: item.imageId,
        ext: item.ext,
        content: item.content));
    return postList.toList();
  }
}
