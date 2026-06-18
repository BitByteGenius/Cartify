import 'package:cartify/common/widgets/appbar/appbar.dart';
import 'package:cartify/common/widgets/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:cartify/common/widgets/icons/t_circular_icon.dart';
import 'package:cartify/common/widgets/images/t_rounded_image.dart';
import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/constants/image_string.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
   final dark = THelperFunction.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            // -----Main Lagrge Image----
            SizedBox(height: 400, child: Padding(
              padding: EdgeInsets.all(TSizes.productImageRadius *2),
            child: Image(image: AssetImage(TImage.productImage1))),
            ),
            // Image Slider Indicators----
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                separatorBuilder: (_,_) => const SizedBox(width: TSizes.spaceBtwItems,),
                itemCount: 4,
                itemBuilder: (_, index) => TRoundedImage(
                    width: 80,
                    backgroundColor: dark ? TColors.dark : TColors.white,
                    border: Border.all(color: TColors.primary),
                    padding: const EdgeInsets.all(TSizes.sm),
                    imageUrl: TImage.productImage3,
                    ), 
                ),
              ),
            ),
            //----AppBar Icons----
            const TAppBar(
              showBackArrow: true,
              action: [
                TCircularIcon(icon: Iconsax.heart5, color: Colors.red),
              ],
            )
          ],
        ),
      ),
    );
  }
}