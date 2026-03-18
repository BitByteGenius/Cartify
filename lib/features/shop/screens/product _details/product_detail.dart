import 'package:cartify/features/shop/screens/product%20_details/widgets/product_attributes.dart';
import 'package:cartify/features/shop/screens/product%20_details/widgets/product_detail_image_slider.dart';
import 'package:cartify/features/shop/screens/product%20_details/widgets/product_meta_data.dart';
import 'package:cartify/features/shop/screens/product%20_details/widgets/rating_share_widget.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
         children: [
          // ----1 Product Image Slider----
          TProductImageSlider(),

          //----2 Product Dtails---
          Padding(
            padding: EdgeInsets.only(right: TSizes.defaultSpace, left: TSizes.defaultSpace, bottom: TSizes.defaultSpace),
            child: Column(
              children: [
                //----Rating and share--
                TRatingAndShare(),

                //---Price, Tittle Stocks, And Brand---
                TProductMetaData(),

                //--- Attributes---
                TProductAttributes()
              ],
            ),
            )
         ],
        ),
      ),
    );
  }
}

