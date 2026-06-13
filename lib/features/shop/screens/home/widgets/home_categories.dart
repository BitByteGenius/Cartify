import 'package:cartify/common/widgets/shimmers/category_shimers.dart';
import 'package:cartify/features/shop/controllers/category_controller.dart';
import 'package:cartify/features/shop/screens/sub_category/sub_categories.dart';
import 'package:cartify/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      // Loading
      if (categoryController.isLoading.value) {
        return const TCategoryShimmer();
      }

      // Empty Categories
      if (categoryController.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            'No categories available',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }

      // Categories List
      return SizedBox(
        height: 80,
        child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: categoryController.featuredCategories.length,
          separatorBuilder: (_, _) =>
              const SizedBox(width: TSizes.spaceBtwItems),
          itemBuilder: (_, index) {
            final category =
                categoryController.featuredCategories[index];

            return TVerticaImageText(
              image: category.image,
              title: category.name,
              onTap: () => Get.to(
                () => const SubCategoriesScreen(),
              ),
            );
          },
        ),
      );
    });
  }
}