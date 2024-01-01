import 'dart:io';

import 'package:postgres/postgres.dart' as pg;
import 'package:path/path.dart' as p;
import 'dart:io' as io;
import 'package:dotenv/dotenv.dart';
import 'package:uuid/uuid.dart';

class Config {
  Config._();
  static final Config _instance = Config._();
  factory Config() => _instance;
  final fileUploadDir = Directory('file-uploads');
  final uuid = Uuid();

  final env = DotEnv(includePlatformEnvironment: true)..load();
  late final serverPort = int.parse(env['SERVER_PORT'] as String);

  pg.Connection? _dbConnect;

  Future<pg.Connection> getDBConnection() async {
    _dbConnect ??= await pg.Connection.open(
        pg.Endpoint(
            username: env['DB_USERNAME'],
            database: env['DB_DATABASE']!,
            host: env['DB_HOST']!,
            port: int.parse(env['DB_PORT']!),
            password: env['DB_PASSWORD']),
        settings: pg.ConnectionSettings(sslMode: pg.SslMode.disable));
    return _dbConnect!;
  }

  Future<void> setupDB() async {
    final sqlDir = io.Directory(p.join(io.Directory.current.path, 'sql', 'db'));
    final contents = await sqlDir.list().toList();
    final sqlFileList =
        contents.where((item) => item.path.endsWith('.sql')).toList();
    sqlFileList.sort((a, b) {
      final aAsInt = int.parse(p.basename(a.path));
      final bAsInt = int.parse(p.basename(b.path));
      return aAsInt - bAsInt;
    });
    for (final item in sqlFileList) {
      final fileContent = (await io.File(item.path).readAsString()).trim();
      final conn = await getDBConnection();
      await conn.runTx((s) async {
        final partList = fileContent.split('--');
        for (final part in partList) {
          await s.execute(part);
        }
      });
    }
  }
}
