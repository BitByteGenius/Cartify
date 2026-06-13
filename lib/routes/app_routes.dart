import 'package:cartify/features/authentication/screens/Onboarding/onboarding.dart';
import 'package:cartify/features/authentication/screens/login/login.dart';
import 'package:cartify/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:cartify/features/authentication/screens/signup/signup.dart';
import 'package:cartify/features/authentication/screens/signup/verify_email.dart';
import 'package:cartify/features/personalization/screens/address/widgets/address.dart';
import 'package:cartify/features/personalization/screens/profile/widgets/profile.dart';
import 'package:cartify/features/personalization/screens/settings/settings.dart';
import 'package:cartify/features/shop/screens/Cart/cart.dart';
import 'package:cartify/features/shop/screens/checkout/checkout.dart';
import 'package:cartify/features/shop/screens/home/widgets/home.dart';
import 'package:cartify/features/shop/screens/order/order.dart';
import 'package:cartify/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:cartify/features/shop/screens/store/store.dart';
import 'package:cartify/features/shop/screens/wishlist/wishlist.dart';
import 'package:cartify/routes/routes.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: TRoutes.home, page: () => const HomeScreen()),
    GetPage(name: TRoutes.store, page: () => const StoreScreen()),
    GetPage(name: TRoutes.favourites, page: () => const FavouriteScreen()),
    GetPage(name: TRoutes.settings, page: () => const SettingsScreen()),
    GetPage(name: TRoutes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: TRoutes.order, page: () => const OrderScreen()),
    GetPage(name: TRoutes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: TRoutes.cart, page: () => const CartScreen()),
    GetPage(name: TRoutes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: TRoutes.userAddress, page: () => const UserAddressScreen()),
    GetPage(name: TRoutes.signup, page: () => const SignupScreen()),
    GetPage(name: TRoutes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: TRoutes.signIn, page: () => const LoginScreen()),
    GetPage(name: TRoutes.forgetPassword, page: () => const ForgetPassword()),
    GetPage(name: TRoutes.onboarding, page: () => const OnboardingScreen()),
    // Add more GetPage entries as needed
  ];
}