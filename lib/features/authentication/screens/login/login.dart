import 'package:cartify/common/styles/spacing_styles.dart';
import 'package:cartify/common/widgets/form_divider.dart';
import 'package:cartify/common/widgets/social_buttons.dart';
import 'package:cartify/features/authentication/screens/login/widgets/login_form.dart';
import 'package:cartify/features/authentication/screens/login/widgets/login_header.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/constants/text_string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyles.paddingWithAppBarHeight,
          child: Column(
            children: [
              //LOgo, Tittle & Sub Tittle
              TLoginHeader(),
              //Form
              TLoginForm(),
              // Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(height: TSizes.spaceBtwSections),
              //Footer
              TSocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}

