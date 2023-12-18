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
  app.post('/post', (req, res) async {
    try {
      final body = await req.body as Map<String, dynamic>;
      print('body: $body');
      final token = body['token'] as String;
      final user = await User.fromToken(token);
      final image = (body['image'] as HttpBodyFileUpload?);
      String? imageId;
      if (image != null) {
        final imageBytes = (image.content as List<int>);
        // TODO: Check file size
        // TODO: Check file content type
        final ext = image.filename.split('.')[1];
        imageId = uuid.v4();
        await File('${fileUploadDir.absolute.path}/$imageId.$ext')
            .writeAsBytes(imageBytes);
      }
      final createdPost = await user.addPost(body['token'], imageId);
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
