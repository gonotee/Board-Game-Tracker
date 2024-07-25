class DatabaseGame {
  String id;
  String name;
  String image;
  String description;

  DatabaseGame(
      {required this.id,
      required this.name,
      required this.image,
      required this.description});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
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
