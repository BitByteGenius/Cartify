import 'package:cartify/common/widgets/images/t_circular_image.dart';
import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/constants/image_string.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({
    super.key,
   required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: const TCircularImage(
        image: TImage.user,
        width: 50,
        height: 50,
        padding: 0,
      ),
    
      title: Text(
        'Rahul Singh',
        style: theme.textTheme.headlineSmall
            ?.copyWith(color: TColors.white),
      ),
    
      subtitle: Text(
        'rahulsingh.resume@gmail.com',
        style: theme.textTheme.bodyMedium
            ?.copyWith(color: TColors.white),
      ),
    
      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Iconsax.edit,
          color: TColors.white,
        ),
      ),
    );
  }
}
