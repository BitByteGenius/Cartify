import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.blue,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(
        color: Colors.blue,
      ),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  // Dark Elevated Button Theme

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: Colors.black,
      foregroundColor: Colors.blue,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      side: const BorderSide(
        color: Colors.blue,
      ),
      padding: const EdgeInsets.symmetric(vertical: 18),
      textStyle: const TextStyle(
        fontSize: 16,
        color: Colors.white,
        fontWeight: FontWeight.w600,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
