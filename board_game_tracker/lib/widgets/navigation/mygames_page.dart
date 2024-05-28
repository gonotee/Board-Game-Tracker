import 'package:board_game_tracker/models/bgg_item_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

class MyGamesPage extends StatefulWidget {
  const MyGamesPage({super.key});

  @override
  State<MyGamesPage> createState() => _MyGamesPageState();
}

class _MyGamesPageState extends State<MyGamesPage> {
  late Future<BggItem> _futureItem;

  @override
  void initState() {
    super.initState();
    _futureItem = fetchGame('266192');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FutureBuilder<BggItem>(
          future: _futureItem,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                  snapshot.data!.items!.item!.name!.value ?? 'Failed to find');
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ],
    );
  }

  Future<BggItem> fetchGame(String id) async {
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
}
