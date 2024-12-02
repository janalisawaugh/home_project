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
    apiKey: 'AIzaSyApwpLJR5lq0x6E7UApkUgyDPgwmvlMu2w',
    appId: '1:901460417942:web:ad6a8f8a1fe7b0c8c011b7',
    messagingSenderId: '901460417942',
    projectId: 'home-app-b61c5',
    authDomain: 'home-app-b61c5.firebaseapp.com',
    storageBucket: 'home-app-b61c5.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDcCcHWESeoE6aSYjL8iISFt-kGmoZJf7A',
    appId: '1:901460417942:android:a33ec96170d1b371c011b7',
    messagingSenderId: '901460417942',
    projectId: 'home-app-b61c5',
    storageBucket: 'home-app-b61c5.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBSwR2rQVGnY04NCW6DPvbrAVWmx1QgH1M',
    appId: '1:901460417942:ios:5cc18ae7c51c7d01c011b7',
    messagingSenderId: '901460417942',
    projectId: 'home-app-b61c5',
    storageBucket: 'home-app-b61c5.firebasestorage.app',
    iosBundleId: 'com.example.homeProject',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBSwR2rQVGnY04NCW6DPvbrAVWmx1QgH1M',
    appId: '1:901460417942:ios:5cc18ae7c51c7d01c011b7',
    messagingSenderId: '901460417942',
    projectId: 'home-app-b61c5',
    storageBucket: 'home-app-b61c5.firebasestorage.app',
    iosBundleId: 'com.example.homeProject',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyApwpLJR5lq0x6E7UApkUgyDPgwmvlMu2w',
    appId: '1:901460417942:web:d7795bdc62a31c96c011b7',
    messagingSenderId: '901460417942',
    projectId: 'home-app-b61c5',
    authDomain: 'home-app-b61c5.firebaseapp.com',
    storageBucket: 'home-app-b61c5.firebasestorage.app',
  );
}
