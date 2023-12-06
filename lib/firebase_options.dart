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
        return macos;
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
    apiKey: 'AIzaSyD-5pxspGalG1jueGCpcumHl1GqfjJeRMQ',
    appId: '1:826500670407:web:c8812b3e75429d86c5afe2',
    messagingSenderId: '826500670407',
    projectId: 'chat-app-c341e',
    authDomain: 'chat-app-c341e.firebaseapp.com',
    storageBucket: 'chat-app-c341e.appspot.com',
    measurementId: 'G-2PDKRHWXXE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB3f7_669KuL_5DAbNNtrkmlBbzhKbfMys',
    appId: '1:826500670407:android:206a3957885212f4c5afe2',
    messagingSenderId: '826500670407',
    projectId: 'chat-app-c341e',
    storageBucket: 'chat-app-c341e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC92VPD-lHKeKVUhVVaKJN2SKzCRCzdU-c',
    appId: '1:826500670407:ios:1ad198f74910c5b4c5afe2',
    messagingSenderId: '826500670407',
    projectId: 'chat-app-c341e',
    storageBucket: 'chat-app-c341e.appspot.com',
    iosBundleId: 'com.example.untitled1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC92VPD-lHKeKVUhVVaKJN2SKzCRCzdU-c',
    appId: '1:826500670407:ios:f1fcc0ee65b8c05ac5afe2',
    messagingSenderId: '826500670407',
    projectId: 'chat-app-c341e',
    storageBucket: 'chat-app-c341e.appspot.com',
    iosBundleId: 'com.example.untitled1.RunnerTests',
  );
}
