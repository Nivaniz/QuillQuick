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
    apiKey: 'AIzaSyB3GpQ49f4ba_n-tnlpVvSknbm04UTtqUg',
    appId: '1:759644315781:web:76135bb23e185b974c49ec',
    messagingSenderId: '759644315781',
    projectId: 'quillquick-815e3',
    authDomain: 'quillquick-815e3.firebaseapp.com',
    storageBucket: 'quillquick-815e3.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCDWyGzHWTwq2dwyQmAaYp6YDBCwmvhjrU',
    appId: '1:759644315781:android:e49a3bc6a042b78b4c49ec',
    messagingSenderId: '759644315781',
    projectId: 'quillquick-815e3',
    storageBucket: 'quillquick-815e3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBL5-wCruhoE7Bj79Gw_zy9sruenjsdPNw',
    appId: '1:759644315781:ios:b1074566e5bba33f4c49ec',
    messagingSenderId: '759644315781',
    projectId: 'quillquick-815e3',
    storageBucket: 'quillquick-815e3.appspot.com',
    iosBundleId: 'com.example.appnotas',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBL5-wCruhoE7Bj79Gw_zy9sruenjsdPNw',
    appId: '1:759644315781:ios:8d01927fac6b1b774c49ec',
    messagingSenderId: '759644315781',
    projectId: 'quillquick-815e3',
    storageBucket: 'quillquick-815e3.appspot.com',
    iosBundleId: 'com.example.appnotas.RunnerTests',
  );
}
