import 'package:flutter/material.dart';

class SearchGamesPage extends StatefulWidget {
  const SearchGamesPage({super.key});

  @override
  State<SearchGamesPage> createState() => _SearchGamesPageState();
}

class _SearchGamesPageState extends State<SearchGamesPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: SearchForm(),
        ),
      ],
    );
  }
}

class SearchForm extends StatefulWidget {
  const SearchForm({super.key});

  @override
  State<SearchForm> createState() => _SearchFormState();
}

class _SearchFormState extends State<SearchForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Form(
        key: _formKey,
        child: TextFormField(
          decoration: InputDecoration(
              hintText: 'Search for games',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(24))),
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
          onPressed: () {
            // TODO do somthing here on submit
          },
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(Icons.search),
          ),
          style: ElevatedButton.styleFrom(shape: CircleBorder()),
        ),
      )
    ]);
  }
}
