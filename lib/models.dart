import 'dart:io';

import 'package:alfred/alfred.dart';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:postgres/postgres.dart' as pg;
import 'package:cat_rooms/error.dart';
import 'package:cat_rooms/utils.dart';

import './config.dart';

class _Helper {
  static final config = Config();

  static Future<void> deleteImageFileForEachPost(
      {required Iterable<int> postIdList}) async {
    String listPart = '(';
    final list = postIdList.toList();
    final length = list.length;
    for (int i = 0; i < length; i++) {
      listPart += i != length - 1 ? '${list[i]}, ' : '${list[i]})';
    }
    final result = await _Helper.executeNamedQuery(
        sql: 'SELECT image_id, ext FROM posts WHERE id IN $listPart',
        parameters: {});
    for (final item in result) {
      final data = item.toColumnMap();
      final imageId = data['image_id'];
      final ext = data['ext'];
      if (imageId == null || ext == null) continue;

      final imagePath = '${config.fileUploadDir.absolute}/$imageId.$ext';
      final file = File(imagePath);
      final exists = await file.exists();
      if (exists) {
        await file.delete();
      }
    }
  }

  static Future<pg.Result> executeNamedQuery(
      {required String sql, required Map<String, dynamic> parameters}) async {
    return (await config.getDBConnection())
        .execute(pg.Sql.named(sql), parameters: parameters);
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

  static Future<void> checkByIdIfAuthor(
      {required int commentId, required int candidateUserId}) async {
    final lookupResult = await _Helper.executeNamedQuery(
        sql:
            'SELECT "comments"."user_id" as "commentor_id" FROM comments WHERE id=@comment_id',
        parameters: {'comment_id': commentId});
    if (lookupResult.isEmpty) {
      throw Exception('Comment not found');
    }
    if (lookupResult.first.toColumnMap()['commentor_id'] != candidateUserId) {
      throw Exception('Requesting user is not the author');
    }
  }

  static Future<Comment> updateByIdIfAuthor(
      {required int commentId,
      required int candidateUserId,
      required String newContent,
      required String username}) async {
    await checkByIdIfAuthor(
        commentId: commentId, candidateUserId: candidateUserId);
    final updateResult = await _Helper.executeNamedQuery(
        sql:
            'UPDATE comments SET content=@new_content WHERE id=@comment_id RETURNING *',
        parameters: {'new_content': newContent, 'comment_id': commentId});
    final commentData = updateResult.first.toColumnMap();
    return Comment._create(
        id: commentData['id'],
        content: commentData['content'],
        postId: commentData['post_id'],
        userId: commentData['user_id'],
        username: username);
  }

  static Future<void> deleteByIdIfAuthor(
      {required int commentId, required int candidateUserId}) async {
    // final retrieveResult = await (await config.getDBConnection()).execute();
    await checkByIdIfAuthor(
        commentId: commentId, candidateUserId: candidateUserId);
    await (await config.getDBConnection()).execute(
        pg.Sql.named('DELETE FROM comments WHERE id=@comment_id'),
        parameters: {'commentor_id': commentId});
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
  Post._create(
      {required this.id,
      required this.creatorUserId,
      required this.username,
      this.imageId,
      this.ext,
      required this.content,
      required this.commentList});
  final int id;
  final int creatorUserId;
  final String username;
  final String content;
  String? imageId;
  String? ext;
  List<Comment> commentList;

  static final config = Config();

  static Future<List<Post>> fromUserId({required int userId}) async {
    final retrieveResult = await _Helper.executeNamedQuery(
        sql:
            'SELECT posts.id, posts.content, posts.image_id, posts.ext, posts.user_id as post_creator_user_id, users.username as post_creator_username, comments.id as comment_id, comment_author.id as commentor_user_id, comment_author.username as commentor_username,  comments.content as comment_content FROM posts INNER JOIN users ON posts.user_id = users.id LEFT JOIN comments ON comments.post_id = posts.id LEFT JOIN users comment_author ON comments.user_id = comment_author.id WHERE users.id = @user_id ORDER BY posts.id DESC, comment_id DESC;',
        parameters: {'user_id': userId});
    final postList = Post.fromDBResult(result: retrieveResult);
    return postList;
  }

  static Future<Post?> fromId({required int id}) async {
    final retrieveResult = await _Helper.executeNamedQuery(
      // creator username
      // commentContent
      sql:
          'SELECT posts.id, posts.content, posts.image_id, posts.ext, posts.user_id as post_creator_user_id, users.username as post_creator_username, comments.id as comment_id, comment_author.id as commentor_user_id, comment_author.username as commentor_username,  comments.content as comment_content FROM posts INNER JOIN users ON posts.user_id = users.id LEFT JOIN comments ON comments.post_id = posts.id LEFT JOIN users comment_author ON comments.user_id = comment_author.id WHERE posts.id = @post_id ORDER BY posts.id DESC, comment_id DESC;',
      parameters: {'post_id': id},
    );
    final postList = Post.fromDBResult(result: retrieveResult);
    return postList[0];
  }

  static List<Post> fromDBResult({required pg.Result result}) {
    Map<int, Post> idToPost = {};
    List<int> postIdList = [];
    for (final row in result) {
      final data = row.toColumnMap();
      final postId = data['id'];
      if (!idToPost.containsKey(postId)) {
        List<Comment> commentList = [];
        idToPost[postId] = Post._create(
            id: data['id'],
            creatorUserId: data["post_creator_user_id"],
            username: data['post_creator_username'],
            imageId: data['image_id'],
            ext: data['ext'],
            content: data['content'],
            commentList: commentList);
        postIdList.add(postId);
      }

      int? commentId = data['comment_id'];
      if (commentId == null) {
        continue;
      }

      final foundComment = Comment._create(
          id: data['comment_id'],
          content: data['comment_content'],
          postId: data['id'],
          userId: data['commentor_user_id'],
          username: data['commentor_username']);
      idToPost[postId]!.commentList.add(foundComment);
    }

    return postIdList.map((postId) {
      return idToPost[postId]!;
    }).toList();
  }

  static Future<void> deleteByIdIfAuthor(
      {required int postId, required int candidateUserId}) async {
    final parameters = {'user_id': candidateUserId, 'post_id': postId};
    final lookupResult = await _Helper.executeNamedQuery(
      sql: 'SELECT COUNT(*) FROM posts WHERE id=@post_id AND user_id=@user_id',
      parameters: parameters,
    );
    if (lookupResult.isEmpty) {
      throw Exception('Such post owned by user not found');
    }
    await _Helper.deleteImageFileForEachPost(postIdList: [postId]);
    await _Helper.executeNamedQuery(
      sql: 'DELETE FROM posts WHERE id=@post_id AND user_id=@user_id',
      parameters: parameters,
    );
    // await _Helper.executeNamedQuery(
    //     sql: 'DELETE FROM comments WHERE user_id=@user_id',
    //     parameters: parameters);
  }

  static Future<List<Post>> getLatestPosts() async {
    final retrieveResult = await (await config.getDBConnection()).execute(
      pg.Sql.named(
          'SELECT posts.*, users.username as post_creator_username, comments.id as comment_id, comment_author.id as commentor_user_id, comment_author.username as commentor_username, comment.content as comment_content FROM posts INNER JOIN users ON posts.user_id = users.id LEFT JOIN comments ON comments.post_id = posts.id LEFT JOIN users comment_author ON comments.user_id = comment_author.id ORDER BY posts.id DESC, comment_id DESC;'),
    );
    return Post.fromDBResult(result: retrieveResult);
  }

  Future<Comment> addComment(
      {required String content,
      required int userId,
      required String username}) async {
    final createdData = (await _Helper.executeNamedQuery(
            sql:
                'INSERT INTO comments(content, userId) VALUES(@content, @user_id) RETURNING *',
            parameters: {'content': content, 'user_id': userId}))
        .first
        .toColumnMap();
    return Comment._create(
        id: createdData['id'],
        content: createdData['content'],
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

  // TODO: Check if no updation args are given
  static Future<dynamic> createOrUpdatePost({
    int? postId,
    String? content,
    HttpBodyFileUpload? image,
    required String token,
  }) async {
    final user = await User.fromToken(token);
    if (postId != null) {
      final foundPost = await Post.fromId(id: postId);
      if (foundPost == null) {
        throw Exception('No post with specified id found');
      }
      if (foundPost.creatorUserId != user.id) {
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
      'image_id': imageId,
      'ext': ext,
      'content': content,
      'post_id': postId,
      'user_id': user.id,
    };

    final argKeys = args.keys.toList();
    for (final key in argKeys) {
      if (args[key] == null) {
        args.remove(key);
      }
    }

    int idForLookup;

    final keyList = args.keys.toList();
    final keyLength = keyList.length;
    if (postId == null) {
      if (content == null) {
        throw Exception(
            'If userId does not exist, content is necessary for new post creation');
      }
      String queryString = 'INSERT INTO posts(';
      for (int i = 0; i < keyLength; i++) {
        final key = keyList[i];
        queryString += i != (keyLength - 1) ? '$key, ' : '$key) ';
      }

      queryString += 'VALUES (';
      for (int i = 0; i < keyLength; i++) {
        final key = keyList[i];
        queryString += i != (keyLength - 1) ? '@$key, ' : '@$key) RETURNING id';
      }

      final createResult =
          await _Helper.executeNamedQuery(sql: queryString, parameters: args);
      idForLookup = createResult.first.toColumnMap()['id'];
    } else {
      String queryString = 'UPDATE posts ';
      if (args.keys.isNotEmpty) {
        queryString += ' SET ';
      }
      for (int i = 0; i < keyLength; i++) {
        final key = keyList[i];
        if (key == 'post_id') continue;
        queryString += '$key=@$key${i == keyLength - 1 ? ' ' : ', '}';
      }
      queryString += 'WHERE id=@post_id';
      await _Helper.executeNamedQuery(sql: queryString, parameters: args);
      idForLookup = postId;
    }

    return Post.fromId(id: idForLookup);
  }

  static Future<User> create(
      {required String username, required String password}) async {
    final bcrypt = DBCrypt();
    final passwordHash = bcrypt.hashpw(password, bcrypt.gensalt());
    try {
      final lookupResult = await _Helper.executeNamedQuery(
        sql: 'SELECT username FROM users WHERE username=@username',
        parameters: {'username': username},
      );
      if (lookupResult.isNotEmpty) {
        throw UsernameInUseError(username);
      }
      final createResult = await _Helper.executeNamedQuery(
        sql:
            'INSERT INTO users(username, password_hash) VALUES (@username, @password_hash) RETURNING id, username',
        parameters: {'username': username, 'password_hash': passwordHash},
      );

      final createdData = createResult.first.toColumnMap();
      final user = User._create(
          id: createdData['id'], username: createdData['username']);
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
      final findResult = await _Helper.executeNamedQuery(
          sql:
              'SELECT id, username, password_hash FROM users WHERE username=@username',
          parameters: {'username': username});
      if (findResult.isEmpty) {
        throw UsernameNotFoundError(username);
      }
      final foundUser = findResult.first.toColumnMap();
      final bcrypt = DBCrypt();
      final isMatch =
          bcrypt.checkpw(candidatePassword, foundUser['password_hash']);
      if (!isMatch) {
        throw IncorrectPasswordError();
      }
      final user =
          User._create(id: foundUser['id'], username: foundUser['username']);
      final jwt = JWT(user.toJson());
      final token = jwt.sign(SecretKey(config.env['JWT_SECRET']!));
      return token;
    } catch (error) {
      print(error);
      if (error is IncorrectPasswordError) rethrow;
      throw FailedToLoginUserError(error);
    }
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'username': username};
  }

  // TODO: Ensure deletion of image files as needed
  static Future<void> deleteUserAccount(String token) async {
    final user = await User.fromToken(token);
    final result = await _Helper.executeNamedQuery(
      sql: 'DELETE FROM users WHERE id=@id',
      parameters: {'id': user.id},
    );
    final affectedRows = result.affectedRows;
    if (affectedRows != 0) {
      throw Exception(
          'Expected one user account to be deleted - affected rows: $affectedRows');
    }
    return;
  }

  static Future<User> fromId(int userId) async {
    final result = await _Helper.executeNamedQuery(
        sql: 'SELECT id, username FROM users WHERE id=@id',
        parameters: {'id': userId});
    if (result.isEmpty) {
      // TODO: Dedicated Error
      throw Exception('User not found');
    }
    final foundUser = result.first.toColumnMap();
    return User._create(id: foundUser['id'], username: foundUser['username']);
  }

  static Future<User> fromToken(String token) async {
    final decoded =
        JWT.tryVerify(token, SecretKey(config.env['JWT_SECRET'] as String));
    if (decoded == null) {
      // TODO: Dedicated Error
      throw Exception('Token validation failed');
    }
    final userId = decoded.payload['id'];
    return fromId(userId);
  }

  Future<Post> addPost(
      {required String content, String? imageId, String? ext}) async {
    final result = await _Helper.executeNamedQuery(
      sql: '''
          INSERT INTO posts(image_id, ext, content, user_id)
          VALUES (@image_id, @ext, @content, @user_id)
          RETURNING id
        ''',
      parameters: {
        'image_id': imageId,
        'ext': ext,
        'content': content,
        'user_id': id
      },
    );
    return (await Post.fromId(id: result.first.toColumnMap()['id']))!;
  }

  Future<List<Post>> getPosts() async {
    return Post.fromUserId(userId: id);
  }
}
