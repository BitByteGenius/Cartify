import 'package:cartify/common/widgets/appbar/appbar.dart';
import 'package:cartify/common/widgets/appbar/tabbar.dart';
import 'package:cartify/common/widgets/brands/brand_card.dart';
import 'package:cartify/common/widgets/custom_shapes/container/search_container.dart';
import 'package:cartify/common/widgets/layouts/grid_layout.dart';
import 'package:cartify/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:cartify/common/widgets/texts/section_heading.dart';
import 'package:cartify/features/shop/controllers/category_controller.dart';
import 'package:cartify/features/shop/screens/store/category_tab.dart';
import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        // -------- App Bar --------
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          action: [
            TCartCounterIcon(
              onPressed: () {
                // Navigate to cart
              },
            ),
          ],
        ),

        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                expandedHeight: 440,
                backgroundColor: THelperFunction.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,

                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      // -------- Search Bar --------
                      const SizedBox(height: TSizes.spaceBtwItems),

                      TSearchContainer(
                        text: 'Search in store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),

                      const SizedBox(height: TSizes.spaceBtwSections),

                      // -------- Featured Brands --------
                      TSectionHeading(
                        title: 'Featured Brands',
                        onPressed: () {},
                      ),

                      const SizedBox(height: TSizes.spaceBtwItems / 1.5),

                      // -------- Brands Grid --------
                      TGridLayout(
                        itemCount: 4,
                        mainAxisExtent: 80,
                        itemBuilder: (_, index) {
                          return const TBrandCard(showBorder: false);
                        },
                      ),
                    ],
                  ),
                ),

                // -------- Tabs --------
                bottom: TTabBar(
                  tabs: categories
                      .map((category) => Tab(text: category.name))
                      .toList(),
                ),
              ),
            ];
          },

          // --------Body --------
          body: TabBarView(
            children: categories
                .map((category) => TCategoryTab(category: category))
                .toList(),
          ),
        ),
      ),
    );
  }
}
