import 'package:board_game_tracker/models/bgg_item_model.dart';
import 'package:board_game_tracker/models/bgg_search_model.dart';
import 'package:xml2json/xml2json.dart';
import 'package:http/http.dart' as http;

class BggApiHelper {
  static Future<BggItem> fetchGame(String id) async {
    if (id == '0') {
      return BggItem();
    }
    final myTransformer = Xml2Json();

    final response = await http
        .get(Uri.parse("https://boardgamegeek.com/xmlapi2/thing?id=$id"));

    if (response.statusCode == 200) {
      myTransformer.parse(response.body);
      var convertedToJson = myTransformer.toBadgerfish();
      return bggItemFromJson(convertedToJson);
    } else {
      throw Exception('Failed to load item');
    }
  }

  static Future<BggSearch> searchBggForGames(String query) async {
    final myTransformer = Xml2Json();

    final response = await http.get(Uri.parse(
        "https://boardgamegeek.com/xmlapi2/search?query=$query&type=boardgame"));
    if (response.statusCode == 200) {
      myTransformer.parse(response.body);
      var convertedToJson = myTransformer.toBadgerfish();
      return bggSearchFromJson(convertedToJson);
    } else {
      throw Exception('Failed to load item');
    }
  }
}
