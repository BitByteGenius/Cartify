import 'package:cartify/common/widgets/login_singup/loaders/loader.dart';
import 'package:cartify/common/widgets/login_singup/loaders/network_manager.dart';
import 'package:cartify/data/repositories/category_repository.dart';
import 'package:cartify/features/shop/models/category_model.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  // Observables
  final isLoading = false.obs;

  final  _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCategories();
  }

  /// Load categories from Firestore
  Future<void> fetchCategories() async {
    try {
      isLoading.value = true;

      final isConnected = await NetworkManager.instance.isConnected();
      if (isConnected) {
        // Fetch all categories
        final categories = await _categoryRepository.getAllCategories();
        //Update category list
        allCategories.assignAll(categories);

        // Filter featured categories
        featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId == null).take(8).toList());
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  /// Get subcategories for a given parent category ID
  List<CategoryModel> getSubCategories(String parentId) {
    return allCategories.where((cat) => cat.parentId == parentId).toList();
  }
}
