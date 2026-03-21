import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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
        return web;
      case TargetPlatform.linux:
        return web;
      case TargetPlatform.fuchsia:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAcztdjC3GmnSf7u73QY8-kwJSyuk4_0UQ',
    appId: '1:943995994835:ios:961ae539dd4f23a3cc8a26',
    messagingSenderId: '943995994835',
    projectId: 'englishb2-ae7b6',
    storageBucket: 'englishb2-ae7b6.firebasestorage.app',
    iosBundleId: 'com.english.appexample',
  );

  // TODO: Register an Android app in Firebase Console and update appId
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAcztdjC3GmnSf7u73QY8-kwJSyuk4_0UQ',
    appId: '1:943995994835:android:REPLACE_WITH_ANDROID_APP_ID',
    messagingSenderId: '943995994835',
    projectId: 'englishb2-ae7b6',
    storageBucket: 'englishb2-ae7b6.firebasestorage.app',
  );

  // TODO: Register a Web app in Firebase Console and update apiKey + appId
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAcztdjC3GmnSf7u73QY8-kwJSyuk4_0UQ',
    appId: '1:943995994835:web:REPLACE_WITH_WEB_APP_ID',
    messagingSenderId: '943995994835',
    projectId: 'englishb2-ae7b6',
    storageBucket: 'englishb2-ae7b6.firebasestorage.app',
    authDomain: 'englishb2-ae7b6.firebaseapp.com',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAcztdjC3GmnSf7u73QY8-kwJSyuk4_0UQ',
    appId: '1:943995994835:ios:961ae539dd4f23a3cc8a26',
    messagingSenderId: '943995994835',
    projectId: 'englishb2-ae7b6',
    storageBucket: 'englishb2-ae7b6.firebasestorage.app',
    iosBundleId: 'com.english.appexample',
  );
}
