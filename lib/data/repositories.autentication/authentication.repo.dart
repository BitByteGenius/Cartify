import 'package:cartify/data/repositories.autentication/firebase_aut_execption.dart';
import 'package:cartify/features/authentication/screens/Onboarding/onboarding.dart';
import 'package:cartify/features/authentication/screens/login/login.dart';
import 'package:cartify/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepo extends GetxController {
  static AuthenticationRepo get instance => Get.find();

  // Storage
  final deviceStorage = GetStorage();

  // Firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    _auth.authStateChanges().listen(_setInitialScreen);
    super.onReady();
  }

  // -------------------------------
  // ROUTING (PRODUCTION SAFE)
  // -------------------------------
  void _setInitialScreen(User? user) {
    if (user != null) {
      Get.offAll(() => const NavigationMenu());
      return;
    }

    final bool isFirstTime =
        deviceStorage.read('IsFirstTime') ?? true;

    if (isFirstTime) {
      deviceStorage.write('IsFirstTime', false);
      Get.offAll(() => const OnboardingScreen());
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }

  // -------------------------------
  // EMAIL REGISTER
  // -------------------------------
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (_) {
      throw 'Something went wrong. Please try again';
    }
  }

  // -------------------------------
  // EMAIL LOGIN
  // -------------------------------
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (_) {
      throw 'Something went wrong. Please try again';
    }
  }

  // -------------------------------
  // GOOGLE SIGN-IN (PRODUCTION SAFE)
  // -------------------------------
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount? googleUser =
          await googleSignIn.signIn();

      if (googleUser == null) {
        throw 'Google sign-in cancelled';
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential =
          GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (_) {
      throw 'Google Sign-In failed. Please try again';
    }
  }

  // -------------------------------
  // LOGOUT (IMPORTANT FOR PRODUCTION)
  // -------------------------------
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await _auth.signOut();
    } catch (_) {
      throw 'Logout failed. Try again';
    }
  }
}