import 'package:cartify/common/widgets/appbar/appbar.dart';
import 'package:cartify/common/widgets/icons/t_circular_icon.dart';
import 'package:cartify/common/widgets/layouts/grid_layout.dart';
import 'package:cartify/common/widgets/products/products_cards/product_card_vertical.dart';
import 'package:cartify/features/shop/screens/home/widgets/home.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: TAppBar(
      title: Text('Wishlist', style: Theme.of(context).textTheme.headlineMedium),
      action: [
        TCircularIcon(icon: Iconsax.add, onPressed: () => Get.to(const HomeScreen()),)
      ],
    ),
    body: SingleChildScrollView(
      child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
      child: Column(children: [
        TGridLayout(itemCount: 4, itemBuilder: (_, index)=> const TProductCardVertical()),
      ],),)
    ),
    );
  }
}