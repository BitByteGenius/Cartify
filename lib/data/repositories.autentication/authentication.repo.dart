import 'package:cartify/features/authentication/screens/Onboarding/onboarding.dart';
import 'package:cartify/features/authentication/screens/login/login.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthenticationRepo extends GetxController {
  static AuthenticationRepo get instance => Get.find();

  // variables
  final deviceStorage = GetStorage();

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
}
