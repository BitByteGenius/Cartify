import 'package:cartify/common/widgets/shimmers/category_shimers.dart';
import 'package:cartify/features/shop/controllers/category_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});


  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if (categoryController.isLoading.value) return const TCategoryShimmer();

      if (categoryController.featuredCategories.isEmpty {
        return  Center(child: Text('No categories available',
         style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)),);
      }
      return SizedBox(
        height: 80,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: categoryController.featuredCategories.length,
          separatorBuilder: (_, __) => const SizedBox(width: TSizes.spaceBtwItems),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, __) {
            final category = categoryController.featuredCategories[index];
            return TVerticaImageText(image: category.image, title: category.name, 
            onTap: () => Get.to(() => const SubCategoriesScreen()));
          },
        ),
      )
    );
  
  }
    );
}
}