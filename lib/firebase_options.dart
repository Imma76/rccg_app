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
    apiKey: 'AIzaSyACSbpjlSvnAwMPqYJbUQYjXQGHwkv1oqo',
    appId: '1:862115994243:web:de306945b9f46c192f99b6',
    messagingSenderId: '862115994243',
    projectId: 'rccg-app-f7633',
    authDomain: 'rccg-app-f7633.firebaseapp.com',
    storageBucket: 'rccg-app-f7633.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBZNMpPrXFjQ3ZTw63BZDxIGqNXGP2mn18',
    appId: '1:862115994243:android:ed20e13e9810cc2b2f99b6',
    messagingSenderId: '862115994243',
    projectId: 'rccg-app-f7633',
    storageBucket: 'rccg-app-f7633.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCkeAe-srhscvWmUGxLgBS_wmiK8KMt_9c',
    appId: '1:862115994243:ios:d30a0dde0ff3ff042f99b6',
    messagingSenderId: '862115994243',
    projectId: 'rccg-app-f7633',
    storageBucket: 'rccg-app-f7633.appspot.com',
    iosClientId: '862115994243-3o2ib20oq2d8eogupo4qqb6jju23ohud.apps.googleusercontent.com',
    iosBundleId: 'com.example.rccgApp',
  );
}
