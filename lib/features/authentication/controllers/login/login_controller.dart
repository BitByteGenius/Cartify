import 'package:cartify/common/widgets/login_singup/loaders/loader.dart';
import 'package:cartify/common/widgets/login_singup/loaders/network_manager.dart';
import 'package:cartify/data/repositories.autentication/authentication.repo.dart';
import 'package:cartify/features/personalization/controllers/user_controller.dart';
import 'package:cartify/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  final _auth = FirebaseAuth.instance;

  @override
  void onInit() {
    super.onInit();
    // Load remembered email and password if present
    final rememberedEmail = localStorage.read('REMEMBER_ME_EMAIL');
    final rememberedPassword = localStorage.read('REMEMBER_ME_PASSWORD');
    if (rememberedEmail != null) {
      email.text = rememberedEmail;
      rememberMe.value = true;
    }
    if (rememberedPassword != null) {
      password.text = rememberedPassword;
    }
  }

  /// Email & Password Sign In
  Future<void> signInWithEmailAndPassword() async {
    try {
      // Check Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Validate Form
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Start Loading
      TFullScreenLoader.openLoadingDialog('Logging you in...', );

      // Save Remember Me Credentials
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      // Login User
      await AuthenticationRepo.instance.loginWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // Remove Loader
      TFullScreenLoader.stopLoading();

      // AuthenticationRepo's screenRedirect will automatically navigate to NavigationMenu
      AuthenticationRepo.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Google Sign In
  Future<void> signInWithGoogle() async {
    try {
      TFullScreenLoader.openLoadingDialog('Login you in', );

      final isConnected = await NetworkManager.instance.isConnected();

      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      final userCredential = await AuthenticationRepo.instance
          .signInWithGoogle();

      await userController.saveUserRecord(userCredential);

      TFullScreenLoader.stopLoading();

      AuthenticationRepo.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  /// Send Password Reset Email
  Future<void> sendPasswordResetEmail(String emailText) async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) return;

      TFullScreenLoader.openLoadingDialog(
        'Sending reset link...',
        
      );

      await _auth.sendPasswordResetEmail(email: emailText.trim());

      TFullScreenLoader.stopLoading();
      TLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Password reset link sent to $emailText',
      );
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
