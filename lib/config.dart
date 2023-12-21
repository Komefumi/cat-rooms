import 'dart:io';

import 'package:cat_rooms/src/generated/prisma/prisma_client.dart';
import 'package:dotenv/dotenv.dart';
import 'package:orm/logger.dart';
import 'package:uuid/uuid.dart';

class Config {
  Config._();
  static final Config _instance = Config._();
  factory Config() => _instance;
  final fileUploadDir = Directory('file-uploads');
  final uuid = Uuid();

  final env = DotEnv(includePlatformEnvironment: true)..load();
  late final serverPort = int.parse(['SERVER_PORT'] as String);

  late final prisma = PrismaClient(
      stdout: Event.values,
      datasources: Datasources(
        db: env['DATABASE_URL'],
      ));
}
