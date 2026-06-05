import 'package:get/get.dart';
import 'package:admin_panel/src/pages/dashboard_page.dart';
import 'package:admin_panel/src/pages/users_page.dart';
import 'package:admin_panel/src/pages/products_page.dart';
import 'package:admin_panel/src/pages/orders_page.dart';
import 'package:admin_panel/src/pages/categories_page.dart';
import 'package:admin_panel/src/pages/brands_page.dart';
import 'package:admin_panel/src/pages/banners_page.dart';
import 'package:admin_panel/src/pages/settings_page.dart';

class AppRoutes {
  static const String dashboard = '/dashboard';
  static const String users = '/users';
  static const String products = '/products';
  static const String orders = '/orders';
  static const String categories = '/categories';
  static const String brands = '/brands';
  static const String banners = '/banners';
  static const String settings = '/settings';

  static List<GetPage<dynamic>> pages = [
    GetPage(name: dashboard, page: () => const DashboardPage()),
    GetPage(name: users, page: () => const UsersPage()),
    GetPage(name: products, page: () => const ProductsPage()),
    GetPage(name: orders, page: () => const OrdersPage()),
    GetPage(name: categories, page: () => const CategoriesPage()),
    GetPage(name: brands, page: () => const BrandsPage()),
    GetPage(name: banners, page: () => const BannersPage()),
    GetPage(name: settings, page: () => const SettingsPage()),
  ];
}
