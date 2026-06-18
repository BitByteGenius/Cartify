import 'package:cartify/common/widgets/login_singup/loaders/loader.dart';
import 'package:cartify/common/widgets/login_singup/loaders/network_manager.dart';
import 'package:cartify/data/repositories.autentication/authentication.repo.dart';
import 'package:cartify/data/repositories.autentication/user_repo.dart';
import 'package:cartify/features/authentication/models/usermodel.dart';
import 'package:cartify/features/authentication/screens/signup/verify_email.dart';
import 'package:cartify/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // variable
  final privacyPolicy = true.obs;
  final hidePassword = true.obs; //Obserable for hiding/showing password
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstname = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); //Form key for the validation

  //=====Signup===
  /*void signup() async {
    try {
      // Start Loading.............
      TFullScreenLoader.openLoadingDialog(
        'We are processing your interface...',
        TImage.darkAppLogo, //docerAnimation,
      );

      //=====Check Internet Connecitivity

      final isConnected = await NetworkManager.instance.isConnected();
      if (isConnected) {
        //Remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      //=====Form Validation====
      if (!signupFormKey.currentState!.validate()) {
        //Remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      //======Privacy Policy Check ======

      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept Privacy Policy',
          message:
              'In order to create account, You must have to read annd accept the Privicy Policy & Terms of use',
        );
        return;
      }

      //======Register user in the firebase authentication and save user data in the firebase.
      final userCredential = await AuthenticationRepo.instance
          .registerWithEmailAndPassword(
            email.text.trim(),
            password.text.trim(),
          );

      //======Save authenticate user data in the firebase firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstname.text.trim(),
        lastName: lastName.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: '',
      );

      final userRepo = Get.put(UserRepo());
      await userRepo.saveUserRecord(newUser);

      //Remove loader
      TFullScreenLoader.stopLoading();

      //======show succes message===
      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your account has been craeated ! verify email to continue.',
      );

      //=====Move to verify email screen====
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      // Show some Generic error to the user
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      // Remove Loader
      TFullScreenLoader.stopLoading();
    }
  }*/
  void signup() async {
  try {
    // START LOADER
    TFullScreenLoader.openLoadingDialog(
      'Creating your account...',
    );

    // INTERNET CHECK
    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: 'No Internet',
        message: 'Please check your connection',
      );
      return;
    }

    // FORM VALIDATION
    if (!signupFormKey.currentState!.validate()) {
      TFullScreenLoader.stopLoading();
      return;
    }

    // PRIVACY CHECK
    if (!privacyPolicy.value) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(
        title: 'Accept Privacy Policy',
        message: 'You must accept Terms & Conditions',
      );
      return;
    }

    // CREATE USER (AUTH)
    final userCredential = await AuthenticationRepo.instance
        .registerWithEmailAndPassword(
      email.text.trim(),
      password.text.trim(),
    );

    final uid = userCredential.user!.uid;

    // USER MODEL
    final newUser = UserModel(
      id: uid,
      firstName: firstname.text.trim(),
      lastName: lastName.text.trim(),
      username: username.text.trim(),
      email: email.text.trim(),
      phoneNumber: phoneNumber.text.trim(),
      profilePicture: '',
    );

    // SAVE TO FIRESTORE (IMPORTANT: AWAIT)
    final userRepo = Get.put(UserRepo());
    await userRepo.saveUserRecord(newUser);

    // STOP LOADER
    TFullScreenLoader.stopLoading();

    // SUCCESS
    TLoaders.successSnackBar(
      title: 'Account Created',
      message: 'Please verify your email to continue',
    );

    Get.to(() =>  VerifyEmailScreen(email: email.text.trim(),));

  } on FirebaseAuthException catch (e) {
    TFullScreenLoader.stopLoading();
    TLoaders.errorSnackBar(
      title: 'Auth Error',
      message: e.message ?? e.code,
    );
  } catch (e) {
    TFullScreenLoader.stopLoading();
    TLoaders.errorSnackBar(
      title: 'Error',
      message: e.toString(),
    );
  }
}
}
