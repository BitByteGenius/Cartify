import 'package:cartify/common/widgets/brands/brand_card.dart';
import 'package:cartify/common/widgets/rounded_container.dart';
import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      padding: const EdgeInsets.all(TSizes.md),
      borderColor: TColors.darkGrey,
      backgroundColor: Colors.transparent,
      margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      child: Column(
        children: [
          // -------- Brand Header --------
          const TBrandCard(showBorder: false),

          const SizedBox(height: TSizes.spaceBtwItems),

          // -------- Top Products --------
          Row(
            //children: image.map((image) => brandTopProductImageWidget(image, context)).toList(),
            children: List.generate(
              3,
              (index) => Expanded(
                child: TRoundedContainer(
                  height: 100,
                  margin: EdgeInsets.only(right: index == 2 ? 0 : TSizes.md),
                  backgroundColor: THelperFunction.isDarkMode(context)
                      ? TColors.darkerGrey
                      : TColors.light,
                  child: Image(
                    fit: BoxFit.contain,
                    image: AssetImage(images[index]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  // Widget brandTopProductImageWidget(context, String image) {
  //return Expanded(
  // child: TRoundedContainer(
  //   height: 100,
 // padding: const EdgeInsets.all(TSizes.md),
  // margin: const EdgeInsects.only(right: TSizes.sm),
  //   backgroundColor: THelperFunction.isDarkMode(context)? TColors.darkerGrey
  //       : TColors.light,
  //   child: const Image(
  //     fit: BoxFit.contain,
  //     image: AssetImage(image),
  //   ),
  // ),
  //);
  //}
}
