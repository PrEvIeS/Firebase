// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyCAHc_A9TZhAH7DgXfuhraguDYJC0WQEL8',
    appId: '1:778816349884:web:7a1eb0b8bffdd66d28d2b9',
    messagingSenderId: '778816349884',
    projectId: 'shopping-list-27c4a',
    authDomain: 'shopping-list-27c4a.firebaseapp.com',
    storageBucket: 'shopping-list-27c4a.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDZpTYUyQlwnFaRL8a89vhpB7F8Ql5S_pg',
    appId: '1:778816349884:android:e1968d82afb3c46428d2b9',
    messagingSenderId: '778816349884',
    projectId: 'shopping-list-27c4a',
    storageBucket: 'shopping-list-27c4a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDbifuZlwv5OD_60D8ZAeQeDYDPl9qSlJ4',
    appId: '1:778816349884:ios:ff2901a1bd5d906628d2b9',
    messagingSenderId: '778816349884',
    projectId: 'shopping-list-27c4a',
    storageBucket: 'shopping-list-27c4a.appspot.com',
    iosClientId: '778816349884-gt60g9cfjvjm1k693e82a53ojb3iknk7.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterTemplate',
  );
}
