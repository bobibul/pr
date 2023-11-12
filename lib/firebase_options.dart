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
    apiKey: 'AIzaSyBdTHYppLWD4TMhe3sYaSwIU6ZaKwcWuls',
    appId: '1:326932205098:web:ab47ed2d302ff42c46bd53',
    messagingSenderId: '326932205098',
    projectId: 'jinhyuk1215',
    authDomain: 'jinhyuk1215.firebaseapp.com',
    storageBucket: 'jinhyuk1215.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDvMgROSLzn3AWUG09h4Gn-BnOBkuOelSk',
    appId: '1:326932205098:android:ab2c3675db0a0b1e46bd53',
    messagingSenderId: '326932205098',
    projectId: 'jinhyuk1215',
    storageBucket: 'jinhyuk1215.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyASfxDScepGLh7vPG-EKnRjHztOaDGmP0U',
    appId: '1:326932205098:ios:e063d4a82026ce0a46bd53',
    messagingSenderId: '326932205098',
    projectId: 'jinhyuk1215',
    storageBucket: 'jinhyuk1215.appspot.com',
    iosClientId: '326932205098-mpc5t8gpa8brmdkui46cg5rqkgbch4sc.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyASfxDScepGLh7vPG-EKnRjHztOaDGmP0U',
    appId: '1:326932205098:ios:da7ae9f03686059446bd53',
    messagingSenderId: '326932205098',
    projectId: 'jinhyuk1215',
    storageBucket: 'jinhyuk1215.appspot.com',
    iosClientId: '326932205098-v2copeu2p4rsbbuf60rsv24pub60h118.apps.googleusercontent.com',
    iosBundleId: 'com.example.untitled.RunnerTests',
  );
}
