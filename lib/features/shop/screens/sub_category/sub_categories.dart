import 'package:cartify/common/widgets/appbar/appbar.dart';
import 'package:cartify/common/widgets/images/t_rounded_image.dart';
import 'package:cartify/common/widgets/products/products_cards/product_card_horizontal.dart';
import 'package:cartify/common/widgets/texts/section_heading.dart';
import 'package:cartify/utils/constants/image_string.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Sports Shirts'), showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            //---Banner---
            TRoundedImage(imageUrl: TImage.promoBanner4, applyImageRadius: true, width: double.infinity,),
            SizedBox(height: TSizes.spaceBtwSections),

            //--- Sub- Categories-----
            Column(
              children: [
                //---Heading---
                TSectionHeading(title: 'Sports Shirt', onPressed: (){} ),
                const SizedBox(height: TSizes.spaceBtwSections / 2),

                SizedBox(
                  height: 120,
                  child: ListView.separated(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => const SizedBox(width: TSizes.spaceBtwItems),
                    itemBuilder: (context, index) => const TProductCardHorizontal(),
                  ),
                ),
              ],
            )
          ],
        ),
        ),
      ),
    );
  }
}