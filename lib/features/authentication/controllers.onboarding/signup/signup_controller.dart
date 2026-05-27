import 'package:cartify/utils/constants/image_string.dart';
import 'package:cartify/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // variable

  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();//Form key for the validation

  //=====Signup===
  Future<void> signup() async {
    try {
      // ====Start Loading====
      Future<void> signup()async { 
        try{
          // Start Loading.............
          TFullScreenLoader.openLoadingDialog('We are processing your interface...', TImage.docerAnimation);
        }
      }

      //=====Check Internet Connecitivity

      //=====Form Validation====

      //======Privacy Policy Check ======

      //======Register user in the firebase authentication and save user data in the firebase

      //======Save authenticate user data in the firebase firestore

      //======show succes message===

      //=====Move to verify email screen====
    } catch (e) {
      // Show some Generic error to the user
    } finally {
      // Remove Loader
    }
  }
}
