import 'package:cartify/common/widget.login_signup.dart/form_divider.dart';
import 'package:cartify/common/widget.login_signup.dart/social_buttons.dart';
import 'package:cartify/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Tittle
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              //Form
              const TSignupForm(),
              const SizedBox(height: TSizes.spaceBtwSections),
              //Divider
              TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),
              //Social Buttons
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}

