import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

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
    apiKey: 'AIzaSyAeuXLRZV2faDpJ6wqw8_fSE4Bkyg5A6gk',
    appId: '1:676445417476:web:95344e65ad199f29724551',
    messagingSenderId: '676445417476',
    projectId: 'my-app-4dd6c',
    authDomain: 'my-app-4dd6c.firebaseapp.com',
    storageBucket: 'my-app-4dd6c.appspot.com',
    measurementId: 'G-4MCFHN0VF1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCRUdCy7pxiWEX7KTp3tA7fQL8yUg6kFLQ',
    appId: '1:676445417476:android:e296db041970c78e724551',
    messagingSenderId: '676445417476',
    projectId: 'my-app-4dd6c',
    storageBucket: 'my-app-4dd6c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBiMmMu4OvmVbOM2x_zSmIkWBAsVfWsXyg',
    appId: '1:676445417476:ios:1be3acc6cec0b835724551',
    messagingSenderId: '676445417476',
    projectId: 'my-app-4dd6c',
    storageBucket: 'my-app-4dd6c.appspot.com',
    iosClientId: '676445417476-5mnm1eapr3ihpp9uc8uhgng8ohdieips.apps.googleusercontent.com',
    iosBundleId: 'com.example.myApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBiMmMu4OvmVbOM2x_zSmIkWBAsVfWsXyg',
    appId: '1:676445417476:ios:1be3acc6cec0b835724551',
    messagingSenderId: '676445417476',
    projectId: 'my-app-4dd6c',
    storageBucket: 'my-app-4dd6c.appspot.com',
    iosClientId: '676445417476-5mnm1eapr3ihpp9uc8uhgng8ohdieips.apps.googleusercontent.com',
    iosBundleId: 'com.example.myApp',
  );
}
