import 'package:cartify/common/widgets/login_singup/loaders/network_manager.dart';
import 'package:cartify/data/repositories/category_repository.dart';
import 'package:cartify/features/shop/models/category_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  // Observables
  final isLoading = false.obs;
  final allCategories = <CategoryModel>[].obs;
  final featuredCategories = <CategoryModel>[].obs;

  final CategoryRepository _categoryRepo = Get.put(CategoryRepository());

  @override
  void onInit() {
    super.onInit();
    loadCategories();
  }

  /// Load categories from Firestore
  Future<void> loadCategories() async {
    try {
      isLoading.value = true;

      final isConnected = await NetworkManager.instance.isConnected();
      if (isConnected) {
        // Fetch all categories
        final categories = await _categoryRepo.getAllCategories();
        allCategories.assignAll(categories);

        // Filter featured categories
        final featured = categories
            .where((cat) => cat.isFeatured && cat.parentId == null)
            .toList();
        featuredCategories.assignAll(featured);
      }
    } catch (e) {
      Get.snackbar('Error', e.toString(), snackPosition: SnackPosition.BOTTOM);
    } finally {
      isLoading.value = false;
    }
  }

  /// Get subcategories for a given parent category ID
  List<CategoryModel> getSubCategories(String parentId) {
    return allCategories.where((cat) => cat.parentId == parentId).toList();
  }
}
