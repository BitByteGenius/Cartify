class TValidator {
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
      return 'password is required';
    }
    // check for minimum pasword length
    if (value.length < 6) {
      return 'password must be at least 6 characters long.';
    }
    //check for upper case
    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'password must contain at least one uppercase letter';
    }
    // check for numbers
    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'password must contain at least  one number.';
    }

    // Check for Special characters
    if (!value.contains(RegExp(r'[!@$%^&*(),./:{}<>]'))) {
      return 'password must contains at least one special characters.';
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }

    // Regular expression for phone number validation (assuming a 10 digit number)

    final phoneRegExp = RegExp(r'^\d{10}$');
    if (!phoneRegExp.hasMatch(value)) {
      return 'Invalid phone number format (10 digits required).';
    }
    return null;
  }
}
