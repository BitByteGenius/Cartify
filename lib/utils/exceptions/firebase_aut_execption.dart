class TException implements Exception {
  final String message;
  const TException(this.message);
}

/// Firebase Auth Exception
class TFirebaseAuthException implements Exception {
  final String code;

  TFirebaseAuthException(this.code);

  String get message {
    switch (code) {
      case 'email-already-in-use':
        return 'This email is already registered. Try logging in.';
      case 'invalid-email':
        return 'Invalid email address.';
      case 'user-disabled':
        return 'This user account has been disabled.';
      case 'user-not-found':
        return 'No user found with this email.';
      case 'wrong-password':
        return 'Incorrect password.';
      case 'weak-password':
        return 'Password is too weak.';
      case 'operation-not-allowed':
        return 'Operation not allowed.';
      case 'too-many-requests':
        return 'Too many attempts. Try again later.';
      case 'network-request-failed':
        return 'No internet connection.';
      case 'invalid-credential':
        return 'Invalid login credentials.';
      case 'account-exists-with-different-credential':
        return 'Account exists with different sign-in method.';
      case 'requires-recent-login':
        return 'Please login again and try.';
      default:
        return 'Something went wrong. Please try again.';
    }
  }
}
