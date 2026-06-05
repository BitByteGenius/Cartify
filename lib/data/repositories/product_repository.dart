import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cartify/features/shop/models/product_model.dart';
import 'package:get/get.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('products')
          .where('featured', isEqualTo: true)
          .where('status', isEqualTo: 'active')
          .limit(10)
          .get();
      return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    } catch (e) {
      throw 'Something went wrong while fetching products. Please try again.';
    }
  }

  /// Get all active products
  Future<List<ProductModel>> getAllProducts() async {
    try {
      final snapshot = await _db
          .collection('products')
          .where('status', isEqualTo: 'active')
          .get();
      return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }

  /// Get products based on Category ID
  Future<List<ProductModel>> getProductsForCategory(String categoryId) async {
    try {
      final snapshot = await _db
          .collection('products')
          .where('categoryId', isEqualTo: categoryId)
          .where('status', isEqualTo: 'active')
          .get();
      return snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)).toList();
    } catch (e) {
      throw 'Something went wrong while fetching category products. Please try again.';
    }
  }

  /// Get products by matching specific product IDs (for Cart & Wishlist sync)
  Future<List<ProductModel>> getProductsByIds(List<String> productIds) async {
    try {
      if (productIds.isEmpty) return [];
      
      // Firestore 'whereIn' queries are capped at 10 items. Splitting queries if needed.
      List<ProductModel> products = [];
      for (var i = 0; i < productIds.length; i += 10) {
        final chunk = productIds.sublist(i, i + 10 > productIds.length ? productIds.length : i + 10);
        final snapshot = await _db
            .collection('products')
            .where(FieldPath.documentId, whereIn: chunk)
            .get();
        products.addAll(snapshot.docs.map((doc) => ProductModel.fromSnapshot(doc)));
      }
      return products;
    } catch (e) {
      throw 'Something went wrong while fetching products. Please try again.';
    }
  }

  /// Search products by keyword (title query)
  Future<List<ProductModel>> searchProducts(String query) async {
    try {
      final searchResult = await _db
          .collection('products')
          .where('status', isEqualTo: 'active')
          .get();
      
      // Perform client side title search for case insensitivity/partial matches
      final lowercaseQuery = query.toLowerCase();
      return searchResult.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .where((p) => p.title.toLowerCase().contains(lowercaseQuery))
          .toList();
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
}
