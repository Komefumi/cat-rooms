import 'dart:io';

import 'package:alfred/alfred.dart';
import 'package:cat_rooms/config.dart';
import 'package:uuid/uuid.dart';
import 'package:cat_rooms/error.dart';
import 'package:cat_rooms/utils.dart';
import 'package:cat_rooms/http.dart';
import 'package:cat_rooms/models.dart';

final uuid = Uuid();

void entry() async {
  final config = Config();
  await config.setupDB();
  final fileUploadDir = config.fileUploadDir;
  if (await fileUploadDir.exists() == false) {
    await fileUploadDir.create();
  }
  final app = Alfred();

  app.get('/', (req, res) => File('assets/public/index.html'));
  app.get('/public/*', (req, res) => Directory('assets/public'));
  app.get('/file-uploads/*', (req, res) => fileUploadDir);
  app.get('/example', (req, res) => res.json({'status': 'okok'}));
  app.post('/delete-my-account', (req, res) async {
    try {
      final token = Utils.extractTokenFromHeader(req);
      await User.deleteUserAccount(token);
      Http.handleSuccess(res, {}, 'Successfully deleted user account');
    } catch (e) {
      print(e);
      Http.handleFailure(res, null, 'Failed to delete account');
    }
  });
  app.post('/register', (req, res) async {
    try {
      final body = await req.bodyAsJsonMap;
      final user = await User.create(
          username: body['username'], password: body['password']);
      Http.handleSuccess(res, user.toJson(), 'Successfully registered user');
    } catch (error) {
      print(error);
      Http.handleFailure(res, null, 'Failed to register user');
    }
  });
  app.post('/login', (req, res) async {
    try {
      final body = await req.bodyAsJsonMap;
      final token = await User.loginAndGetToken(
          username: body['username'], candidatePassword: body['password']);
      Http.handleSuccess(res, {'token': token}, 'Successfully logged in');
    } catch (error) {
      print(error);
      if (error is FailedToLoginUserError || error is IncorrectPasswordError) {
        final errorMessage = (error as dynamic).error();
        Http.handleFailure(res, null, errorMessage);
      }
    }
  });
  app.get('/posts', (req, res) async {
    try {
      final user = await User.fromRequest(req);
      final posts = await user.getPosts();
      Http.handleSuccess(res, {'posts': posts}, 'Retrieved posts');
    } catch (error) {
      print(error);
      Http.handleFailure(res, null, 'Failed to fetch posts');
    }
  });
  app.get('/posts/latest', (req, res) async {
    try {
      final posts = await Post.getLatestPosts();
      Http.handleSuccess(res, {'posts': posts}, 'Retrieved latest posts');
    } catch (error) {
      print(error);
      Http.handleFailure(res, null, 'Failed to fetch latest posts');
    }
  });
  app.get('/posts/:userId:int', (req, res) async {
    try {
      final user = await User.fromRequest(req);
      final posts = await user.getPosts();
      Http.handleSuccess(res, {'posts': posts}, 'retrieved posts');
    } catch (error) {
      print(error);
      Http.handleFailure(res, null, 'Failed to fetch posts');
    }
  });
  app.put('/posts/:postId:int', (req, res) async {
    try {
      final body = await req.bodyAsJsonMap;
      final token = Utils.extractTokenFromHeader(req);
      final image = (body['image'] as HttpBodyFileUpload?);
      final updatedPost = await User.createOrUpdatePost(
          token: token,
          content: body['content'],
          image: image,
          postId: req.params['postId']);
      Http.handleSuccess(
          res, {'updatedPost': updatedPost}, 'Successfully updated post');
    } catch (e) {
      print(e);
      Http.handleFailure(res, null, 'Failed to update post');
    }
  });
  app.delete('/posts/:postId:int', (req, res) async {
    try {
      final token = Utils.extractTokenFromHeader(req);
      final user = await User.fromToken(token);
      int postId = req.params['postId'];
      await Post.deleteByIdIfAuthor(postId: postId, candidateUserId: user.id);
      Http.handleSuccess(res, {}, 'Successfully deleted post');
    } catch (e) {
      print(e);
      Http.handleFailure(res, null, 'Failed to delete post');
    }
  });
  app.post('/posts', (req, res) async {
    try {
      final body = await req.bodyAsJsonMap;
      final token = Utils.extractTokenFromHeader(req);
      final image = (body['image'] as HttpBodyFileUpload?);
      final createdPost = await User.createOrUpdatePost(
          token: token, content: body['content'], image: image, postId: null);
      Http.handleSuccess(
          res, {'createdPost': createdPost}, 'Successfully created Post');
    } catch (error) {
      print(error);
      print('req string: ${req.toString()}');
      Http.handleFailure(res, null, 'Failed to create post');
    }
  });
  app.delete('/posts/comments/:commentId:int', (req, res) async {
    try {
      final token = Utils.extractTokenFromHeader(req);
      final user = await User.fromToken(token);
      int commentId = req.params['commentId'];
      await Comment.deleteByIdIfAuthor(
          commentId: commentId, candidateUserId: user.id);
      Http.handleSuccess(res, {}, 'Successfully deleted comment');
    } catch (e) {
      print(e);
      Http.handleFailure(res, null, 'Failed to delete post comment');
    }
  });
  app.put('/posts/comments/:commentId:int', (req, res) async {
    try {
      final token = Utils.extractTokenFromHeader(req);
      final user = await User.fromToken(token);
      int commentId = req.params['commentId'];
      final body = await req.bodyAsJsonMap;
      final commentContent = body['content'];
      final updatedComment = await Comment.updateByIdIfAuthor(
          commentId: commentId,
          candidateUserId: user.id,
          newContent: commentContent,
          username: user.username);
      Http.handleSuccess(res, {'updatedComment': updatedComment},
          'Successfully deleted comment');
    } catch (e) {
      print(e);
      Http.handleFailure(res, null, 'Failed to delete post comment');
    }
  });
  app.post('/posts/:postId:int/comments', (req, res) async {
    try {
      final token = Utils.extractTokenFromHeader(req);
      final user = await User.fromToken(token);
      final body = await req.bodyAsJsonMap;
      final post = await Post.fromId(id: req.params['postId']);
      if (post == null) {
        throw Exception('Post not found');
      }
      final comment = await post.addComment(
          content: body['commentContent'],
          userId: user.id,
          username: user.username);
      Http.handleSuccess(
          res, {'comment': comment}, 'Successfully created comment');
    } catch (e) {
      print(e);
      Http.handleFailure(res, null, 'Failed to create post comment');
    }
  });

  await app.listen(config.serverPort);
}
