import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({super.key,
  required this.icon,
  this.width,
  this.height,
  this.size = TSizes.lg,
  this.onprssed,
  this.color,
  this.backgroundColor,
  });

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onprssed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor != null
        ? backgroundColor!
        :THelperFunction.isDarkMode(context)
            ? TColors.black.withOpacity(0.9)
            : TColors.white.withOpacity(0.9),
      ),
      child: IconButton(onPressed: onprssed, icon: Icon(icon, color:color, size: size,)),
    );
  }
}
