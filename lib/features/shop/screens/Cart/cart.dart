import 'package:cartify/common/widgets/appbar/appbar.dart';
import 'package:cartify/features/shop/screens/Cart/widgets/cart_items.dart';
import 'package:cartify/features/shop/screens/checkout/checkout.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true,
        title: Text('Cart', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Padding(padding: 
      const EdgeInsets.all(TSizes.defaultSpace),

      //-----Cart items----
      child: TCartItems(),
       ),
       

       //--- Checkout Button----

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(()=> const CheckoutScreen()), 
        child: const Text('Checkout ₹ 256.0')),
      ),
    );
  }
}

