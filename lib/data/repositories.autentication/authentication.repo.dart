import 'package:cartify/data/repositories.autentication/firebase_aut_execption.dart';
import 'package:cartify/features/authentication/screens/Onboarding/onboarding.dart';
import 'package:cartify/features/authentication/screens/login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepo extends GetxController {
  static AuthenticationRepo get instance => Get.find();

  // variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  // Called from main dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  //Function To Show Relevant Screen
  screenRedirect() async {
    //--- Local storage ---
    if (kDebugMode) {
      print('============GetStorage===============');
      print(deviceStorage.read('IsFirstTime'));
    }

    deviceStorage.writeIfNull('IsFirstTime', true);
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() => LoginScreen())
        : Get.offAll(const OnboardingScreen());
  }

  //[EmailAuthentication using signin]

  //[EmailAuthentication]---Register

 Future<userCredential> registerWithEmailAndPassword(
    String email, String password) async {
  try {
  return await _auth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

} on FirebaseAuthException catch (e) {
  throw TFirebaseAuthException(e.code).message;

} catch (e) {
  throw 'Something went wrong. Please try again';
}
}

/// Login
Future<userCredential> loginWithEmailAndPassword(
    String email, String password) async {
  try {
  return await _auth.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

} on FirebaseAuthException catch (e) {
  throw TFirebaseAuthException(e.code).message;

} catch (e) {
  throw 'Something went wrong. Please try again';
}
}
}
