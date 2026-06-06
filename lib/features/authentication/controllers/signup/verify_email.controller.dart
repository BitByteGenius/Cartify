import 'dart:async';

import 'package:cartify/common/widgets/login_singup/loaders/loader.dart';
import 'package:cartify/common/widgets/succes_screen/success_screen.dart';
import 'package:cartify/data/repositories.autentication/authentication.repo.dart';
import 'package:cartify/utils/constants/image_string.dart';
import 'package:cartify/utils/constants/text_string.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  Timer? _verificationTimer;
  Timer? _resendTimer;

  final canResendEmail = true.obs;
  final resendCountdown = 60.obs;

  @override
  void onInit() {
    super.onInit();

    sendEmailVerification();

    _startVerificationChecker();
  }

  @override
  void onClose() {
    _verificationTimer?.cancel();
    _resendTimer?.cancel();
    super.onClose();
  }

  Future<void> sendEmailVerification() async {
    if (!canResendEmail.value) return;

    try {
      canResendEmail.value = false;
      resendCountdown.value = 60;

      await AuthenticationRepo.instance.sendEmailVerification();

      TLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'Verification link sent to your email.',
      );

      _startResendCountdown();
    } catch (e) {
      canResendEmail.value = true;

      TLoaders.errorSnackBar(
        title: 'Error',
        message: e.toString(),
      );
    }
  }

  void _startResendCountdown() {
    _resendTimer?.cancel();

    _resendTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (resendCountdown.value <= 1) {
          timer.cancel();

          resendCountdown.value = 0;
          canResendEmail.value = true;
        } else {
          resendCountdown.value--;
        }
      },
    );
  }

  void _startVerificationChecker() {
    _verificationTimer?.cancel();

    _verificationTimer = Timer.periodic(
      const Duration(seconds: 3),
      (timer) async {
        try {
          await FirebaseAuth.instance.currentUser?.reload();

          final user = FirebaseAuth.instance.currentUser;

          if (user != null && user.emailVerified) {
            timer.cancel();

            Get.offAll(
              () => SuccessScreen(
                image: TImage.successfulPaymentIcon,
                title: TTexts.yourAccountCreatedTitle,
                subTitle: TTexts.yourAccountCreatedSubTitle,
                onPressed: () =>
                    AuthenticationRepo.instance.screenRedirect(),
              ),
            );
          }
        } catch (_) {}
      },
    );
  }

  Future<void> checkEmailVerificationStatus() async {
    try {
      await FirebaseAuth.instance.currentUser?.reload();

      final user = FirebaseAuth.instance.currentUser;

      if (user != null && user.emailVerified) {
        Get.offAll(
          () => SuccessScreen(
            image: TImage.successfulPaymentIcon,
            title: TTexts.yourAccountCreatedTitle,
            subTitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () =>
                AuthenticationRepo.instance.screenRedirect(),
          ),
        );
      } else {
        TLoaders.warningSnackBar(
          title: 'Not Verified',
          message: 'Please verify your email first.',
        );
      }
    } catch (e) {
      TLoaders.errorSnackBar(
        title: 'Error',
        message: e.toString(),
      );
    }
  }
}