class TValidator {

  // Empty text validation
 static String? validationEmptyText(String fieldName, String? value) {
  if (value == null || value.trim().isEmpty) {
    return '$fieldName is required.';
  }
  return null; 
}

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    // Regular expression of email validation
    final emailRegExp = RegExp(r'^[\w\.-]+@([\w-]+\.)+[a-zA-Z]{2,}$');

    if (!emailRegExp.hasMatch(value)) {
      return 'Invalid Email address';
    }
    return null;
  }

  static String? validatePassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'Password is required';
  }

  if (value.length < 6) {
    return 'Password must be at least 6 characters';
  }

  if (!RegExp(r'[A-Z]').hasMatch(value)) {
    return 'Must include an uppercase letter';
  }

  if (!RegExp(r'[0-9]').hasMatch(value)) {
    return 'Must include a number';
  }

  if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
    return 'Must include a special character';
  }

  return null;
}

  static String? validatePhoneNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Phone number is required';
  }

  final phoneRegExp = RegExp(r'^[6-9]\d{9}$'); // Indian numbers

  if (!phoneRegExp.hasMatch(value)) {
    return 'Enter a valid 10-digit phone number';
  }

  return null;
}
}
