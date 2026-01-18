import 'package:cartify/features/authentication/screens/Onboarding/widget/onboarding_dot_navigation.dart';
import 'package:cartify/features/authentication/screens/Onboarding/widget/onboarding_next_button.dart';
import 'package:cartify/features/authentication/screens/Onboarding/widget/onboarding_page.dart';
import 'package:cartify/features/authentication/screens/Onboarding/widget/onboarding_skip.dart';
import 'package:cartify/utils/constants/image_string.dart';
import 'package:cartify/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:cartify/features/authentication/controllers.onboarding/onboarding_controller.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          //Horizontal Scrollable Pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImage.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImage.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImage.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          //Skip Button
          const OnBoardingSkip(),

          //Dot Navigation SmoothPageIndicator
          const OnBoardingDotNavigation(),

          //Circular Button
          OnBoardingNextButton(),
        ],
      ),
    );
  }
}

