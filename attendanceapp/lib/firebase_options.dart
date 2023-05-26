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
    apiKey: 'AIzaSyAOmblifX8i2paXvX9rITfOKf0CwQf6QJs',
    appId: '1:1017407403202:web:614a70b74d5435a69bb75b',
    messagingSenderId: '1017407403202',
    projectId: 'attendancemanagement5',
    authDomain: 'attendancemanagement5.firebaseapp.com',
    databaseURL: 'https://attendancemanagement5-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'attendancemanagement5.appspot.com',
    measurementId: 'G-985B15GP1B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA8iru1evm8IJqJxP4wP49B4Ij4IO2v4ik',
    appId: '1:1017407403202:android:a2b2a9e2527a34a99bb75b',
    messagingSenderId: '1017407403202',
    projectId: 'attendancemanagement5',
    databaseURL: 'https://attendancemanagement5-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'attendancemanagement5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9sc3rK2u8dO14TQlJhMkHGefjOt1xR0w',
    appId: '1:1017407403202:ios:41c71dd9250937f99bb75b',
    messagingSenderId: '1017407403202',
    projectId: 'attendancemanagement5',
    databaseURL: 'https://attendancemanagement5-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'attendancemanagement5.appspot.com',
    iosClientId: '1017407403202-v2e1vbls25pn5qvgt70oaftiukjdgcnr.apps.googleusercontent.com',
    iosBundleId: 'com.example.attendanceapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD9sc3rK2u8dO14TQlJhMkHGefjOt1xR0w',
    appId: '1:1017407403202:ios:41c71dd9250937f99bb75b',
    messagingSenderId: '1017407403202',
    projectId: 'attendancemanagement5',
    databaseURL: 'https://attendancemanagement5-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'attendancemanagement5.appspot.com',
    iosClientId: '1017407403202-v2e1vbls25pn5qvgt70oaftiukjdgcnr.apps.googleusercontent.com',
    iosBundleId: 'com.example.attendanceapp',
  );
}