import 'package:cartify/common/widgets/appbar/appbar.dart';
import 'package:cartify/common/widgets/images/t_circular_image.dart';
import 'package:cartify/common/widgets/texts/section_heading.dart';
import 'package:cartify/features/personalization/controllers/user_controller.dart';
import 'package:cartify/features/personalization/screens/profile/widgets/change_name.dart';
import 'package:cartify/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:cartify/utils/constants/image_string.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/popups/shimmer-effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Profile')),
      //-----Body-----
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //Proofile Picture-----
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx((){
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty? networkImage : TImage.user;
                      return controller.imageUploading.value
                        ?const TShimmerEffect(width: 80, height: 80)
                        : TCircularImage(
                        image: image,
                        width: 80,
                        height: 80,
                        isNetworkImage: networkImage.isNotEmpty,
                      );
                      }
                    ),
                    TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),
              //Details Section-----
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                title: 'Name',
                value: controller.user.value.fullName,
                onPressed:() => Get.to(() => const ChangeName()),
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: 'Username',
                value: controller.user.value.username,
                onPressed: () {},
              ),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              // ----Heading Personal Info-----
              const TSectionHeading(
                title: 'Personal Information',
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                title: 'User Id',
                value: controller.user.value.id,
                icon: Iconsax.copy,
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: 'E- Email',
                value: controller.user.value.email,
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: 'Phone Number',
                value: controller.user.value.phoneNumber,
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(title: 'Gender', value: 'Male', onPressed: () {}),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(
                title: 'Date of Birth',
                value: '19 Dec, 2002',
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Delete Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
