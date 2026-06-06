/*import 'package:cartify/common/widgets/succes_screen/success_screen.dart';
import 'package:cartify/features/authentication/screens/login/login.dart';
import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/constants/image_string.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/constants/text_string.dart';
import 'package:cartify/utils/helpers/helper_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: TColors.appSurface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.offAll(() => const LoginScreen()), icon: const Icon(CupertinoIcons.clear),),
        ],
      ),
      body: SingleChildScrollView(
        //Padding to give default equal space on all sides in all screen
        child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            //Image
           Image(image:AssetImage(TImage.deliveredEmailIllustration),width: THelperFunction.screenWidth()*0.6),
           const SizedBox(height: TSizes.spaceBtwSections),

           //Tittle & SubTitle
           Text(TTexts.confirmEmailTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
           const SizedBox(height: TSizes.spaceBtwItems),
           Text('rahulsingh.resume02@gmail.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
           const SizedBox(height: TSizes.spaceBtwItems),
           Text(TTexts.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
           const SizedBox(height: TSizes.spaceBtwSections),           
           // Buttons
           SizedBox(width: double.infinity, child: 
           ElevatedButton(onPressed: ()=> Get.to(() => SuccessScreen(
            image: TImage.staticSuccesIllustration,
            title: TTexts.yourAccountCreatedTitle,
            subTitle: TTexts.yourAccountCreatedSubTitle,
            onPressed: () => Get.to(() => const LoginScreen()),
           )), child: const Text(TTexts.tcontinue))),
           const SizedBox(height: TSizes.spaceBtwItems),
           SizedBox(width: double.infinity, child: TextButton(onPressed: (){}, child: const Text(TTexts.resendEmail))),
           const SizedBox(height: TSizes.spaceBtwItems),
           
          ],
        ),
        ),
      ),
    );
  }
}*/

import 'package:cartify/data/repositories.autentication/authentication.repo.dart';
import 'package:cartify/features/authentication/controllers/signup/verify_email.controller.dart';
import 'package:cartify/utils/constants/image_string.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/constants/text_string.dart';
import 'package:cartify/utils/helpers/helper_function.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatefulWidget {
  const VerifyEmailScreen({super.key, this.email});
  final String? email;

  @override
  State<VerifyEmailScreen> createState() => _VerifyEmailScreenState();
}

class _VerifyEmailScreenState extends State<VerifyEmailScreen> {
  final user = FirebaseAuth.instance.currentUser;

 
 

  @override
  Widget build(BuildContext context) {
    final controller = Get.put( VerifyEmailController());
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
  IconButton(
    onPressed: () async {
      await AuthenticationRepo.instance.logout();
    },
    icon: const Icon(CupertinoIcons.clear),
  ),
],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // IMAGE
              Image(
                image: AssetImage(TImage.deliveredEmailIllustration),
                width: THelperFunction.screenWidth() * 0.6,
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              // TITLE
              Text(
                TTexts.confirmEmailTitle,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: TSizes.spaceBtwItems),

              // EMAIL DISPLAY (FIXED)
              Text(
  widget.email ?? user?.email ?? '',
  style: Theme.of(context).textTheme.labelLarge,
  textAlign: TextAlign.center,
),

              const SizedBox(height: TSizes.spaceBtwItems),

              // SUBTITLE
              Text(
                TTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: TSizes.spaceBtwSections),

              // CONTINUE BUTTON
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                 onPressed: () => controller.checkEmailVerificationStatus(),
                  child: const Text(TTexts.tcontinue),
                ),
              ),

              const SizedBox(height: TSizes.spaceBtwItems),

              // RESEND EMAIL
             Obx(
  () => SizedBox(
    width: double.infinity,
    child: TextButton(
      onPressed: controller.canResendEmail.value
          ? controller.sendEmailVerification
          : null,
      child: Text(
        controller.canResendEmail.value
            ? 'Resend Email'
            : 'Resend in ${controller.resendCountdown.value}s',
      ),
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
