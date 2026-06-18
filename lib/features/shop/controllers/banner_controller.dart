import 'package:cartify/common/widgets/login_singup/loaders/loader.dart';
import 'package:cartify/common/widgets/login_singup/loaders/network_manager.dart';
import 'package:cartify/data/repositories/banner_repository.dart';
import 'package:cartify/features/shop/models/banner_model.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  // Variable
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchBanners();
  }

  // Update page navigtion dots
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  //fetch Banner
  /// Load categories from Firestore
  Future<void> fetchBanners() async {
    try {
      isLoading.value = true;

      final isConnected = await NetworkManager.instance.isConnected();
      if (isConnected) {
        // Fetch all Banners
        final bannerRepo = Get.put(BannerRepository());
        final banners = await bannerRepo.fetchBanners();

        //Assign Banners
        this.banners.assignAll(banners);

        
      }
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  
}
