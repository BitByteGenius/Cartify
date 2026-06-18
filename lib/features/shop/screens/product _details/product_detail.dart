import 'package:cartify/common/widgets/texts/section_heading.dart';
import 'package:cartify/features/shop/models/product_model.dart';
import 'package:cartify/features/shop/screens/product%20_details/widgets/attribute_widget.dart';
import 'package:cartify/features/shop/screens/product%20_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:cartify/features/shop/screens/product%20_details/widgets/product_attributes.dart';
import 'package:cartify/features/shop/screens/product%20_details/widgets/product_detail_image_slider.dart';
import 'package:cartify/features/shop/screens/product%20_details/widgets/product_meta_data.dart';
import 'package:cartify/features/shop/screens/product%20_details/widgets/rating_share_widget.dart';
import 'package:cartify/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:cartify/utils/constants/sizes.dart';
//import 'package:cartify/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    //final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: TBottonAddToCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // ----1 Product Image Slider----
            TProductImageSlider(),

            //----2 Product Dtails---
            Padding(
              padding: EdgeInsets.only(
                right: TSizes.defaultSpace,
                left: TSizes.defaultSpace,
                bottom: TSizes.defaultSpace,
              ),
              child: Column(
                children: [
                  //----Rating and share--
                  TRatingAndShare(),

                  //---Price, Tittle Stocks, And Brand---
                  TProductMetaData(),

                  //--- Attributes---
                  TProductAttributes(),

                  //----Colors and sizes
                  TColorsSizes(),

                  //----Checkout Button----
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text('Chekout'),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  //--Description
                  const TSectionHeading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const ReadMoreText(
                    'This is a Product descriptin for blue Nike Sleeve vest. There are more things that can be added but i am only addded this',
                    trimLines: 2,
                    trimCollapsedText: 'Show more',
                    trimMode: TrimMode.Line,
                    trimExpandedText: 'Less',
                    moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                    lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),

                  // ---Reviews---
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const TSectionHeading(
                        title: 'Reviews (199)',
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () =>
                            Get.to(() => const ProductReviewsScreen()),
                        icon: const Icon(Iconsax.arrow_right_3),
                      ),
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
