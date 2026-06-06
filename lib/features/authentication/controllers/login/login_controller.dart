import 'package:cartify/common/widgets/login_singup/loaders/loader.dart';
import 'package:cartify/common/widgets/login_singup/loaders/network_manager.dart';
import 'package:cartify/data/repositories.autentication/authentication.repo.dart';
import 'package:cartify/data/repositories.autentication/user_repo.dart';
import 'package:cartify/features/authentication/models/usermodel.dart';
import 'package:cartify/utils/constants/image_string.dart';
import 'package:cartify/utils/popups/full_screen_loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

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
      TFullScreenLoader.openLoadingDialog(
        'Logging you in...',
        TImage.darkAppLogo,
      );

      // Save Remember Me Credentials
      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }
      // Login User
       await AuthenticationRepo.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

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
  Future<void> googleSignIn() async {
    try {
      // Check Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TLoaders.warningSnackBar(
          title: 'No Internet Connection',
          message: 'Please check your internet connection and try again.',
        );
        return;
      }

      // Start Loading
      TFullScreenLoader.openLoadingDialog(
        'Logging in with Google...',
        TImage.darkAppLogo,
      );

      // Sign In with Google
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        TFullScreenLoader.stopLoading();
        return; // User cancelled the sign-in
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(
        credential,
      );
      final User? user = userCredential.user;

      if (user != null) {
        // Check if user record already exists in Firestore, if not create it
        final userRepo = Get.put(UserRepo());
        final doc = await userRepo.getUserRecord(user.uid);
        if (doc == null) {
          final List<String> nameParts = UserModel.nameParts(
            user.displayName ?? '',
          );
          final newUser = UserModel(
            id: user.uid,
            firstName: nameParts.isNotEmpty ? nameParts[0] : '',
            lastName: nameParts.length > 1
                ? nameParts.sublist(1).join(' ')
                : '',
            email: user.email ?? '',
            username: UserModel.generateUsername(user.displayName ?? ''),
            phoneNumber: user.phoneNumber ?? '',
            profilePicture: user.photoURL ?? '',
          );
          await userRepo.saveUserRecord(newUser);
        }
      }

      TFullScreenLoader.stopLoading();
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
        TImage.darkAppLogo,
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
