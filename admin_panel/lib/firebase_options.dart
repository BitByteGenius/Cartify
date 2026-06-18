import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }

    throw UnsupportedError(
      'This admin panel is currently configured only for Web.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAI9EflFM6F-yCm2QAHBEaPyhdnqD4TanI',
    appId: '1:529127507002:web:de2d4201aac68c7394a103',
    messagingSenderId: '529127507002',
    projectId: 'hastkala-39a7d',
    authDomain: 'hastkala-39a7d.firebaseapp.com',
    databaseURL: 'https://hastkala-39a7d-default-rtdb.firebaseio.com',
    storageBucket: 'hastkala-39a7d.firebasestorage.app',
  );
}