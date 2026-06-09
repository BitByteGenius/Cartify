/*import 'package:cartify/common/widgets/login_singup/loaders/loader.dart';
import 'package:cartify/common/widgets/login_singup/loaders/network_manager.dart';
import 'package:cartify/data/repositories.autentication/user_repo.dart';
import 'package:cartify/features/personalization/controllers/user_controller.dart';
import 'package:cartify/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController();
  final userRepository = Get.put(UserRepo());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  //init user data when home screen appear
  @override
  void oninit() {
    initializeNames();
    super.onInit();
  }

  //Fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
   lastName.text = userController.user.value.lastName;

  }

  Future<void> updateUserName()async{
    try{
      //Start Loading
      TFullScreenLoader.openLoadingDialog('We are Updating Your information......');


      //Check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Unable to load',
        message:
            "Something went wrong while loading your information.",
      );
    }
  }
}*/

import 'package:cartify/common/widgets/login_singup/loaders/loader.dart';
import 'package:cartify/common/widgets/login_singup/loaders/network_manager.dart';
import 'package:cartify/data/repositories.autentication/user_repo.dart';
import 'package:cartify/features/personalization/controllers/user_controller.dart';
import 'package:cartify/features/personalization/screens/profile/widgets/profile.dart';
import 'package:cartify/utils/popups/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();

  final userController = Get.put(UserController());
  final userRepository = Get.put(UserRepo());

  final GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  // Initialize text fields with current user data
  void initializeNames() {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog(
        'We are updating your information...',
      );

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Update user data in firestore

      Map<String, dynamic> name = {
        'FirstName': firstName.text.trim(),
        'LastName': lastName.text.trim(),
      };

      await userRepository.updateSingleField(name);

      // Update local Rx user
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
        title: 'Congratulations',
        message: 'Your name has been updated successfully.',
      );

      //Move to previous Screen
      Get.off(() => const ProfileScreen());


    } catch (e) {
      TFullScreenLoader.stopLoading();

      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

}
