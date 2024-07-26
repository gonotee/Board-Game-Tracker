class DatabaseGame {
  String id;
  String name;
  String image;
  String description;
  String yearPublished;

  String minAge;

  String complexity;

  String maxPlayers;
  String minPlayers;
  ComRecPlayers communityRecommendedPlayers;

  String maxPlaytime;
  String minPlaytime;
  String averagePlaytime;
  String personalAveragePlaytime;

  List<Tag> categoryTags;
  List<Tag> mechanicTags;
  List<Tag> designerTags;
  List<Tag> artistTags;
  List<Tag> publisherTags;

  DatabaseGame(
      {required this.id,
      required this.name,
      required this.image,
      required this.description,
      required this.yearPublished,
      required this.minPlayers,
      required this.maxPlayers,
      required this.communityRecommendedPlayers,
      required this.minPlaytime,
      required this.maxPlaytime,
      required this.averagePlaytime,
      required this.personalAveragePlaytime,
      required this.minAge,
      required this.complexity,
      required this.categoryTags,
      required this.mechanicTags,
      required this.designerTags,
      required this.artistTags,
      required this.publisherTags});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'description': description,
      'yearPublished': yearPublished,
      'minPlayers': minPlayers,
      'maxPlayers': maxPlayers,
      'communityRecommendedPlayers': communityRecommendedPlayers.toMap(),
      'minPlaytime': minPlaytime,
      'maxPlaytime': maxPlaytime,
      'averagePlaytime': averagePlaytime,
      'personalAveragePlaytime': personalAveragePlaytime,
      'minAge': minAge,
      'complexity': complexity,
      'categoryTags': convertTagListToGenericList(categoryTags),
      'mechanicTags': convertTagListToGenericList(mechanicTags),
      'designerTags': convertTagListToGenericList(designerTags),
      'artistTags': convertTagListToGenericList(artistTags),
      'publisherTags': convertTagListToGenericList(publisherTags)
    };
  }

  List<Map<String, dynamic>> convertTagListToGenericList(List<Tag> tagList) {
    List<Map<String, dynamic>> convertedList = [];
    for (int i = 0; i < tagList.length; i++) {
      convertedList.add(tagList[i].toMap());
    }
    return convertedList;
  }
}

class GameTags {
  List<Tag> categoryTags;
  List<Tag> mechanicTags;
  List<Tag> designerTags;
  List<Tag> artistTags;
  List<Tag> publisherTags;

  GameTags(
      {required this.categoryTags,
      required this.mechanicTags,
      required this.designerTags,
      required this.artistTags,
      required this.publisherTags});
}

class Tag {
  String type;
  String id;
  String value;

  Tag({required this.type, required this.id, required this.value});

  toMap() {
    return {'type': type, 'id': id, 'value': value};
  }

  @override
  String toString() {
    return 'type: $type, id: $id, value: $value';
  }
}

class ComRecPlayers {
  String bestPlayerNum;

  List<String> recommendedPlayerNums;

  ComRecPlayers(
      {required this.bestPlayerNum, required this.recommendedPlayerNums});

  toMap() {
    return {
      'bestPlayerNum': bestPlayerNum,
      'recommendedPlayerNums': recommendedPlayerNums
    };
  }
}

class DatabaseGameList {
  List<DatabaseGame> games;

  DatabaseGameList({required this.games});

  List<DatabaseGame> getDatabaseGamesList() {
    return games ?? [];
  }
}
