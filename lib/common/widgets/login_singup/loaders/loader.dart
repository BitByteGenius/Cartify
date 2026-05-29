import 'package:cartify/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TLoaders {
  /// Hide current snackbar
  static void hideSnackBar() {
    ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();
  }

  /// Custom Toast (Modern UI)
  static void customToast({required String message}) {
    final size = MediaQuery.of(Get.context!).size;

    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 3),
        backgroundColor: Colors.transparent,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.symmetric(
          horizontal: size.width * 0.05,
          vertical: size.height * 0.02,
        ),
        content: Container(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.04,
            vertical: size.height * 0.015,
          ),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.035,
            ),
          ),
        ),
      ),
    );
  }

  /// Warning Snackbar
  static void warningSnackBar({
    required String title,
    String message = '',
  }) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      colorText: TColors.white,
      backgroundColor: Colors.orange,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      duration: const Duration(seconds: 3),
      icon: const Icon(Iconsax.warning_2, color: TColors.white),
    );
  }

  /// Success Snackbar
  static void successSnackBar({
    required String title,
    String message = '',
    int duration = 3,
  }) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      colorText: TColors.white,
      backgroundColor: TColors.primary,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      duration: Duration(seconds: duration),
      icon: const Icon(Iconsax.check, color: TColors.white),
    );
  }

  /// Error Snackbar
  static void errorSnackBar({
    required String title,
    String message = '',
  }) {
    Get.snackbar(
      title,
      message,
      isDismissible: true,
      colorText: TColors.white,
      backgroundColor: Colors.red.shade600,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      duration: const Duration(seconds: 3),
      icon: const Icon(Iconsax.warning_2, color: TColors.white),
    );
  }
}