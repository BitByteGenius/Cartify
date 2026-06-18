import 'package:cached_network_image/cached_network_image.dart';
import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/helpers/helper_function.dart';
import 'package:cartify/common/widgets/shimmers/shimmer-effect.dart';
import 'package:flutter/material.dart';

class TCircularImage extends StatelessWidget {
  const TCircularImage({
    super.key,
    this.width = 56,
    this.height = 56,
    this.overlayColor,
    this.backgroundColor,
    required this.image,
    this.fit = BoxFit.cover,
    this.padding = TSizes.sm,
    this.isNetworkImage = false,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? overlayColor;
  final Color? backgroundColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          // If image background color is null then switch it to light and dark mode color design.
          color: backgroundColor ?? (THelperFunction.isDarkMode(context) ? TColors.black : TColors.white),
          borderRadius: BorderRadius.circular(100),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Center(
            child: isNetworkImage
            ?CachedNetworkImage(imageUrl: image,
            fit: fit,
            color: overlayColor,
            progressIndicatorBuilder: (context,url,DownloadProgress) =>
            const TShimmerEffect(width: 55, height: 500),
            errorWidget: (context, url, error) => const Icon (Icons.error),
            )
            
            :Image(
              fit: fit,
              image: isNetworkImage ? NetworkImage(image) : AssetImage(image) as ImageProvider,
              color: overlayColor,
            ),
          ),
        ),
      ),
    );
  }
}