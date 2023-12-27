import 'dart:io';

import './config.dart';

class Utils {
  static final config = Config();

  static String extractTokenFromHeader(HttpRequest req) {
    final authHeader = req.headers.value('authorization');
    if (authHeader == null) {
      throw Exception('Auth Header not existing');
    }
    final token = authHeader.split(' ')[1];
    return token;
  }
}
