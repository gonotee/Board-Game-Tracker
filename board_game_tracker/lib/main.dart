import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'models/bggModels.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test Change',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Test Change'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<BggItem> futureItem;

  @override
  void initState() {
    super.initState();
    futureItem = fetchGame();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FutureBuilder<BggItem>(
              future: futureItem,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                      snapshot.data!.items!.item!.id ?? 'Failed to find');
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }

  Future<BggItem> fetchGame() async {
    final myTransformer = Xml2Json();

    final response = await http
        .get(Uri.parse("https://boardgamegeek.com/xmlapi2/thing?id=266192"));

    if (response.statusCode == 200) {
      myTransformer.parse(response.body);
      var convertedToJson = myTransformer.toBadgerfish();
      return bggItemFromJson(convertedToJson);
    } else {
      throw Exception('Failed to load item');
    }
  }
}
