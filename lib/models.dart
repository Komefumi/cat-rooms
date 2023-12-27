import 'dart:io';

import 'package:alfred/alfred.dart';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:cat_rooms/error.dart';
import 'package:cat_rooms/utils.dart';
import 'package:cat_rooms/src/generated/prisma/prisma_client.dart' as priz;

import './config.dart';

class _Helper {
  static final config = Config();

  static List<Post> mixPostListAndCombinedCommentList(
      {required Iterable<priz.Post> postListPrisma,
      required Iterable<Comment> combinedCommentList}) {
    final postList = (postListPrisma.map((item) {
      final commentList = (combinedCommentList
              .where((commentItem) => commentItem.postId == item.id))
          .toList()
          .reversed
          .toList();
      return Post.fromPrismaData(postPrisma: item, commentList: commentList);
    })).toList().reversed.toList();
    return postList;
  }

  static Object? makeCreateOrUpdateStringValue(
      {String? value, required bool required, int? documentId}) {
    return documentId == null
        ? value
        : (required
            ? priz.StringFieldUpdateOperationsInput(set: value)
            : priz.NullableStringFieldUpdateOperationsInput(set: value));
  }

  static Future<void> deleteImageFileForEachPost(
      {required Iterable<int> postIdList}) async {
    final postList = await config.prisma.post.findMany(
        where: priz.PostWhereInput(id: priz.IntFilter($in: postIdList)));
    for (final item in postList) {
      if (item.imageId == null || item.ext == null) continue;

      final imagePath =
          '${config.fileUploadDir.absolute}/${item.imageId}.${item.ext}';
      final file = File(imagePath);
      final exists = await file.exists();
      if (exists) {
        await file.delete();
      }
    }
  }
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

  static final config = Config();

  static Future<void> deleteByIdIfAuthor(
      {required int commentId, required int candidateUserId}) async {
    final commentPrisma = await config.prisma.comment
        .findUnique(where: priz.CommentWhereUniqueInput(id: commentId));
    if (commentPrisma == null) {
      throw Exception('Comment not found');
    }
    if (commentPrisma.userId != candidateUserId) {
      throw Exception('Requesting user is not the author');
    }
    final result = await config.prisma.comment
        .delete(where: priz.CommentWhereUniqueInput(id: commentId));

    if (result == null) {
      throw Exception('Failed to delete Comment');
    }
  }

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

  factory Post.fromPrismaData(
      {required priz.Post postPrisma, commentList = const <Comment>[]}) {
    return Post.create(
        id: postPrisma.id,
        content: postPrisma.content,
        imageId: postPrisma.imageId,
        ext: postPrisma.ext,
        commentList: commentList);
  }

  static Future<void> deleteByIdIfAuthor(
      {required int postId, required int candidateUserId}) async {
    await _Helper.deleteImageFileForEachPost(postIdList: [postId]);
    final deleted = await config.prisma.post
        .delete(where: priz.PostWhereUniqueInput(id: postId));
    if (deleted == null) {
      throw Exception('Failed to delete user');
    }
  }

  static Future<List<Comment>> getComments(
      {required Iterable<int> postIdList}) async {
    final commentListPrisma = await config.prisma.comment.findMany(
        where: priz.CommentWhereInput(postId: priz.IntFilter($in: postIdList)));
    Map<int, User?> idToUser = {};
    final failedLookup = <int>[];
    final commentList = <Comment>[];
    for (final item in commentListPrisma) {
      final userId = item.userId;
      if (failedLookup.contains(userId)) continue;
      final userPrisma = await config.prisma.user
          .findUnique(where: priz.UserWhereUniqueInput(id: userId));
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

  static Future<List<Post>> getLatestPosts() async {
    final postListPrisma = await config.prisma.post.findMany(take: 100);
    final postIdList = postListPrisma.map((item) => item.id);
    final combinedCommentList = await Post.getComments(postIdList: postIdList);
    return _Helper.mixPostListAndCombinedCommentList(
        postListPrisma: postListPrisma,
        combinedCommentList: combinedCommentList);
  }

  static Future<Post> fromId({required int postId}) async {
    final postPrisma = await config.prisma.post.findFirst(
        where: priz.PostWhereInput(id: priz.IntFilter(equals: postId)));
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
        data: priz.CommentCreateInput(
            content: content,
            post: priz.PostCreateNestedOneWithoutCommentsInput(
                connect: priz.PostWhereUniqueInput(id: id)),
            user: priz.UserCreateNestedOneWithoutCommentsInput(
                connect: priz.UserWhereUniqueInput(id: userId))));
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

  static final config = Config();
  User._create({required this.id, required this.username});

  static Future<dynamic> createOrUpdatePost({
    int? postId,
    String? content,
    HttpBodyFileUpload? image,
    required String token,
  }) async {
    final user = await User.fromToken(token);
    if (postId != null) {
      final postPrisma = await config.prisma.post
          .findUnique(where: priz.PostWhereUniqueInput(id: postId));
      if (postPrisma == null) {
        throw Exception('No post with specified id found');
      }
      if (postPrisma.userId != user.id) {
        throw Exception(
            'Post creator id and id of requesting user do not match');
      }
    }
    String? imageId;
    String? ext;
    if (image != null) {
      final imageBytes = (image.content as List<int>);
      // TODO: Check file size
      // TODO: Check file content type
      ext = image.filename.split('.')[1];
      imageId = config.uuid.v4();
      await File('${config.fileUploadDir.absolute.path}/$imageId.$ext')
          .writeAsBytes(imageBytes);
    }
    final args = {
      #imageId: _Helper.makeCreateOrUpdateStringValue(
          value: imageId, required: false, documentId: postId),
      #ext: _Helper.makeCreateOrUpdateStringValue(
          value: ext, required: false, documentId: postId),
      #content: _Helper.makeCreateOrUpdateStringValue(
          value: content, required: true, documentId: postId),
    };
    final argKeys = args.keys.toList();
    for (final key in argKeys) {
      if (args[key] == null) {
        args.remove(key);
      }
    }
    if (postId == null) {
      if (content == null) {
        throw Exception(
            'If userId does not exist, content is necessary for new post creation');
      }
      args[Symbol('user')] = priz.UserCreateNestedOneWithoutPostsInput(
          connect: priz.UserWhereUniqueInput(id: user.id));
      final postCreatedPrisma = await config.prisma.post
          .create(data: Function.apply(priz.PostCreateInput.new, [], args));
      return Post.fromPrismaData(postPrisma: postCreatedPrisma);
    } else {
      args[Symbol('user')] = priz.UserUpdateOneRequiredWithoutPostsNestedInput(
          connect: priz.UserWhereUniqueInput(id: user.id));
      final postUpdatedPrisma = await config.prisma.post.update(
          data: Function.apply(priz.PostUpdateInput.new, [], args),
          where: priz.PostWhereUniqueInput(id: postId));
      if (postUpdatedPrisma == null) {
        throw Exception('Failed to update post');
      }
      return Post.fromPrismaData(postPrisma: postUpdatedPrisma);
      // return Post();
    }
  }

  static Future<User> create(
      {required String username, required String password}) async {
    final bcrypt = DBCrypt();
    final passwordHash = bcrypt.hashpw(password, bcrypt.gensalt());
    try {
      final existingUser = await config.prisma.user.findFirst(
          where: priz.UserWhereInput(
              username: priz.StringFilter(equals: username)));
      if (existingUser != null) {
        throw UsernameInUseError(username);
      }
      final createdData = await config.prisma.user.create(
          data: priz.UserCreateInput(
              username: username, passwordHash: passwordHash));
      final user =
          User._create(id: createdData.id, username: createdData.username);
      return user;
    } catch (error) {
      print(error);
      throw FailedToCreateUserError(error);
    }
  }

  static Future<User> fromRequest(HttpRequest req) {
    final token = Utils.extractTokenFromHeader(req);
    return fromToken(token);
  }

  static Future<String> loginAndGetToken(
      {required String username, required String candidatePassword}) async {
    try {
      final foundUser = await config.prisma.user.findFirst(
          where: priz.UserWhereInput(
              username: priz.StringFilter(equals: username)));

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

  static Future<void> deleteUserAccount(String token) async {
    final user = await User.fromToken(token);
    final allPostList = await config.prisma.post.findMany(
        where: priz.PostWhereInput(userId: priz.IntFilter(equals: user.id)));
    final postIdList = allPostList.map((item) => item.id);
    await _Helper.deleteImageFileForEachPost(postIdList: postIdList);
    await config.prisma.user
        .delete(where: priz.UserWhereUniqueInput(id: user.id));
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
        .findUnique(where: priz.UserWhereUniqueInput(id: userId));
    if (foundUser == null) {
      // TODO: Dedicated Error
      throw Exception('User not found');
    }
    return User._create(id: foundUser.id, username: foundUser.username);
  }

  static Future<User> fromId(int userId) async {
    final userFromPrisma = await config.prisma.user
        .findUnique(where: priz.UserWhereUniqueInput(id: userId));
    if (userFromPrisma == null) {
      throw Exception('User not found');
    }
    return User._create(
        id: userFromPrisma.id, username: userFromPrisma.username);
  }

  Future<Post> addPost(
      {required String content, String? imageId, String? ext}) async {
    final postPrisma = await config.prisma.post.create(
        data: priz.PostCreateInput(
            content: content,
            imageId: imageId,
            ext: ext,
            user: priz.UserCreateNestedOneWithoutPostsInput(
                connect: priz.UserWhereUniqueInput(id: id))));
    return Post.fromPrismaData(postPrisma: postPrisma);
  }

  Future<List<Post>> getPosts() async {
    // Post
    final postListPrisma = await config.prisma.post.findMany(
        where: priz.PostWhereInput(userId: priz.IntFilter(equals: id)));
    final postIdList = postListPrisma.map((item) => item.id);
    final combinedCommentList = await Post.getComments(postIdList: postIdList);
    return _Helper.mixPostListAndCombinedCommentList(
        postListPrisma: postListPrisma,
        combinedCommentList: combinedCommentList);
  }
}
