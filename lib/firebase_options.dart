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
    apiKey: 'AIzaSyBBXQ-0bvCj_tpczwcP6ZYg7Xkh7Ote6jI',
    appId: '1:771347222134:web:71c40612d29094b7295957',
    messagingSenderId: '771347222134',
    projectId: 'myportfolio-4fee9',
    authDomain: 'myportfolio-4fee9.firebaseapp.com',
    storageBucket: 'myportfolio-4fee9.appspot.com',
    measurementId: 'G-WPX9KCDC0Q',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCUagQbL5zUGK0qU4Op2nYkjA36MjNIsxk',
    appId: '1:771347222134:android:f65ea68b74bb51c5295957',
    messagingSenderId: '771347222134',
    projectId: 'myportfolio-4fee9',
    storageBucket: 'myportfolio-4fee9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBqKJxPK0lBmLm_dy6itMinJBuVCcJJl5I',
    appId: '1:771347222134:ios:5d7db64fc64e5a3a295957',
    messagingSenderId: '771347222134',
    projectId: 'myportfolio-4fee9',
    storageBucket: 'myportfolio-4fee9.appspot.com',
    iosClientId: '771347222134-9104mhfebrvsk5kk2di2663fgbdohhej.apps.googleusercontent.com',
    iosBundleId: 'com.example.portfoliowebsite',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBqKJxPK0lBmLm_dy6itMinJBuVCcJJl5I',
    appId: '1:771347222134:ios:07f7278864474ed5295957',
    messagingSenderId: '771347222134',
    projectId: 'myportfolio-4fee9',
    storageBucket: 'myportfolio-4fee9.appspot.com',
    iosClientId: '771347222134-72e6qc414ofct8cappnq28jbqdoh49cd.apps.googleusercontent.com',
    iosBundleId: 'com.example.portfoliowebsite.RunnerTests',
  );
}