import 'package:cartify/common/widgets/images/t_circular_image.dart';
import 'package:cartify/common/widgets/rounded_container.dart';
import 'package:cartify/common/widgets/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/constants/enums.dart';
import 'package:cartify/utils/constants/image_string.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key, required this.showBorder,
    this.onTap,

  });

  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
  final isDarkMode = THelperFunction.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      // -------Brand Card Container-------
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            // -------Icon-------
            Flexible(
              child: TCircularImage(
                isNetworkImage: false,
                image: TImage.clothIcon,
                backgroundColor: Colors.transparent,
                overlayColor:
                    THelperFunction.isDarkMode(context)
                    ? TColors.white
                    : TColors.black,
              ),
            ),
            const SizedBox(width: TSizes.spaceBtwItems / 2),
    
            //Text-----------
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                   const TBrandTitleWithVerifiedIcon(
                  title: 'Nike',
                  brandTextSize: TextSizes.large),
                  Text(
                '256 Products',
                overflow: TextOverflow.ellipsis,
                style: Theme.of(
                  context,
                ).textTheme.labelMedium,
              ),
              ],
             ),
            ),
         ]
      ),
      )
    );
  }
}
