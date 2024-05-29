import 'package:board_game_tracker/theme/typography.dart';
import 'package:board_game_tracker/theme/theme.dart';
import 'package:board_game_tracker/widgets/navigation/mygames_page.dart';
import 'package:board_game_tracker/widgets/navigation/searchgames_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyHomePage(title: 'Board Game Tracker'));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _page = const MyGamesPage();
  MaterialScheme _currentTheme = MaterialTheme.darkScheme();
  Icon _themeIcon = const Icon(Icons.mode_night);

  // Snake bar variables
  ShapeBorder? bottomBarShape = const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(25)),
  );
  SnakeBarBehaviour snakeBarStyle = SnakeBarBehaviour.floating;
  EdgeInsets padding = const EdgeInsets.all(12);

  int _selectedItemPosition = 2;
  SnakeShape snakeShape = SnakeShape.circle;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Board Game Tracker',
      theme: ThemeData(
        colorScheme: _currentTheme.toColorScheme(),
        textTheme: textTheme,
        appBarTheme: AppBarTheme(
            color: _currentTheme.primaryContainer,
            foregroundColor: _currentTheme.onPrimaryContainer),
      ),
      home: Scaffold(
        extendBodyBehindAppBar: false,
        resizeToAvoidBottomInset: true,
        extendBody: true,
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            IconButton(
                onPressed: () => setState(() {
                      if (_currentTheme == MaterialTheme.darkScheme()) {
                        _currentTheme = MaterialTheme.lightScheme();
                        _themeIcon = const Icon(Icons.light_mode);
                      } else {
                        _currentTheme = MaterialTheme.darkScheme();
                        _themeIcon = const Icon(Icons.mode_night);
                      }
                    }),
                icon: _themeIcon)
          ],
        ),
        body: Center(child: _page),
        bottomNavigationBar: SnakeNavigationBar.color(
          behaviour: snakeBarStyle,
          snakeShape: snakeShape,
          shape: bottomBarShape,
          padding: padding,
          backgroundColor: _currentTheme.secondaryContainer,

          ///configuration for SnakeNavigationBar.color
          snakeViewColor: _currentTheme.inversePrimary,
          selectedItemColor: snakeShape == SnakeShape.indicator
              ? _currentTheme.inversePrimary
              : null,
          unselectedItemColor: _currentTheme.inverseOnSurface,

          showUnselectedLabels: false,
          showSelectedLabels: false,

          currentIndex: _selectedItemPosition,
          onTap: (index) => setState(() {
            if (index == 3) {
              _page = const SearchGamesPage();
            } else {
              _page = const MyGamesPage();
            }
            _selectedItemPosition = index;
          }),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.notifications,
                  color: _currentTheme.onSecondaryContainer,
                ),
                label: 'tickets'),
            BottomNavigationBarItem(
                icon: Icon(Icons.access_alarm,
                    color: _currentTheme.onSecondaryContainer),
                label: 'calendar'),
            BottomNavigationBarItem(
                icon:
                    Icon(Icons.home, color: _currentTheme.onSecondaryContainer),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.search,
                    color: _currentTheme.onSecondaryContainer),
                label: 'search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings,
                    color: _currentTheme.onSecondaryContainer),
                label: 'settings')
          ],
          selectedLabelStyle: const TextStyle(fontSize: 14),
          unselectedLabelStyle: const TextStyle(fontSize: 10),
        ),
      ),
    );
  }
}
