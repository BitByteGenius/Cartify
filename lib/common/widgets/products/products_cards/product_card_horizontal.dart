import 'package:cartify/common/widgets/image_text_widgets/product_price_text.dart';
import 'package:cartify/common/widgets/images/t_rounded_image.dart';
import 'package:cartify/common/widgets/rounded_container.dart';
import 'package:cartify/common/widgets/texts/product_title_text.dart';
import 'package:cartify/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/constants/image_string.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(TSizes.productImageRadius),
        color: dark ? TColors.darkerGrey : TColors.lightContainer,
      ),
      child: Row(
        children: [
          //--- Thumbnail---
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(TSizes.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: const Stack(
              children: [
                // ----Thumnail Image----------
                SizedBox(
                  height: 120,
                  width: 120,
                  child: TRoundedImage(imageUrl:TImage.productImage1, applyImageRadius: true,))
              ],
            ),
          ),
         // Details----
         SizedBox(
         width: 172,
         child: Padding(
           padding: EdgeInsets.only(top: TSizes.sm, left: TSizes.sm),
           child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TProductTitleText(title: 'Green Nike Half Sleeves Shirt', smallSize: true,),
                  SizedBox(height: TSizes.spaceBtwItems / 2),
                  TBrandTitleWithVerifiedIcon(title: 'Nike'),
                ],
              ),

              const Spacer(),
           
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //----Pricing---
                 const Flexible(child: TProductPriceText(price: '256.0')),

                  // Add to cart---
                  Container(
                    decoration: const BoxDecoration(
                      color: TColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.cardRadiusMd),
                        bottomRight: Radius.circular(TSizes.productImageRadius),
                      ),
                    ),
                    child: const SizedBox(
                      width: TSizes.iconLg * 1.2,
                      height: TSizes.iconLg * 1.2,
                      child: Center(child: Icon(Iconsax.add, color: TColors.white)),
                    ),
                  )
                ],
              )
            ],
           ),
         ),
         )
        ],
      ),
    );
  }
}
