import 'package:cartify/common/widgets/products/ratings/rating_indicator.dart';
import 'package:cartify/common/widgets/rounded_container.dart';
import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/constants/image_string.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:cartify/utils/helpers/helper_function.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [

                const CircleAvatar(backgroundImage: AssetImage(TImage.userProfieImage1)),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text('Rahul Singh', style: Theme.of(context).textTheme.titleLarge),
              ],
            ),
            IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        //---- Reviews----
        Row(
          children: [
            const TRtingBarIndicator(rating: 4),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text('01 Nov, 2023', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems),

        ReadMoreText(
          'The user interface of the app is quit intuitive. I was able to nevigate and make purchases seamlessly. Great job!',
        trimLines: 1,
        trimMode: TrimMode.Line,
        trimExpandedText: 'Show less',
        trimCollapsedText: 'Show more',
        moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: TColors.primary),
        lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        
        //--Company Reviews-----
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey: TColors.light,
          child: Padding(padding: const EdgeInsets.all(TSizes.md),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Certify Store", style: Theme.of(context).textTheme.titleMedium),
                  Text("02 Nov, 2023", style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              
        ReadMoreText('The user interface of the app is quit intuitive. I was able to nevigate and make purchases seamlessly. Great job!',
        trimLines: 1,
        trimMode: TrimMode.Line,
        trimExpandedText: 'Show less',
        trimCollapsedText: 'Show more',
        moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: TColors.primary),
        lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: TColors.primary),
        ),
            ],
          ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
      ],
    );
  }
}
