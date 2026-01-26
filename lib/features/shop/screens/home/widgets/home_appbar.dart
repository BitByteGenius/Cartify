import 'package:cartify/common/widgets/appbar/appbar.dart';
import 'package:cartify/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/constants/text_string.dart';
import 'package:flutter/material.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(
              context,
            ).textTheme.labelMedium!.apply(color: TColors.white),
          ),
          Text(
            TTexts.homeAppbarSubTittle,
            style: Theme.of(context).textTheme.headlineSmall!
                .apply(color: TColors.white),
          ),
        ],
      ),
      action: [TCartCounterIcon(
        onPressed: (){}, iconColor: TColors.white,
      )],
    );
  }
}

