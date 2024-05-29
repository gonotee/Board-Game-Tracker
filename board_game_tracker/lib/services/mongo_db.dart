import 'package:mongo_dart/mongo_dart.dart';

import 'dart:developer';

class MongoDatabase {
  static Db? db;
  static final DbCollection user = db!.collection('userCollection');

  static Future<void> connect() async {
    try {
      db = await Db.create('mongodb://dragonhoard.local:8081');
      await db!.open();
      inspect(db);
    } catch (e) {
      log(e.toString());
    }
  }

  static Future<void> close() async {
    try {
      await db!.close();
    } catch (e) {
      log(e.toString());
    }
  }
}
