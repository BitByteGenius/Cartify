import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cartify/features/shop/models/category_model.dart';
import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db
          .collection('categories')
          .where('isActive', isEqualTo: true)
          .get();
      return snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
    } catch (e) {
      throw 'Something went wrong while fetching categories. Please try again.';
    }
  }

  /// Get featured categories
  Future<List<CategoryModel>> getFeaturedCategories() async {
    try {
      final snapshot = await _db
          .collection('categories')
          .where('isActive', isEqualTo: true)
          .where('isFeatured', isEqualTo: true)
          .limit(8)
          .get();
      return snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
    } catch (e) {
      throw 'Something went wrong while fetching featured categories. Please try again.';
    }
  }

  /// Get subcategories for a specific parent category
  Future<List<CategoryModel>> getSubCategories(String parentId) async {
    try {
      final snapshot = await _db
          .collection('categories')
          .where('isActive', isEqualTo: true)
          .where('parentId', isEqualTo: parentId)
          .get();
      return snapshot.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
    } catch (e) {
      throw 'Something went wrong while fetching subcategories. Please try again.';
    }
  }
}
