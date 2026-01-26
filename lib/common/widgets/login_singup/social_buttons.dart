import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/constants/image_string.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TSocialButtons extends StatelessWidget {
  const TSocialButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(onPressed: (){},
           icon: const Image(
            width: TSizes.iconMd,
            height: TSizes.iconMd,
            image: AssetImage(TImage.google),
           )
           ),
        ),
        const SizedBox( width: TSizes.spaceBtwItems),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: TColors.grey),
            borderRadius: BorderRadius.circular(100)
          ),
          child: IconButton(onPressed: (){},
           icon: const Image(
            width: TSizes.iconMd,
            height: TSizes.iconMd,
            image: AssetImage(TImage.facebook),
           )
           ),
        ),
       ],
    );
  }
}

