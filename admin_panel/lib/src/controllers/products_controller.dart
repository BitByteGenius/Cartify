import 'package:get/get.dart';
import '../models/product.dart';
import '../repositories/product_repository.dart';

class ProductsController extends GetxController {
  var isLoading = true.obs;
  var products = <ProductModel>[].obs;
  final ProductRepository _repo = ProductRepository();

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  void loadProducts() async {
    isLoading.value = true;
    final list = await _repo.getAll();
    products.assignAll(list);
    isLoading.value = false;
  }

  void openAddProductDialog() {
    // TODO: show a dialog/form for adding a product (not implemented yet)
  }

  void openEditProductDialog(ProductModel product) {
    // TODO: show a dialog/form for editing the product (not implemented yet)
  }

  void deleteProduct(String id) async {
    await _repo.delete(id);
    loadProducts();
  }
}
