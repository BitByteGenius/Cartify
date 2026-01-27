import 'package:cartify/common/styles/shadows.dart';
import 'package:cartify/common/widgets/icons/t_circular_icon.dart';
import 'package:cartify/common/widgets/image_text_widgets/product_price_text.dart';
import 'package:cartify/common/widgets/rounded_container.dart';
import 'package:cartify/common/widgets/images/t_rounded_image.dart';
import 'package:cartify/common/widgets/texts/product_title_text.dart';
import 'package:cartify/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/constants/image_string.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    // container with side padding, color, edge, radius and shadow
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [
            TShadowStyle.verticalProductShadow
          ],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkerGrey: TColors.white,
        ),
        child: Column(
          children: [
            //Thumbnail, wishlist Button, Discount Tag
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  //---Thubnail Image----
                  TRoundedImage(imageUrl: TImage.productImage1, applyImageRadius: true,),
      
                  //---Sale Tag---
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: TColors.black),
                    ),
                  )),
      
                  //--- Favourite Icon Button---
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(icon: Iconsax.heart5,color: Colors.red))
                ],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems / 2),
      
            //---Details---------
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  const TProductTitleText(title: 'Green Nike Air Shoes', smallSize: true),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  TBrandTitleWithVerifiedIcon(
                    title: 'Nike'
                  ),
              ],
            ),
            ),

             // Todo: Add Spacer () here to keep the height of each Box same in case 1 or 2 lines of headings

              const Spacer(),
                   //Price Row-----
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //----Price----
                      const TProductPriceText(price: '35.0'),

                      // Add to Cart Button---------------------
                       Container(decoration: BoxDecoration(
                        color: TColors.dark,
                        borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.cardRadiusMd),
                        bottomRight:Radius.circular(TSizes.productImageRadius),
                       ),
                       ),
                       child: SizedBox(
                        width: TSizes.iconLg * 1.2,
                        height: TSizes.iconLg * 1.2,
                        child: Center(
                          child: Icon (Iconsax.add, color: TColors.white))),
                       ),
                    ],
                  )
          ],
        ),
      ),
    );
  }
}

