import 'package:board_game_tracker/models/bgg_item_model.dart';
import 'package:board_game_tracker/services/bgg_api.dart';
import 'package:flutter/material.dart';

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
    _futureItem = BggApiHelper.fetchGame('266192');
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
}
