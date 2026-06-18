


import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/common/widgets/shimmers/shimmer-effect.dart';
import 'package:flutter/material.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90, // Increased slightly to prevent layout overflow bugs
      child: ListView.separated(
        // Removed shrinkWrap for better scroll performance
        itemCount: itemCount,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (_, _) => const SizedBox(width: TSizes.spaceBtwItems),
        itemBuilder: (_, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image Placeholder
              TShimmerEffect(width: 55, height: 55, radius: 55),
              SizedBox(height: TSizes.spaceBtwItems / 2),
              
              /// Text Placeholder
              TShimmerEffect(width: 55, height: 8),
            ],
          );
        },
      ),
    );
  }
}