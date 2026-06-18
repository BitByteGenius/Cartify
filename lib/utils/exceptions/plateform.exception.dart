
class TPlatformException implements Exception {
  final String code;

  TPlatformException(this.code);

  String get message {
    switch (code) {
      case 'network_error':
        return 'No internet connection. Please try again.';
      case 'sign_in_failed':
        return 'Sign-in failed. Please try again.';
      case 'sign_in_canceled':
        return 'Sign-in cancelled by user.';
      case 'invalid_credentials':
        return 'Invalid credentials provided.';
      case 'timeout':
        return 'Request timed out. Try again.';
      default:
        return 'An unexpected platform error occurred.';
    }
  }
}