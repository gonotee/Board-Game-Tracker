import 'package:board_game_tracker/models/firebase_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  static addGameToOwned(
      String name, String id, String image, String description) {
    final db = FirebaseFirestore.instance;
    // Create a new game with a name and id
    final databaseGame = DatabaseGame(
        name: name, id: id, image: image, description: description);

// Add a new document with a generated ID
    db.collection("ownedGames").add(databaseGame.toMap()).then(
        (DocumentReference doc) =>
            print('DocumentSnapshot added with ID: ${doc.id}'));
  }

  static Future<QuerySnapshot<Map<String, dynamic>>>
      getListOfOwnedGames() async {
    final db = FirebaseFirestore.instance;

    return await db.collection('ownedGames').get();
  }
}
