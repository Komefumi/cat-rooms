import 'dart:io';

import 'package:alfred/alfred.dart';

void entry() async {
  final app = Alfred();

  app.get('/', (req, res) => File('assets/public/index.html'));
  app.get('/public/*', (req, res) => Directory('assets/public'));
  app.get('/example', (req, res) => res.json({'status': 'ok'}));
  app.post('/register', (req, res) async {
    final body = await req.body;
    print(body);
    res.json({'language': 'esperanto'});
  });
  print('heh');

  await app.listen(3000);
}
