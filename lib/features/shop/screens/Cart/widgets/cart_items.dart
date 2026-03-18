import 'package:cartify/common/widgets/image_text_widgets/product_price_text.dart';
import 'package:cartify/common/widgets/products/cart/add_remove_button.dart';
import 'package:cartify/common/widgets/products/cart/cart_item.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showAddRemoveButtons = true,});

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) =>
          const SizedBox(height: TSizes.spaceBtwSections),
      itemCount: 5,
      itemBuilder: (_, index) => Column(
        children: [
          //----cart items---
          TCartItem(),
         if (showAddRemoveButtons) const SizedBox(height: TSizes.spaceBtwItems),
          
            //----Add Remove Buttons with tool price----

           if (showAddRemoveButtons) 
          Row(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 70),
                  TProductQualityWithAddRemoveButton(),
                ],
              ),
              TProductPriceText(price: '256'),
            ],
          ),
        ],
      ),
    );
  }
}
