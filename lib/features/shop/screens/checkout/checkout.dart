import 'package:cartify/common/widgets/appbar/appbar.dart';
import 'package:cartify/common/widgets/products/cart/coupon_widget.dart';
import 'package:cartify/common/widgets/rounded_container.dart';
import 'package:cartify/common/widgets/succes_screen/success_screen.dart';
import 'package:cartify/features/shop/screens/Cart/widgets/cart_items.dart';
import 'package:cartify/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:cartify/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:cartify/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:cartify/navigation_menu.dart';
import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/constants/image_string.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(showBackArrow: true,
        title: Text('Order Review', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            //-----Items in Cart-----
            TCartItems(showAddRemoveButtons: false),
            SizedBox(height: TSizes.spaceBtwSections,),

            //---- Coupon TextFields---
            TCouponCode(), 
            const SizedBox(height: TSizes.spaceBtwSections),

            //------Billing Section--------
            TRoundedContainer(
              showBorder: true,
              padding: const EdgeInsets.all(TSizes.md),
              backgroundColor: dark? TColors.black : TColors.white,
              child: Column(
                children: [
                  //---PRICING----  
                  TBillingAmountSection(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  //---Divider-----
                  const Divider(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  //----Payment Method----
                  TBillingPaymentSection(),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  //----Address----
                  TBillingAddressSection()
                ],
              ),
            )
          ],
        ),),
      ),
      //----Checkout Button---
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(()=> SuccessScreen( 
          image: TImage.successfulPaymentIcon,
          title: 'Payment Succes!',
          subTitle: 'Your item will be shipped soon',
          onPressed: () => Get.offAll(() => const NavigationMenu()),
        ),
      ),
      child: const Text('Checkout  2560.'),
    ),
      ),
    );
  }
}

