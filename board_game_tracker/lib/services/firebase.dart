import 'package:board_game_tracker/models/firebase_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/bgg_item_model.dart';

class Database {
  static addGameToOwned(DatabaseGame game) {
    final db = FirebaseFirestore.instance;

    // Add a new document using the BGG id as the doc id
    db.collection("ownedGames").doc(game.id).set(game.toMap());
  }

  static DatabaseGame toDatabaseGame(BggItem bggItem) {
    GameTags gameTags = bggItem.getTags();
    DatabaseGame newGame = DatabaseGame(
        id: bggItem.getId(),
        name: bggItem.getName(),
        image: bggItem.getImage(),
        description: bggItem.getDescription(),
        yearPublished: bggItem.getYearPublished(),
        minPlayers: bggItem.getMinPlayers(),
        maxPlayers: bggItem.getMaxPlayers(),
        communityRecommendedPlayers: bggItem.getComRecPlayers(),
        minPlaytime: bggItem.getMinPlaytime(),
        maxPlaytime: bggItem.getMaxPlaytime(),
        averagePlaytime: bggItem.getAveragePlaytime(),
        personalAveragePlaytime: '0',
        minAge: bggItem.getMinAge(),
        complexity: '0',
        categoryTags: gameTags.categoryTags,
        mechanicTags: gameTags.mechanicTags,
        designerTags: gameTags.designerTags,
        artistTags: gameTags.artistTags,
        publisherTags: gameTags.publisherTags);

    return newGame;
  }

  static Future<QuerySnapshot<Map<String, dynamic>>>
      getListOfOwnedGames() async {
    final db = FirebaseFirestore.instance;

    return await db.collection('ownedGames').get();
  }
}
