import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/brands_controller.dart';
import '../models/brand.dart';

class BrandsPage extends StatelessWidget {
  const BrandsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final BrandsController ctrl = Get.put(BrandsController());
    return Scaffold(
      appBar: AppBar(title: const Text('Brands')),
      floatingActionButton: FloatingActionButton(
        onPressed: ctrl.openAddBrandDialog,
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        if (ctrl.isLoading.value) return const Center(child: CircularProgressIndicator());
        if (ctrl.brands.isEmpty) return const Center(child: Text('No brands found'));
        return ListView.builder(
          itemCount: ctrl.brands.length,
          itemBuilder: (context, index) {
            final BrandModel brand = ctrl.brands[index];
            return ListTile(
              leading: brand.logoUrl != null ? Image.network(brand.logoUrl!, width: 48, height: 48, fit: BoxFit.cover) : const Icon(Icons.store),
              title: Text(brand.name),
              subtitle: Text('Order: ${brand.order} • ${brand.visibility ? "Visible" : "Hidden"}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: const Icon(Icons.edit), onPressed: () => ctrl.openEditBrandDialog(brand)),
                  IconButton(icon: const Icon(Icons.delete), onPressed: () => ctrl.deleteBrand(brand.id)),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
