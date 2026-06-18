import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/products_controller.dart';
import '../models/product.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialise controller lazily
    final ProductsController controller = Get.put(ProductsController());
    return Scaffold(
      appBar: AppBar(title: const Text('Products')),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.openAddProductDialog,
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.products.isEmpty) {
          return const Center(child: Text('No products found'));
        }
        return ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final ProductModel p = controller.products[index];
            return ListTile(
              leading: p.thumbnailUrl != null
                  ? Image.network(p.thumbnailUrl!, width: 48, height: 48, fit: BoxFit.cover)
                  : const Icon(Icons.image_not_supported),
              title: Text(p.title),
              subtitle: Text('₹${p.price.toStringAsFixed(2)}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(icon: const Icon(Icons.edit), onPressed: () => controller.openEditProductDialog(p)),
                  IconButton(icon: const Icon(Icons.delete), onPressed: () => controller.deleteProduct(p.id)),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
