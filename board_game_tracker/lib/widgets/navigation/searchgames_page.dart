import 'package:board_game_tracker/models/bgg_search_model.dart';
import 'package:board_game_tracker/services/bgg_api.dart';
import 'package:flutter/material.dart';

class SearchGamesPage extends StatefulWidget {
  const SearchGamesPage({super.key});

  @override
  State<SearchGamesPage> createState() => _SearchGamesPageState();
}

class _SearchGamesPageState extends State<SearchGamesPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController searchTermController = TextEditingController();
  late Future<BggSearch> _searchData;

  @override
  void initState() {
    super.initState();
    _searchData = BggApiHelper.searchBgg('catan');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(children: [
            Form(
              key: _formKey,
              child: TextFormField(
                controller: searchTermController,
                decoration: InputDecoration(
                    hintText: 'Search for games',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24))),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ),
            Positioned(
              top: 10,
              right: 0,
              child: ElevatedButton(
                onPressed: submitForm,
                style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Icon(Icons.search),
                ),
              ),
            )
          ]),
        ),
        Expanded(
          child: FutureBuilder<BggSearch>(
            future: _searchData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: int.parse(snapshot.data?.total ?? '0'),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(snapshot.data!.item![index].name?.value ??
                            'Failed to load name'),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ),
      ],
    );
  }

  submitForm() {
    if (_formKey.currentState!.validate()) {
      String sanitizedQuery = prepareQuery(searchTermController.value.text);
      setState(() {
        _searchData = BggApiHelper.searchBgg(sanitizedQuery);
      });
    }
  }

  String prepareQuery(String input) {
    String sanitizedQuery = input.toLowerCase();
    sanitizedQuery = sanitizedQuery.replaceAll(' ', '+');
    return sanitizedQuery;
  }
}
