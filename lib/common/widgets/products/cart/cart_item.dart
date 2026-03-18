import 'package:cartify/common/widgets/images/t_rounded_image.dart';
import 'package:cartify/common/widgets/texts/product_title_text.dart';
import 'package:cartify/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/constants/image_string.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Image
        TRoundedImage(imageUrl: TImage.productImage1,
        width: 60,
        height: 60,
        padding: EdgeInsets.all(TSizes.sm),
        backgroundColor: THelperFunction.isDarkMode(context) ? TColors.darkGrey : TColors.light,),
        const SizedBox(width: TSizes.spaceBtwItems,),
    
        // Title, Price, And Size.
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TBrandTitleWithVerifiedIcon(title: 'Nike'),
              const Flexible(child: TProductTitleText(title: 'Black Sport Shoes', maxLines: 1,)),
              //Attributes
              Text.rich(
                TextSpan(children: [
                  TextSpan(text: 'Color', style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: 'Green', style: Theme.of(context).textTheme.bodyLarge),
                  TextSpan(text: 'Size', style: Theme.of(context).textTheme.bodySmall),
                  TextSpan(text: '09', style: Theme.of(context).textTheme.bodyLarge),
                ])
              )
            ],
          ),
        )
      ],
    );
  }
}