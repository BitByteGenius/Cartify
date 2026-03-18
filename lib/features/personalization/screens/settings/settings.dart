import 'package:cartify/common/widgets/appbar/appbar.dart';
import 'package:cartify/common/widgets/custom_shapes/container/primary_header_container.dart';
import 'package:cartify/common/widgets/list_tiles/settings_menu_tile.dart';
import 'package:cartify/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:cartify/common/widgets/texts/section_heading.dart';
import 'package:cartify/features/personalization/screens/address/widgets/address.dart';
import 'package:cartify/features/personalization/screens/profile/widgets/profile.dart';
import 'package:cartify/features/shop/screens/order/order.dart';
import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
  body: ListView(
    children: [
      //---- Header ----
       TPrimaryHeaderContainer(
          child: Column(
            children: [
              /// AppBar
              TAppBar(
                title: Text(
                  'Account',
                  style: theme.textTheme.headlineMedium
                      ?.copyWith(color: TColors.white),
                ),
              ),

              //const SizedBox(height: TSizes.spaceBtwSections),

              //---- User Profile Card ----
                TUserProfileTile(
               onPressed: () => Get.to(() => const ProfileScreen())),
              

              const SizedBox(height: TSizes.spaceBtwSections),
            ],
          ),
        ),

      //------ Body -------
      Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            //--- Account Setting tile
            const TSectionHeading(
              title: 'Account Settings',
              showActionButton: false,
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            TSettingsMenuTile(
              icon: Iconsax.safe_home,
              title: 'My Addresses',
              subTittle: 'Set shopping delivery address',
               onTap: () => Get.to(() => const UserAddressScreen()),
            ),

            const TSettingsMenuTile(
              icon: Iconsax.shopping_cart,
              title: 'My Cart',
              subTittle: 'Add, remove product and move to checkout',
            ),

            TSettingsMenuTile(
              icon: Iconsax.bag_tick,
              title: 'My Orders',
              subTittle: 'View your order history',
              onTap: () => Get.to(() => const OrderScreen()),
            ),

            const TSettingsMenuTile(
              icon: Iconsax.bank,
              title: 'Bank Account',
              subTittle: 'Manage your bank account',
            ),

            const TSettingsMenuTile(
              icon: Iconsax.discount_shape,
              title: 'My Coupons',
              subTittle: 'List all discounted coupons',
            ),

            const TSettingsMenuTile(
              icon: Iconsax.notification,
              title: 'Notification',
              subTittle: 'Manage notification settings',
            ),

            const TSettingsMenuTile(
              icon: Iconsax.notification,
              title: 'Account Privacy',
              subTittle: 'Manage your account privacy settings',
            ),

            //---- App Settings ----
            const SizedBox(height: TSizes.spaceBtwSections),

            const TSectionHeading(
              title: 'App Settings',
              showActionButton: false,
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            TSettingsMenuTile(
              icon: Iconsax.document_upload,
              title: 'Load Data',
              subTittle: 'Upload data from server',
              onTap: () => Get.to(() => const UserAddressScreen()),
            ),

            TSettingsMenuTile(
              icon: Iconsax.location,
              title: 'Geolocation',
              subTittle: 'Set recommendation based on location',
              trailing: Switch(value: true, onChanged: (_) {}),
            ),

            TSettingsMenuTile(
              icon: Iconsax.security_user,
              title: 'Safe Mode',
              subTittle: 'Safe search for all ages',
              trailing: Switch(value: false, onChanged: (_) {}),
            ),

            TSettingsMenuTile(
              icon: Iconsax.image,
              title: 'HD Image Quality',
              subTittle: 'Set image quality',
              trailing: Switch(value: false, onChanged: (_) {}),
            ),

            //---- Logout ----
            const SizedBox(height: TSizes.spaceBtwSections),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {},
                child: const Text('Log out'),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwSections * 2.5),
          ],
        ),
      ),
    ],
  ),
);

  }
}

