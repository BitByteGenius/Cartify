import 'package:cartify/common/widgets/login_singup/loaders/loader.dart';
import 'package:cartify/common/widgets/login_singup/loaders/network_manager.dart';
import 'package:cartify/data/repositories.autentication/authentication.repo.dart';
import 'package:cartify/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:cartify/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  //Variable

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  //Send Reset Password Email
  Future<void> sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing your request');

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // form validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      await AuthenticationRepo.instance.sendPaswordResetEmail(
        email.text.trim(),
      );

      //Remove Loader
      TFullScreenLoader.stopLoading();

      //Show Succes screen
      TLoaders.successSnackBar(
        title: 'Email sent',
        message: 'Email link sent to Reset your Password'.tr,
      );

      //Redirect
      Get.to(() => ResetPasswordScreen(email: email.text.trim()));
    } catch (e) {}
  }

  Future<void> resendPasswordResetEmail(String email) async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing your request');

      // check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //send  Email to reset password
      await AuthenticationRepo.instance.sendPaswordResetEmail(email);

      //Remove Loader
      TFullScreenLoader.stopLoading();

      //Show Succes screen
      TLoaders.successSnackBar(
        title: 'Email sent',
        message: 'Email link sent to Reset your Password'.tr,
      );
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
