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
    apiKey: 'AIzaSyAfRcKh5G1tSNU4Rk6GxIB4TOPyODRuE-E',
    appId: '1:161109156143:web:466fad1737ad9de53c01da',
    messagingSenderId: '161109156143',
    projectId: 'mordern-flutter-firebase-auth',
    authDomain: 'mordern-flutter-firebase-auth.firebaseapp.com',
    storageBucket: 'mordern-flutter-firebase-auth.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAlyFStlCoz5GAPmgxv4v1tTyuqWf_nq0Q',
    appId: '1:161109156143:android:1cbc4d138fdef4013c01da',
    messagingSenderId: '161109156143',
    projectId: 'mordern-flutter-firebase-auth',
    storageBucket: 'mordern-flutter-firebase-auth.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDtDCNrpWbkqRJRMJlnvWGjkbjefM_4gpw',
    appId: '1:161109156143:ios:8cee0c62be964e863c01da',
    messagingSenderId: '161109156143',
    projectId: 'mordern-flutter-firebase-auth',
    storageBucket: 'mordern-flutter-firebase-auth.appspot.com',
    iosClientId: '161109156143-fnn7abbp17lfuh9eq9mhaagppfppcmjh.apps.googleusercontent.com',
    iosBundleId: 'com.example.mordernLoginUi',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDtDCNrpWbkqRJRMJlnvWGjkbjefM_4gpw',
    appId: '1:161109156143:ios:8cee0c62be964e863c01da',
    messagingSenderId: '161109156143',
    projectId: 'mordern-flutter-firebase-auth',
    storageBucket: 'mordern-flutter-firebase-auth.appspot.com',
    iosClientId: '161109156143-fnn7abbp17lfuh9eq9mhaagppfppcmjh.apps.googleusercontent.com',
    iosBundleId: 'com.example.mordernLoginUi',
  );
}
