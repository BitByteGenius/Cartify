import 'package:cartify/common/widgets/chips/choice_chip.dart';
import 'package:cartify/common/widgets/texts/section_heading.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
class TColorsSizes extends StatelessWidget {
  const TColorsSizes({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
    children: [
     TSectionHeading(title: 'Size', showActionButton: false),
     const SizedBox(height: TSizes.spaceBtwItems /2),
     Wrap(
       spacing: 8,
       children: [
         TChoiceChip(text: '7', selected: true,onSelected: (value){}),
         TChoiceChip(text: '8', selected: false,onSelected: (value){}),
         TChoiceChip(text: '9', selected: false,onSelected: (value){}),
         TChoiceChip(text: '7', selected: false,onSelected: (value){}),
         TChoiceChip(text: '8', selected: false,onSelected: (value){}),
         TChoiceChip(text: '9', selected: false,onSelected: (value){}),
       ],
     )
    ],
          );
  }
}
