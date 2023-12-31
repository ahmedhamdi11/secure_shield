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
    apiKey: 'AIzaSyAwzwmA-oNW-9nOJoL7fzMjbHrCSqlESTo',
    appId: '1:958706211591:web:c8cbe63b99d1d7c14d03a2',
    messagingSenderId: '958706211591',
    projectId: 'graduation-project-67674',
    authDomain: 'graduation-project-67674.firebaseapp.com',
    storageBucket: 'graduation-project-67674.appspot.com',
    measurementId: 'G-RP6CP9YB6E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDr_6fSXSNdYkaK7mLkTeM_K2FRU9wBcfM',
    appId: '1:958706211591:android:c7ebc5cc3d787da14d03a2',
    messagingSenderId: '958706211591',
    projectId: 'graduation-project-67674',
    storageBucket: 'graduation-project-67674.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAlU-VoS3BpGQUV-MFrWDzCyj4GdgMMERM',
    appId: '1:958706211591:ios:b6b0c1e4fb1b42064d03a2',
    messagingSenderId: '958706211591',
    projectId: 'graduation-project-67674',
    storageBucket: 'graduation-project-67674.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAlU-VoS3BpGQUV-MFrWDzCyj4GdgMMERM',
    appId: '1:958706211591:ios:fcd0100a60c7de9c4d03a2',
    messagingSenderId: '958706211591',
    projectId: 'graduation-project-67674',
    storageBucket: 'graduation-project-67674.appspot.com',
    iosBundleId: 'com.example.app.RunnerTests',
  );
}
