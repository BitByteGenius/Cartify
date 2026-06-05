import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'product_controller.dart';

class TSearchController extends GetxController {
  static TSearchController get instance => Get.find();

  // Search Text Controller
  final searchText = TextEditingController();

  // Observables
  final recentSearches = <String>[].obs;
  final searchSuggestions = <String>[].obs;
  
  // Filters
  final selectedSort = 'Relevance'.obs;
  final minPrice = 0.0.obs;
  final maxPrice = 10000.0.obs;

  final GetStorage _storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadRecentSearches();
  }

  /// Load recent searches from GetStorage
  void loadRecentSearches() {
    final List<dynamic>? storedList = _storage.read('recent_searches');
    if (storedList != null) {
      recentSearches.assignAll(storedList.cast<String>());
    }
  }

  /// Add keyword to search history
  void addSearchHistory(String query) {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return;

    recentSearches.remove(trimmed); // Move to top if exists
    recentSearches.insert(0, trimmed);

    // Limit to 5 histories
    if (recentSearches.length > 5) {
      recentSearches.removeLast();
    }

    _storage.write('recent_searches', recentSearches.toList());
  }

  /// Clear all recent searches
  void clearRecentSearches() {
    recentSearches.clear();
    _storage.remove('recent_searches');
  }

  /// Trigger search
  void triggerSearch(String query) {
    searchText.text = query;
    addSearchHistory(query);
    ProductController.instance.performSearch(query);
  }

  /// Apply sort criteria to listing
  void sortProducts(String sortOption) {
    selectedSort.value = sortOption;
    final products = ProductController.instance.searchResults;
    if (sortOption == 'Price: Low to High') {
      products.sort((a, b) => a.price.compareTo(b.price));
    } else if (sortOption == 'Price: High to Low') {
      products.sort((a, b) => b.price.compareTo(a.price));
    } else if (sortOption == 'Newest') {
      products.sort((a, b) => b.createdAt.compareTo(a.createdAt));
    }
  }
}
