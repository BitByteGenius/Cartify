import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';


//-----OnBoarding Page-----
class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.image, required this.title, required this.subTitle,});

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            alignment: AlignmentGeometry.topCenter,
            width: THelperFunction.screenHeight() * 0.8,
            height: THelperFunction.screenWidth() * 0.6,
            image: AssetImage(image),
          ),
          Text(
            title,style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(
            subTitle, style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}