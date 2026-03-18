import 'package:cartify/common/widgets/appbar/appbar.dart';
import 'package:cartify/common/widgets/images/t_circular_image.dart';
import 'package:cartify/common/widgets/texts/section_heading.dart';
import 'package:cartify/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:cartify/utils/constants/image_string.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Profile',
        ),
      ),
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
                    const TCircularImage(image: TImage.user, width: 80, height: 80),
                    TextButton(onPressed: (){}, child: const Text('Change Profile Picture')),
                  ],
                ),
              ),
              //Details Section-----
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),
              const TSectionHeading(title: 'Profile Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(title: 'Name', value: 'Rahul singh', onPressed: (){},),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(title: 'Username', value: 'Gulshan_Singh', onPressed: (){},),


              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              // ----Heading Personal Info-----
              const TSectionHeading(title: 'Personal Information', showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(title: 'User Id', value: '45689', icon: Iconsax.copy, onPressed: (){}),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(title: 'E- Email', value: 'Coding_600251', onPressed: (){}),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(title: 'Phone Number', value: '+6002515672', onPressed: (){}),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(title: 'Gender', value: 'Male', onPressed: (){}),
              const SizedBox(height: TSizes.spaceBtwItems),
              TProfileMenu(title: 'Date of Birth', value: '19 Dec, 2002', onPressed: (){}),
              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(onPressed: (){}, 
                child: const Text('Delete Account', style: TextStyle(color: Colors.red),)),
              )

            ],
          ),
        ),
      ),
    );
  }
}

