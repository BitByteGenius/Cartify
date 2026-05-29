import 'package:cartify/common/widgets/login_singup/loaders/animation_loader.dart';
import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: THelperFunction.isDarkMode(Get.context!)
              ? TColors.dark
              : TColors.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 250),
              TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  // stop the current loading dailog
  //This method doesn't return anything
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
