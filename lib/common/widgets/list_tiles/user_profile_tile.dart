import 'package:cartify/common/widgets/images/t_circular_image.dart';
import 'package:cartify/features/personalization/controllers/user_controller.dart';
import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/constants/image_string.dart';
import 'package:cartify/utils/popups/shimmer-effect.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TUserProfileTile extends StatelessWidget {
  const TUserProfileTile({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final theme = Theme.of(context);

    return ListTile(
      leading: 
      Obx((){
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty? networkImage : TImage.user;
                      return controller.imageUploading.value
                        ?const TShimmerEffect(width: 80, height: 80)
                        : TCircularImage(
                        image: image,
                        width: 50,
                        height: 50,
                        padding: 0,
                        isNetworkImage: networkImage.isNotEmpty,
                      );
                      }
                    ),

      title: Text(
        controller.user.value.fullName,
        style: theme.textTheme.headlineSmall?.copyWith(color: TColors.white),
      ),

      subtitle: Text(
        controller.user.value.email,
        style: theme.textTheme.bodyMedium?.copyWith(color: TColors.white),
      ),

      trailing: IconButton(
        onPressed: onPressed,
        icon: const Icon(Iconsax.edit, color: TColors.white),
      ),
    );
  }
}
