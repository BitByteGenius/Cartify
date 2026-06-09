import 'package:get/get.dart';
import '../models/brand.dart';
import '../repositories/brand_repository.dart';

class BrandsController extends GetxController {
  var isLoading = true.obs;
  var brands = <BrandModel>[].obs;
  final BrandRepository _repo = BrandRepository();

  @override
  void onInit() {
    super.onInit();
    loadBrands();
  }

  void loadBrands() async {
    isLoading.value = true;
    final list = await _repo.getAll();
    brands.assignAll(list);
    isLoading.value = false;
  }

  void openAddBrandDialog() {
  }

  void openEditBrandDialog(BrandModel brand) {
  }

  void deleteBrand(String id) async {
    await _repo.delete(id);
    loadBrands();
  }
}
