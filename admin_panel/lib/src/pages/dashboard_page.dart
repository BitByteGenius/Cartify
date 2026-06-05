import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../routes.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Total Revenue: \$0', style: TextStyle(fontSize: 24)),
            SizedBox(height: 20),
            Text('Orders: 0', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.teal),
              child: Text('Admin Panel', style: TextStyle(color: Colors.white, fontSize: 24)),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () => Get.offAllNamed(AppRoutes.dashboard),
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Users'),
              onTap: () => Get.offAllNamed(AppRoutes.users),
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: const Text('Products'),
              onTap: () => Get.offAllNamed(AppRoutes.products),
            ),
            ListTile(
              leading: const Icon(Icons.receipt_long),
              title: const Text('Orders'),
              onTap: () => Get.offAllNamed(AppRoutes.orders),
            ),
            // Add other navigation items similarly
          ],
        ),
      ),
    );
  }
}
