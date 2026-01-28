import 'package:cartify/common/widgets/brands/brand_show_case.dart';
import 'package:cartify/common/widgets/layouts/grid_layout.dart';
import 'package:cartify/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:cartify/common/widgets/texts/section_heading.dart';
import 'package:cartify/utils/constants/image_string.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [ Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),

        child: Column(children: [
        //---Brand Showcase---
        const TBrandShowcase(images: [TImage.productImage1, TImage.productImage4,TImage.productImage3]),
        const TBrandShowcase(images: [TImage.productImage1, TImage.productImage4,TImage.productImage3]),
        const SizedBox(height: TSizes.spaceBtwItems),
        
        //---Products---
        TSectionHeading(title: 'You might Like', onPressed: (){}),
        const SizedBox(height: TSizes.spaceBtwItems),
        TGridLayout(itemCount: 4, itemBuilder: (_, index) => const TProductCardVertical()),
        const SizedBox(height: TSizes.spaceBtwSections,)
        ],),
      ),
      ],
    );
  }
}