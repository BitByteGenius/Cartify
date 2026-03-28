import 'package:cartify/common/widgets/chips/choice_chip.dart';
import 'package:cartify/common/widgets/image_text_widgets/product_price_text.dart';
import 'package:cartify/common/widgets/rounded_container.dart';
import 'package:cartify/common/widgets/texts/product_title_text.dart';
import 'package:cartify/common/widgets/texts/section_heading.dart';
import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      children: [
        //--- Selected Attributes Pricing & Description
        TRoundedContainer(
          padding: EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Column(
            children: [
              // Tittle, Price, and Stock Status
              Row(
                children: [
                  TSectionHeading(title: 'Variation', showActionButton: false),
                  SizedBox(width: TSizes.spaceBtwItems),
            

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const TProductTitleText(title: 'Price :', smallSize: true),
                      // Actual Price
                      Text(
                        '25',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.apply(decoration: TextDecoration.lineThrough),
                      ),
                      const SizedBox(width: TSizes.spaceBtwItems),
                  
                      // Sale Price---
                      const TProductPriceText(price: '20')
                    ],
                  ),
                  // Stock---
              Row(
              children: [
                const TProductTitleText(title: 'Stock', smallSize: true),
                SizedBox(width: TSizes.spaceBtwItems,),
                Text('In stock', style: Theme.of(context).textTheme.titleMedium),
              ],
              ),
                ],
              ),
              
         ]
          ),
          // Variation Description---
          const TProductTitleText(
            title: 'This is the description of the products and it can go up to max to 4 lines.',
          smallSize: true,
          maxLines: 4,
          ),
      ],
       ),
        ),
      const SizedBox(height: TSizes.spaceBtwItems),

      //-----Attributes----

      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       children: [
        TSectionHeading(title: 'Colors', showActionButton: false,),
        const SizedBox(height: TSizes.spaceBtwItems /2),
        Wrap(
          spacing: 8,
          children: [
            TChoiceChip(text: 'Red', selected: true, onSelected: (value){},),
            TChoiceChip(text: 'White', selected: false, onSelected: (value){}),
            TChoiceChip(text: 'Black', selected: false, onSelected: (value){}),
          ],
        )
       ],
      ),


       //TColorsSizes()
      ],
    );
  }
}

