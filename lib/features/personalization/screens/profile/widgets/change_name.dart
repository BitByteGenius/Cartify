import 'package:cartify/common/widgets/appbar/appbar.dart';
import 'package:cartify/features/personalization/controllers/update_name_controller.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/constants/text_string.dart';
import 'package:cartify/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      // custom app bar
      appBar: TAppBar(showBackArrow: true, 
      title: Text('Change Name', style: Theme.of(context).textTheme.headlineSmall,),
      ),
      body: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Heading
          Text('Use real name for easy varification. This name will appear on several pages',
          style: Theme.of(context).textTheme.labelMedium,
          ),
           const SizedBox(height: TSizes.spaceBtwSections),

           Form(
              key: controller.updateUserNameFormKey,
            child: Column(
            children: [
              TextFormField(
                controller: controller.firstName,
                validator: (value) => TValidator.validationEmptyText('FirstName', value),
                expands: false,
                decoration: const InputDecoration(
                  labelText: TTexts.firstName,
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
           const SizedBox(height: TSizes.spaceBtwSections),
            Form(child: Column(
            children: [
              TextFormField(
                controller: controller.lastName,
                validator: (value) => TValidator.validationEmptyText('LastName', value),
                expands: false,
                decoration: const InputDecoration(
                  labelText: TTexts.lastName,
                  prefixIcon: Icon(Iconsax.user),
                ),
              ),
            const SizedBox(height: TSizes.spaceBtwSections),
             //save button
             SizedBox(
              width: double.infinity,
              child: ElevatedButton(
  onPressed: () => controller.updateUserName(),
  child: const Text('Save'),
)
             )
            ],
           ))
        ],
      ),
      ),
        ]
      )
      )
    );
  }
}
