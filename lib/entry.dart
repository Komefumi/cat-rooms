import 'dart:io';

import 'package:alfred/alfred.dart';
import 'package:cat_rooms/error.dart';
import 'package:cat_rooms/http.dart';
import 'package:cat_rooms/models.dart';

void entry() async {
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

    // final user = await User.login(username: body['username'], candidatePassword: body['password']);
  });
  print('heh');

  await app.listen(3000);
}
