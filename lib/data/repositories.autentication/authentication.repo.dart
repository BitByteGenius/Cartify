import 'package:cartify/data/repositories.autentication/user_repo.dart';
import 'package:cartify/features/authentication/screens/signup/verify_email.dart';
import 'package:cartify/utils/exceptions/firebase_aut_execption.dart';
import 'package:cartify/features/authentication/screens/Onboarding/onboarding.dart';
import 'package:cartify/features/authentication/screens/login/login.dart';
import 'package:cartify/navigation_menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationRepo extends GetxController {
  static AuthenticationRepo get instance => Get.find();

  final GetStorage deviceStorage = GetStorage();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  //GEt authenticated user data
  User? get authUser => _auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
    super.onReady();
  }

  Future<void> screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      await user.reload();

      if (user.emailVerified) {
        Get.offAll(() => const NavigationMenu());
      } else {
        Get.offAll(() => VerifyEmailScreen(email: user.email));
      }
      return;
    }

    deviceStorage.writeIfNull('IsFirstTime', true);

    final bool isFirstTime = deviceStorage.read('IsFirstTime') ?? true;

    if (isFirstTime) {
      await deviceStorage.write('IsFirstTime', false);
      Get.offAll(() => const OnboardingScreen());
    } else {
      Get.offAll(() => const LoginScreen());
    }
  }

  // Re-Authenticate User
  Future<void> reAuthenticateWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      final credential = EmailAuthProvider.credential(
        email: email.trim(),
        password: password.trim(),
      );

      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw e.message ?? 'Firebase error occurred.';
    } on PlatformException catch (e) {
      throw e.message ?? 'Platform error occurred.';
    } catch (e) {
      throw 'Failed to re-authenticate user.';
    }
  }

  // -------------------------------
  // EMAIL REGISTER (ALL EXCEPTIONS)
  // -------------------------------
  Future<UserCredential> registerWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw 'Firebase error: ${e.message}';
    } on FormatException {
      throw 'Invalid data format';
    } on PlatformException {
      throw 'Platform error occurred';
    } catch (e) {
      throw 'Unexpected error occurred. Please try again';
    }
  }

  // -------------------------------
  // EMAIL LOGIN (ALL EXCEPTIONS)
  // -------------------------------
  Future<UserCredential> loginWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      return await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw 'Firebase error: ${e.message}';
    } on FormatException {
      throw 'Invalid input format';
    } on PlatformException {
      throw 'Platform error occurred';
    } catch (_) {
      throw 'Login failed. Please try again';
    }
  }

  // -------------------------------
  // EMAIL VERIFICATION (ALL EXCEPTIONS)
  // -------------------------------
  Future<void> sendEmailVerification() async {
    try {
      User? user = _auth.currentUser;

      if (user == null) {
        throw 'No authenticated user found. Please login again.';
      }

      // Refresh user state
      await user.reload();
      user = _auth.currentUser;

      if (user == null) {
        throw 'User session expired. Please login again.';
      }

      if (user.emailVerified) {
        return;
      }

      await user.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw e.message ?? 'Firebase error occurred.';
    } on PlatformException catch (e) {
      throw e.message ?? 'Platform error occurred.';
    } on FormatException {
      throw 'Invalid data format.';
    } catch (e) {
      throw 'Failed to send verification email.';
    }
  }

  //-- Delete user account
  Future<void> deleteAccount() async {
    try {
      User? user = _auth.currentUser;

      if (user == null) {
        throw 'No authenticated user found.';
      }
      await UserRepo.instance.removeUserRecord(_auth.currentUser!.uid);
      await _auth.currentUser?.delete();

      await _googleSignIn.signOut();
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw e.message ?? 'Something wants wrong';
    } on PlatformException catch (e) {
      throw e.message ?? 'Platform error occurred.';
    } catch (e) {
      throw 'Failed to delete account.';
    }
  }

  // -------------------------------
  // GOOGLE SIGN-IN (ALL EXCEPTIONS)
  // -------------------------------
  Future<UserCredential> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) {
        throw 'Google sign-in cancelled by user';
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      if (googleAuth.idToken == null) {
        throw 'Google authentication failed';
      }

      final OAuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      return await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw 'Firebase error: ${e.message}';
    } on PlatformException {
      throw 'Platform error during Google sign-in';
    } on FormatException {
      throw 'Invalid Google response format';
    } catch (_) {
      throw 'Google Sign-In failed. Please try again';
    }
  }

  // -------------------------------
  // Forget password
  // -------------------------------
  Future<void> sendPaswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw e.message ?? 'Firebase error occurred.';
    } on PlatformException catch (e) {
      throw e.message ?? 'Platform error occurred.';
    } on FormatException {
      throw 'Invalid data format.';
    } catch (e) {
      throw 'Failed to send verification email.';
    }
  }

  // -------------------------------
  // LOGOUT (ALL EXCEPTIONS)
  // -------------------------------
  Future<void> logout() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw 'Firebase error: ${e.message}';
    } on PlatformException {
      throw 'Platform logout error';
    } catch (_) {
      throw 'Logout failed. Please try again';
    }
  }
}
