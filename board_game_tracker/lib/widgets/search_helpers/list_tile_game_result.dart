import 'package:board_game_tracker/models/bgg_item_model.dart';
import 'package:board_game_tracker/models/bgg_search_model.dart';
import 'package:board_game_tracker/services/bgg_api.dart';
import 'package:flutter/material.dart';

class SearchGameListTile extends StatelessWidget {
  final AsyncSnapshot<BggSearch> searchSnapshot;
  final int searchIndex;

  const SearchGameListTile(
      {super.key, required this.searchSnapshot, required this.searchIndex});

  @override
  Widget build(BuildContext context) {
    Future<BggItem> futureGame =
        BggApiHelper.fetchGame(searchSnapshot.data!.getIdAtIndex(searchIndex));
    return Card(
        child: FutureBuilder<BggItem>(
            future: futureGame,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return PostLoadInfoTile(
                    searchSnapshot: searchSnapshot,
                    itemSnapshot: snapshot,
                    index: searchIndex);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return PreLoadInfoTile(
                    snapshot: searchSnapshot, index: searchIndex);
              }
            }));
  }
}

class PostLoadInfoTile extends StatelessWidget {
  final AsyncSnapshot<BggSearch> searchSnapshot;
  final AsyncSnapshot<BggItem> itemSnapshot;
  final int index;
  const PostLoadInfoTile(
      {super.key,
      required this.searchSnapshot,
      required this.itemSnapshot,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:
          Image.network(itemSnapshot.data!.items!.item!.thumbnail?.empty ?? ''),
      title: Text(
          searchSnapshot.data?.getNameFollowedByYearPublishedAtIndex(index) ??
              'Data is malformed'),
    );
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
      leading: const CircularProgressIndicator(),
      title: Text(snapshot.data?.getNameFollowedByYearPublishedAtIndex(index) ??
          'Data is malformed'),
    );
  }
}
