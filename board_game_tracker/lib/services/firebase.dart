import 'package:board_game_tracker/models/firebase_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/bgg_item_model.dart';

class Database {
  static addGameToOwned(DatabaseGame game) {
    final db = FirebaseFirestore.instance;
    // Create a new game with a name and id
    final databaseGame = DatabaseGame(
        name: game.name,
        id: game.id,
        image: game.image,
        description: game.description);

// Add a new document with a generated ID
    db.collection("ownedGames").doc(databaseGame.id).set(databaseGame.toMap());
  }

  static DatabaseGame toDatabaseGame(BggItem bggItem) {
    DatabaseGame newGame = DatabaseGame(
        id: bggItem.getId(),
        name: bggItem.getName(),
        image: bggItem.getImage(),
        description: bggItem.getDescription());

    return newGame;
  }

  static Future<QuerySnapshot<Map<String, dynamic>>>
      getListOfOwnedGames() async {
    final db = FirebaseFirestore.instance;

    return await db.collection('ownedGames').get();
  }
}
