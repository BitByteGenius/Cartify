import 'package:cartify/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/device/device_utility.dart';
import 'package:cartify/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';


class OnBoardingNextButton extends StatelessWidget {
  const OnBoardingNextButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Positioned(
      right: TSizes.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          backgroundColor: dark ? TColors.primary : Colors.black,
        ),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}
