import 'package:dbcrypt/dbcrypt.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:cat_rooms/error.dart';
import 'package:cat_rooms/src/generated/prisma/prisma_client.dart';

import './config.dart';

class User {
  final int id;
  String username;
  // String passwordHash;

  static final config = Config();
  User._create(this.id, this.username);
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
      final user = User._create(createdData.id, createdData.username);
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
      final user = User._create(foundUser.id, foundUser.username);
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
}
