import 'package:cartify/common/widgets/image_text_widgets/product_price_text.dart';
import 'package:cartify/common/widgets/images/t_circular_image.dart';
import 'package:cartify/common/widgets/rounded_container.dart';
import 'package:cartify/common/widgets/texts/product_title_text.dart';
import 'package:cartify/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/constants/enums.dart';
import 'package:cartify/utils/constants/image_string.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({
    super.key,
  });

  

  @override
  Widget build(BuildContext context) {
    final darkMode = THelperFunction.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// -- Sale Tag
              TRoundedContainer(
                backgroundColor: TColors.secondary.withValues(alpha: 0.8),
                radius: TSizes.sm,
                padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                child: Text('25%',
                    style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black)),
              ),
              const SizedBox(width: TSizes.spaceBtwItems),
              
              //---Price---
              Text("250", style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
              const SizedBox(width: TSizes.spaceBtwItems),
              const TProductPriceText(price: '175', isLarge: true),
          ]
        ),
            // Tittle
            const TProductTitleText(title: 'Green Nike Sport Shirt'),
            const SizedBox(height: TSizes.spaceBtwItems / 1.5),

            //--- Stock Status----
            Row(
              children: [
                const TProductTitleText(title: 'status'),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
              ],
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 1.5),

        /// Brand
        Row(
          children: [
            TCircularImage(
              image: TImage.shoeIcon,
              width: 32,
              height: 32,
              overlayColor: darkMode ? TColors.white : TColors.black,
            ),
            TBrandTitleWithVerifiedIcon(title: 'Nike', brandTextSize: TextSizes.medium),
            
          ],
        ),
      ]
    );
  }
}