import 'package:cartify/common/widgets/layouts/grid_layout.dart';
import 'package:cartify/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TShortableProducts extends StatelessWidget {
  const TShortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      // Dropdown--------
      DropdownButtonFormField(
        decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
      onChanged: (Value){},
      items: ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity']
      .map((option)=> DropdownMenuItem(value: option, child: Text(option)))
      .toList(),
      ),
      const SizedBox(height: TSizes.spaceBtwSections),
      //Products
      TGridLayout(itemCount: 8, itemBuilder: (_, index) => const TProductCardVertical())
      ],
    );
  }
}