// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members

// Package imports:
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
    apiKey: 'AIzaSyDzS-W844ge7mBGyqrwI_QaW5jkGcHPSAU',
    appId: '1:729687741402:web:0b6dc3e1f73ef33c3466e3',
    messagingSenderId: '729687741402',
    projectId: 'quizkidz-3fb2f',
    authDomain: 'quizkidz-3fb2f.firebaseapp.com',
    storageBucket: 'quizkidz-3fb2f.appspot.com',
    measurementId: 'G-25FDXV9B07',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB1e7CzuixCmJDwfR6SxCcDZP-KxzfDoU0',
    appId: '1:729687741402:android:eff450ef552f5a4b3466e3',
    messagingSenderId: '729687741402',
    projectId: 'quizkidz-3fb2f',
    storageBucket: 'quizkidz-3fb2f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCplJ53JG9IyjsTedpbOB35RujcqAtL-2U',
    appId: '1:729687741402:ios:ebf23c6afc27a0563466e3',
    messagingSenderId: '729687741402',
    projectId: 'quizkidz-3fb2f',
    storageBucket: 'quizkidz-3fb2f.appspot.com',
    iosClientId: '729687741402-3ira772fct6hln61p34rhmgmafb6b9mv.apps.googleusercontent.com',
    iosBundleId: 'com.example.quizkidz',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCplJ53JG9IyjsTedpbOB35RujcqAtL-2U',
    appId: '1:729687741402:ios:ebf23c6afc27a0563466e3',
    messagingSenderId: '729687741402',
    projectId: 'quizkidz-3fb2f',
    storageBucket: 'quizkidz-3fb2f.appspot.com',
    iosClientId: '729687741402-3ira772fct6hln61p34rhmgmafb6b9mv.apps.googleusercontent.com',
    iosBundleId: 'com.example.quizkidz',
  );
}
