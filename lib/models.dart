import 'package:dbcrypt/dbcrypt.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:cat_rooms/error.dart';
import 'package:cat_rooms/src/generated/prisma/prisma_client.dart';

import './config.dart';

class Post {
  Post.create(this.id, this.imageId, this.content);
  final int id;
  String? imageId;
  String content;

  Map<String, dynamic> toJson() {
    return {'id': id, 'imageId': imageId, 'content': content};
  }
}

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
    return User._create(foundUser.id, foundUser.username);
  }

  Future<Post> addPost(String content, String? imageId) async {
    final postPrisma = await config.prisma.post.create(
        data: PostCreateInput(
            content: content,
            imageId: imageId,
            user: UserCreateNestedOneWithoutPostsInput(
                connect: UserWhereUniqueInput(id: id))));
    return Post.create(postPrisma.id, postPrisma.imageId, postPrisma.content);
  }
}
