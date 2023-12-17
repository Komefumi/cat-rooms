import 'package:cat_rooms/src/generated/prisma/prisma_client.dart';
import 'package:dotenv/dotenv.dart';
import 'package:orm/logger.dart';

class Config {
  Config._();
  static final Config _instance = Config._();
  factory Config() => _instance;

  final env = DotEnv(includePlatformEnvironment: true)..load();

  late final prisma = PrismaClient(
      stdout: Event.values,
      datasources: Datasources(
        db: env['DATABASE_URL'],
      ));
}
