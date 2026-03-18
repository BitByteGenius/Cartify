import 'package:cartify/common/widgets/icons/t_circular_icon.dart';
import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductQualityWithAddRemoveButton extends StatelessWidget {
  const TProductQualityWithAddRemoveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(icon: Iconsax.minus,
        width: 32,
        height: 32,
        size: TSizes.md,
        color: THelperFunction.isDarkMode(context) ? TColors.white : TColors.black,
        backgroundColor: THelperFunction.isDarkMode(context) ? TColors.darkerGrey : TColors.light,
        ),
    const SizedBox(width: TSizes.spaceBtwItems,),
    Text('2', style: Theme.of(context).textTheme.titleSmall),
    const SizedBox(width: TSizes.spaceBtwItems,),
    
    TCircularIcon(icon: Iconsax.minus,
    width: 32,
    height: 32,
    size: TSizes.md,
    color:  TColors.white ,
    backgroundColor:  TColors.primary,
    ),
      ],
                );
  }
}

