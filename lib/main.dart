import 'package:cartify/data/repositories.autentication/authentication.repo.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
//import 'package:get/get.dart';

import 'app.dart';
import 'firebase_options.dart';
// import your repository if created
// import 'authentication_repository.dart';

Future<void> main() async {
  // ✅ REQUIRED for async initialization
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // Getx Local Storage
  await GetStorage.init();

  // Initialize Hive for offline caching
  await Hive.initFlutter();
  await Hive.openBox('cart_box');
  await Hive.openBox('wishlist_box');
  await Hive.openBox('user_profile_box');
  await Hive.openBox('products_cache_box');

  // Await Splash until other item load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // ✅ Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((FirebaseApp value) => Get.put(AuthenticationRepo()));

  runApp(const App());
}
