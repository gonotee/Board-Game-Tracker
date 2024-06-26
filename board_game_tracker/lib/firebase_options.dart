// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCB5GLuGWlhayXnk9qQoDdOjR5CHqzI7Ps',
    appId: '1:259740791539:web:b2b1a41d92574973687d86',
    messagingSenderId: '259740791539',
    projectId: 'board-game-tracker-725a8',
    authDomain: 'board-game-tracker-725a8.firebaseapp.com',
    storageBucket: 'board-game-tracker-725a8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3g1ceckGv4sRxilIAim90ZgjZJ3gpFbE',
    appId: '1:259740791539:android:b78a2a21879bfc31687d86',
    messagingSenderId: '259740791539',
    projectId: 'board-game-tracker-725a8',
    storageBucket: 'board-game-tracker-725a8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBivhrmwEMRjtx7Pt8g2SleMItKd_HqFI8',
    appId: '1:259740791539:ios:ee0318b503615ef6687d86',
    messagingSenderId: '259740791539',
    projectId: 'board-game-tracker-725a8',
    storageBucket: 'board-game-tracker-725a8.appspot.com',
    iosBundleId: 'com.example.boardGameTracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBivhrmwEMRjtx7Pt8g2SleMItKd_HqFI8',
    appId: '1:259740791539:ios:ee0318b503615ef6687d86',
    messagingSenderId: '259740791539',
    projectId: 'board-game-tracker-725a8',
    storageBucket: 'board-game-tracker-725a8.appspot.com',
    iosBundleId: 'com.example.boardGameTracker',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCB5GLuGWlhayXnk9qQoDdOjR5CHqzI7Ps',
    appId: '1:259740791539:web:ca8370826224ad80687d86',
    messagingSenderId: '259740791539',
    projectId: 'board-game-tracker-725a8',
    authDomain: 'board-game-tracker-725a8.firebaseapp.com',
    storageBucket: 'board-game-tracker-725a8.appspot.com',
  );
}