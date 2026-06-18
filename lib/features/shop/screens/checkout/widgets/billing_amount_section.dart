import 'package:cartify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key});

 @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      //----SubTotal-----
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
          Text('\$256', style: Theme.of(context).textTheme.bodyMedium),
        ],
      ),
      const SizedBox(height: TSizes.spaceBtwItems / 2),

      //---Shiping free-----
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
          Text('\$256', style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
      const SizedBox(height: TSizes.spaceBtwItems / 2),
      //----order Total---
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
          Text('\$256', style: Theme.of(context).textTheme.titleMedium),
        ],
      ),
      const SizedBox(height: TSizes.spaceBtwItems / 2),
      ],
    );
  }
}