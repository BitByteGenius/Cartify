import 'package:cartify/utils/constants/colors.dart';
import 'package:cartify/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TAnimationLoaderWidget extends StatelessWidget {
  const TAnimationLoaderWidget({
    super.key,
    required this.text,
    this.showAction = false,
    this.actionText,
    this.onActionPressed,
  });

  final String text;
  final bool showAction;
  final String? actionText;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CartifyLoader(),

            const SizedBox(height: TSizes.spaceBtwItems),

            Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            if (showAction)
              SizedBox(
                width: 250,
                child: OutlinedButton(
                  onPressed: onActionPressed,
                  style: OutlinedButton.styleFrom(
                    backgroundColor: TColors.dark,
                  ),
                  child: Text(
                    actionText ?? 'Retry',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(color: TColors.light),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  static void stopLoading() {
    if (Get.overlayContext != null &&
        Navigator.of(Get.overlayContext!).canPop()) {
      Navigator.of(Get.overlayContext!).pop();
    }
  }
}


//=========Loader===========
class CartifyLoader extends StatefulWidget {
  const CartifyLoader({super.key});

  @override
  State<CartifyLoader> createState() => _CartifyLoaderState();
}

class _CartifyLoaderState extends State<CartifyLoader>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _pulseController;

  @override
  void initState() {
    super.initState();

    _rotationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final loaderSize = size.width < 600 ? 90.0 : 120.0;

    return SizedBox(
      width: loaderSize,
      height: loaderSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: _pulseController,
            builder: (context, child) {
              return Container(
                width: loaderSize *
                    (0.85 + (_pulseController.value * 0.15)),
                height: loaderSize *
                    (0.85 + (_pulseController.value * 0.15)),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Theme.of(
                      context,
                    ).primaryColor.withValues(
                      alpha: 0.2 + (_pulseController.value * 0.3),
                    ),
                    width: 3,
                  ),
                ),
              );
            },
          ),

          RotationTransition(
            turns: _rotationController,
            child: Container(
              width: loaderSize,
              height: loaderSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                  width: 4,
                ),
              ),
            ),
          ),

          Container(
            width: loaderSize * 0.55,
            height: loaderSize * 0.55,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(
                    context,
                  ).primaryColor.withValues(alpha: 0.3),
                  blurRadius: 20,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: const Icon(
              Icons.shopping_bag_rounded,
              color: Colors.white,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}