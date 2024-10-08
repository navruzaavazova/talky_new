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
    apiKey: 'AIzaSyABpRuFCGq7RKPHEAljl3NyX_OHtZvDdhk',
    appId: '1:16398219977:web:7f59888c5c0b51b48aeb18',
    messagingSenderId: '16398219977',
    projectId: 'otp-verification-n21',
    authDomain: 'otp-verification-n21.firebaseapp.com',
    storageBucket: 'otp-verification-n21.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLvywywIKYnTvMwVJqAEjJS__wclIE5wE',
    appId: '1:16398219977:android:1d2719ec082942638aeb18',
    messagingSenderId: '16398219977',
    projectId: 'otp-verification-n21',
    storageBucket: 'otp-verification-n21.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNTeOR1UJzOwodjNyo7p-jUYRj_A1eO8o',
    appId: '1:16398219977:ios:5cdaf54dbfcdde118aeb18',
    messagingSenderId: '16398219977',
    projectId: 'otp-verification-n21',
    storageBucket: 'otp-verification-n21.appspot.com',
    iosBundleId: 'com.example.talky',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDNTeOR1UJzOwodjNyo7p-jUYRj_A1eO8o',
    appId: '1:16398219977:ios:5cdaf54dbfcdde118aeb18',
    messagingSenderId: '16398219977',
    projectId: 'otp-verification-n21',
    storageBucket: 'otp-verification-n21.appspot.com',
    iosBundleId: 'com.example.talky',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyABpRuFCGq7RKPHEAljl3NyX_OHtZvDdhk',
    appId: '1:16398219977:web:68eeaccc1e44b5bf8aeb18',
    messagingSenderId: '16398219977',
    projectId: 'otp-verification-n21',
    authDomain: 'otp-verification-n21.firebaseapp.com',
    storageBucket: 'otp-verification-n21.appspot.com',
  );
}
