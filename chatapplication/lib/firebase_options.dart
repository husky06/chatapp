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
    apiKey: 'AIzaSyCA7bWh69EquEb2HBZQMBypuTRGRuWK_78',
    appId: '1:334914703231:web:7c3a0874e80f722d61144a',
    messagingSenderId: '334914703231',
    projectId: 'chatapp-45cf3',
    authDomain: 'chatapp-45cf3.firebaseapp.com',
    storageBucket: 'chatapp-45cf3.appspot.com',
    measurementId: 'G-W6GB20JNW6',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqr96bZrPoowaq-g-mm128C1xcuk-m41c',
    appId: '1:334914703231:android:6dc2a7b6523a65e861144a',
    messagingSenderId: '334914703231',
    projectId: 'chatapp-45cf3',
    storageBucket: 'chatapp-45cf3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA8pa85gRVZumKtwMp40GxqkArz0rUZp8I',
    appId: '1:334914703231:ios:35e5147cb401219b61144a',
    messagingSenderId: '334914703231',
    projectId: 'chatapp-45cf3',
    storageBucket: 'chatapp-45cf3.appspot.com',
    iosBundleId: 'com.example.chatapplication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA8pa85gRVZumKtwMp40GxqkArz0rUZp8I',
    appId: '1:334914703231:ios:9b5ea549fbeb6e7961144a',
    messagingSenderId: '334914703231',
    projectId: 'chatapp-45cf3',
    storageBucket: 'chatapp-45cf3.appspot.com',
    iosBundleId: 'com.example.chatapplication.RunnerTests',
  );
}
