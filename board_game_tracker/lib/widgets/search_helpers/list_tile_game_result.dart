import 'package:board_game_tracker/models/bgg_item_model.dart';
import 'package:board_game_tracker/models/bgg_search_model.dart';
import 'package:board_game_tracker/services/bgg_api.dart';
import 'package:board_game_tracker/services/firebase.dart';
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
    return FutureBuilder<BggItem>(
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
        });
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
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.94,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(4.0, 2.0, 4.0, 0.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Column(
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.28,
                          maxHeight: MediaQuery.of(context).size.width * 0.28,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(48),
                            child: Image.network(
                              itemSnapshot.data!.items!.item!.image?.empty ??
                                  '',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Database.addDoc();
                          },
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder()),
                          child: const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Icon(Icons.archive),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Text(
                          searchSnapshot.data
                                  ?.getNameFollowedByYearPublishedAtIndex(
                                      index) ??
                              'Data is malformed',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.65,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                        child: Text(
                          itemSnapshot.data!.getDescription(),
                          style: const TextStyle(
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
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
