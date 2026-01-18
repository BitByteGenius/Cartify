
import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/constants/text_string.dart';
import 'package:cartify/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class TTermsAndConditionCheckbox extends StatelessWidget {
  const TTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
   final dark = THelperFunction.isDarkMode(context);
    return Row(
      children: [
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(value: true, onChanged: (Value) {}),
        ),
        const SizedBox(width: TSizes.spaceBtwItems),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${TTexts.isAgreeTo} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(text: '${TTexts.privacyPolicy} ',style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? TColors.white : TColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? TColors.white : TColors.primary,
              )),
              TextSpan(
                text: '${TTexts.and} ',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(text: TTexts.termsOfUse ,style: Theme.of(context).textTheme.bodyMedium!.apply(
                color: dark ? TColors.white : TColors.primary,
                decoration: TextDecoration.underline,
                decorationColor: dark ? TColors.white : TColors.primary,
              )),
              
            ],
          ),
          
        ),
      ],
    );
  }
}
