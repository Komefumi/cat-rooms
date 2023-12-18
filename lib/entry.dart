import 'dart:io';

import 'package:alfred/alfred.dart';
import 'package:uuid/uuid.dart';
import 'package:cat_rooms/error.dart';
import 'package:cat_rooms/http.dart';
import 'package:cat_rooms/models.dart';

final uuid = Uuid();

final fileUploadDir = Directory('file-uploads');

void entry() async {
  if (await fileUploadDir.exists() == false) {
    await fileUploadDir.create();
  }
  final app = Alfred();

  app.get('/', (req, res) => File('assets/public/index.html'));
  app.get('/public/*', (req, res) => Directory('assets/public'));
  app.get('/file-uploads/*', (req, res) => fileUploadDir);
  app.get('/example', (req, res) => res.json({'status': 'okok'}));
  app.post('/register', (req, res) async {
    try {
      final body = await req.body as Map<String, dynamic>;
      final user = await User.create(
          username: body['username'], password: body['password']);
      print('body: $body\nuser: $user');
      Http.handleSuccess(res, user.toJson(), 'Successfully registered user');
    } catch (error) {
      print(error);
      Http.handleFailure(res, null, 'Failed to register user');
    }
  });
  app.post('/login', (req, res) async {
    try {
      final body = await req.body as Map<String, dynamic>;
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
      print(req.headers);
      final authHeader = req.headers.value('authorization');
      print('auth: $authHeader');
      final token = (authHeader as String).split(' ')[1];
      // final token = body['token'] as String;
      final user = await User.fromToken(token);
      final posts = await user.getPosts();
      Http.handleSuccess(res, {'posts': posts}, 'Retrieved posts');
    } catch (error) {
      print(error);
      Http.handleFailure(res, null, 'Failed to fetch posts');
    }
  });
  app.post('/post', (req, res) async {
    try {
      final body = await req.body as Map<String, dynamic>;
      final token = body['token'] as String;
      final user = await User.fromToken(token);
      final image = (body['image'] as HttpBodyFileUpload?);
      String? imageId;
      String? ext;
      if (image != null) {
        final imageBytes = (image.content as List<int>);
        // TODO: Check file size
        // TODO: Check file content type
        ext = image.filename.split('.')[1];
        imageId = uuid.v4();
        await File('${fileUploadDir.absolute.path}/$imageId.$ext')
            .writeAsBytes(imageBytes);
      }
      final createdPost = await user.addPost(
          content: body['content'], imageId: imageId, ext: ext);
      Http.handleSuccess(res, {'createdPost': createdPost.toJson()},
          'Successfully created Post');
    } catch (error) {
      print(error);
      print('req string: ${req.toString()}');
      Http.handleFailure(res, null, 'Failed to create post');
    }
  });

  await app.listen(3000);
}
