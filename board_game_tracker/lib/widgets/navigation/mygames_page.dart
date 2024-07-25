import 'package:board_game_tracker/models/bgg_item_model.dart';
import 'package:board_game_tracker/models/firebase_model.dart';
import 'package:board_game_tracker/services/bgg_api.dart';
import 'package:board_game_tracker/services/firebase.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyGamesPage extends StatefulWidget {
  const MyGamesPage({super.key});

  @override
  State<MyGamesPage> createState() => _MyGamesPageState();
}

class _MyGamesPageState extends State<MyGamesPage> {
  late Future<QuerySnapshot<Map<String, dynamic>>> _futureGamesList;

  @override
  void initState() {
    super.initState();
    _futureGamesList = Database.getListOfOwnedGames();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
          future: _futureGamesList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.docs[0].data().toString());
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
