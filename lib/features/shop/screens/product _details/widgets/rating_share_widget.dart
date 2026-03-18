import 'package:cartify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TRatingAndShare extends StatelessWidget {
  const TRatingAndShare({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // --- Rating ---
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(
              Iconsax.star5,
              color: Colors.amber,
              size: 24,
            ),
    
            const SizedBox(
              width: TSizes.spaceBtwItems / 2,
            ),
    
            Text.rich(
              TextSpan(
                text: '5.0',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge,
                children: const [
                  TextSpan(
                    text: ' (1999)',
                  ),
                ],
              ),
            ),
          ],
        ),
        //--- Share Icon ---
    IconButton(
      onPressed: () {},
      icon: const Icon(
        Icons.share, size: TSizes.iconMd,
      ),
    )
      ],
    );
  }
}
