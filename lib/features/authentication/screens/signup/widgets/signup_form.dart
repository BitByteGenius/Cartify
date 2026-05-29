import 'package:cartify/features/authentication/controllers.onboarding/signup/signup_controller.dart';
import 'package:cartify/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/constants/text_string.dart';
import 'package:cartify/utils/validators/validation.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstname,
                  validator: (value) => TValidator.validationEmptyText('First name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.firstName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastName,
                  validator: (value) => TValidator.validationEmptyText('Last name', value),
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: TTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          //User name
          TextFormField(
            controller: controller.username,
            validator: (value) => TValidator.validationEmptyText('Username', value),
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          //Emails
          TextFormField(
            controller: controller.email,
            keyboardType: TextInputType.emailAddress, 
            validator: (value) => TValidator.validateEmail(value),
            //validator: (value) => TValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          //Phone Number
          TextFormField(
            controller: controller.phoneNumber,
             keyboardType: TextInputType.phone, 
             validator: (value) => TValidator.validatePhoneNumber(value),
            //validator: (value) => TValidator.validatePhoneNumber(value),
            expands: false,
            decoration: const InputDecoration(
              labelText: TTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          //password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword( value),
              obscureText: controller.hidePassword.value,
              decoration:  InputDecoration(
                labelText: TTexts.password,
                prefixIcon: Icon(Iconsax.password_check),
                suffixIcon: IconButton(onPressed: () => controller.hidePassword.value = !controller.hidePassword.value,
                 icon: Icon(controller.hidePassword.value? Iconsax.eye_slash : Iconsax.eye),),
              ),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),
          // Terms and Conditions Checkbox
          const TTermsAndConditionCheckbox(),
          const SizedBox(height: TSizes.spaceBtwSections),
          //sign up Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.signup(),
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
