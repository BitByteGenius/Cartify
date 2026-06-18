import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:cartify/utils/exceptions/firebase_aut_execption.dart';

/// Service that encapsulates Firebase Authentication functionality.
/// Provides a reactive [Rx<User?>] stream for the current auth state.
class FirebaseAuthService extends GetxService {
  static FirebaseAuthService get instance => Get.find();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  // Reactive user observable – null when signed out.
  final Rx<User?> currentUser = Rx<User?>(null);

  @override
  void onInit() {
    // Listen to auth state changes and update the reactive user.
    _auth.authStateChanges().listen((user) => currentUser.value = user);
    super.onInit();
  }

  /// Sign up with email & password.
  Future<UserCredential> signUp(String email, String password) async {
    try {
      final cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return cred;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (_) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Sign in with email & password.
  Future<UserCredential> signIn(String email, String password) async {
    try {
      final cred = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return cred;
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (_) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Send password reset email.
  Future<void> sendPasswordReset(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (_) {
      throw 'Unable to send reset email. Please try again';
    }
  }

  /// Sign out the current user.
  Future<void> signOut() async {
    await _auth.signOut();
    // currentUser will be updated via authStateChanges listener.
  }

  /// Delete the currently signed‑in user account.
  Future<void> deleteAccount() async {
    final user = _auth.currentUser;
    if (user == null) {
      throw 'No user is currently signed in';
    }
    try {
      await user.delete();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (_) {
      throw 'Failed to delete account. Please try again';
    }
  }

  /// Update user profile (displayName, photoURL).
  Future<void> updateProfile({String? displayName, String? photoURL}) async {
    final user = _auth.currentUser;
    if (user == null) {
      throw 'No user is currently signed in';
    }
    try {
      await user.updateDisplayName(displayName);
      if (photoURL != null) await user.updatePhotoURL(photoURL);
      // Refresh the user to get latest info.
      await user.reload();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } catch (_) {
      throw 'Failed to update profile. Please try again';
    }
  }
}
