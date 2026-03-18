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
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          child: Column(
            children: [
              // Tittle, Price, and Stock Status
              Row(
                children: [
                  TSectionHeading(title: 'Variation', showActionButton: false),
                  SizedBox(width: TSizes.spaceBtwItems),
                ],
              ),
               TProductTitleText(title: 'Price :', smallSize: true),
              Row(
                children: [
                  // Actual Price
                  Text(
                    '\$25',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.apply(decoration: TextDecoration.lineThrough),
                  ),
                  
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
