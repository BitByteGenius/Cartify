import 'package:cartify/common/widgets/login_singup/loaders/network_manager.dart';
import 'package:cartify/data/repositories/product_repository.dart';
import 'package:cartify/features/shop/models/product_model.dart';
import 'package:cartify/utils/local_storage/hive_storage.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  // Observables
  final isLoading = false.obs;
  final featuredProducts = <ProductModel>[].obs;
  final allProducts = <ProductModel>[].obs;
  final searchResults = <ProductModel>[].obs;

  final ProductRepository _productRepo = Get.put(ProductRepository());

  @override
  void onInit() {
    super.onInit();
    loadFeaturedProducts();
  }

  /// Load featured products with offline fallback
  Future<void> loadFeaturedProducts() async {
    try {
      isLoading.value = true;

      // 1. Try reading from Hive local storage first (Offline Support)
      final localData = THiveStorage.getCachedProducts();
      if (localData.isNotEmpty) {
        featuredProducts.assignAll(
          localData.map((json) => ProductModel.fromJson(json, json['id'] ?? '')).toList(),
        );
      }

      // 2. If online, fetch fresh products from Firestore and update cache
      final isConnected = await NetworkManager.instance.isConnected();
      if (isConnected) {
        final products = await _productRepo.getFeaturedProducts();
        featuredProducts.assignAll(products);

        // Save fresh data to Hive
        final productsJson = products.map((p) {
          final json = p.toJson();
          json['id'] = p.id;
          return json;
        }).toList();
        await THiveStorage.saveCachedProducts(productsJson);
      }
    } catch (e) {
      // Keep using cached products if fetch fails
    } finally {
      isLoading.value = false;
    }
  }

  /// Fetch all products for shop list
  Future<void> fetchAllProducts() async {
    try {
      isLoading.value = true;
      final isConnected = await NetworkManager.instance.isConnected();
      if (isConnected) {
        final products = await _productRepo.getAllProducts();
        allProducts.assignAll(products);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  /// Fetch products for specific category
  Future<List<ProductModel>> fetchCategoryProducts(String categoryId) async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (isConnected) {
        return await _productRepo.getProductsForCategory(categoryId);
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  /// Perform case-insensitive search
  Future<void> performSearch(String query) async {
    try {
      isLoading.value = true;
      if (query.isEmpty) {
        searchResults.clear();
        return;
      }
      
      final isConnected = await NetworkManager.instance.isConnected();
      if (isConnected) {
        final results = await _productRepo.searchProducts(query);
        searchResults.assignAll(results);
      }
    } catch (e) {
      searchResults.clear();
    } finally {
      isLoading.value = false;
    }
  }
}
