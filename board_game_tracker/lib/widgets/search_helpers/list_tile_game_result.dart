import 'package:board_game_tracker/models/bgg_search_model.dart';
import 'package:flutter/material.dart';

class SearchGameListTile extends StatelessWidget {
  final AsyncSnapshot<BggSearch> snapshot;
  final int index;
  const SearchGameListTile(
      {super.key, required this.snapshot, required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: PreLoadInfoTile(
      snapshot: snapshot,
      index: index,
    ));
  }
}

class PreLoadInfoTile extends StatelessWidget {
  final AsyncSnapshot<BggSearch> snapshot;
  final int index;
  const PreLoadInfoTile(
      {super.key, required this.snapshot, required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(snapshot.data?.getNameFollowedByYearPublishedAtIndex(index) ??
          'Data is malformed'),
    );
  }
}
