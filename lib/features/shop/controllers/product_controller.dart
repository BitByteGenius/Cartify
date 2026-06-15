import 'package:cartify/common/widgets/login_singup/loaders/loader.dart';
import 'package:cartify/data/repositories/product_repository.dart';
import 'package:cartify/features/shop/models/product_model.dart';
import 'package:cartify/utils/constants/enums.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFeaturedProducts();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      //Fetch product
      final products = await productRepository.getFeaturedProducts();

      //assign products
      featuredProducts.assignAll(products);
    } catch (e) {
      TLoaders.warningSnackBar(title: 'OhSnap', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  //Get the product price or price range
  /* String getProductPrice(ProductModel product) {
    double smallestprice = double.infinity;
    double largestprice = 0.0;

    // If no variation exist return the simple price or sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else{

      //Calculate the smallest and largest price from the product variations
      for (var variation in product.productVariations!) {
        //Determine the price to use (sale price or regular price)
        double priceToConsider = variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price;

        //Update the smallest and largest price accordingly
        if (priceToConsider < smallestprice) {
          smallestprice = priceToConsider;
        }
        if (priceToConsider > largestprice) {
          largestprice = priceToConsider;
        }
      }
      // If smallest and largest price are the same, return that price
      if (smallestprice.isEqual((largestprice))) {
        return largestprice.toString();
      } else {
        // Return the price range
        return '$smallestprice - \$largestprice';
      }
    }
  }*/
  /// Get the product price or price range
  String getProductPrice(ProductModel product) {
    double smallestprice = double.infinity;
    double largestprice = 0.0;

    // If no variations exist, return the sale price if available,
    // otherwise return the regular price.
    if (product.productType == ProductType.single.toString()) {
      return ((product.salePrice ?? 0) > 0 ? product.salePrice! : product.price)
          .toString();
    } else {
      // Calculate the smallest and largest price from the product variations
      for (var variation in product.productVariations!) {
        // Determine which price to use (sale price or regular price)
        double priceToConsider = variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price;

        // Update the smallest price
        if (priceToConsider < smallestprice) {
          smallestprice = priceToConsider;
        }

        // Update the largest price
        if (priceToConsider > largestprice) {
          largestprice = priceToConsider;
        }
      }

      // If both prices are the same, return a single price
      if (smallestprice == largestprice) {
        return largestprice.toString();
      } else {
        // Return the price range
        return '$smallestprice - $largestprice';
      }
    }
  }

  //--- Calculate the discount percentage for a product
  String? calculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0.0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  // --- Check Product Stock Availability
  String getProductStockStatus(int stock){
    return stock > 0 ?'In Stock' : 'Out of Stock';
  }
}
