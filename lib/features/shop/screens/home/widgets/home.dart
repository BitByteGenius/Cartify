import 'package:cartify/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:cartify/common/widgets/custom_shapes/container/search_container.dart';
import 'package:cartify/common/widgets/layouts/grid_layout.dart';
import 'package:cartify/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:cartify/common/widgets/texts/section_heading.dart';
import 'package:cartify/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:cartify/features/shop/screens/home/widgets/home_categories.dart';
import 'package:cartify/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:cartify/utils/constants/image_string.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header --
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  // Appbar----
                  THomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  // -----SearchBar
                  TSearchContainer(text: 'Search in store'),
                  SizedBox(height: TSizes.spaceBtwSections),

                  

                  //-------CAtegories------
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        //Heading---------------
                        TSectionHeading(
                          title: 'Popular Categories',
                          showActionButton: false, textColor: Colors.white,
                        ),
                        const SizedBox(height: TSizes.spaceBtwItems),

                        // Categories-------
                        THomeCategories(),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Banner Body----
            Padding(
              padding: const EdgeInsetsGeometry.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(
                    banner: [
                      TImage.promoBanner1,
                      TImage.promoBanner2,
                      TImage.promoBanner3,
                    ],
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),

                  // Heading-----
                  TSectionHeading(title: 'Popular Products', onPressed: () {} ),
                  SizedBox(height: TSizes.spaceBtwItems),

                  //---------Popular Products----------
                  TGridLayout( itemCount: 2, itemBuilder: (_, index) => const
                  TProductCardVertical()
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

