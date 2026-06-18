import 'package:cartify/common/widgets/login_singup/loaders/animation_loader.dart';
import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TFullScreenLoader {
  static void openLoadingDialog(
    String text,
   // String animation,
  ) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Scaffold(
          backgroundColor: THelperFunction.isDarkMode(Get.context!)
              ? TColors.dark
              : TColors.white,
          body: SafeArea(
            child: Center(
              child: TAnimationLoaderWidget(
                text: text,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static void stopLoading() {
    if (Get.overlayContext != null &&
        Navigator.of(Get.overlayContext!).canPop()) {
      Navigator.of(Get.overlayContext!).pop();
    }
  }
}