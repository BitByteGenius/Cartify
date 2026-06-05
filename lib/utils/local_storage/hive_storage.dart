import 'package:hive_flutter/hive_flutter.dart';

class THiveStorage {
  static final _cartBox = Hive.box('cart_box');
  static final _wishlistBox = Hive.box('wishlist_box');
  static final _userProfileBox = Hive.box('user_profile_box');
  static final _productsCacheBox = Hive.box('products_cache_box');

  // --- Cart Caching ---
  static List<Map<String, dynamic>> getCart() {
    final List<dynamic>? rawCart = _cartBox.get('cart');
    if (rawCart == null) return [];
    return rawCart.map((item) => Map<String, dynamic>.from(item as Map)).toList();
  }

  static Future<void> saveCart(List<Map<String, dynamic>> cartJson) async {
    await _cartBox.put('cart', cartJson);
  }

  static Future<void> clearCart() async {
    await _cartBox.delete('cart');
  }

  // --- Wishlist Caching ---
  static List<String> getWishlist() {
    final List<dynamic>? rawWishlist = _wishlistBox.get('wishlist');
    if (rawWishlist == null) return [];
    return List<String>.from(rawWishlist);
  }

  static Future<void> saveWishlist(List<String> productIds) async {
    await _wishlistBox.put('wishlist', productIds);
  }

  // --- User Profile Caching ---
  static Map<String, dynamic>? getUserProfile() {
    final rawUser = _userProfileBox.get('user');
    if (rawUser == null) return null;
    return Map<String, dynamic>.from(rawUser as Map);
  }

  static Future<void> saveUserProfile(Map<String, dynamic> userJson) async {
    await _userProfileBox.put('user', userJson);
  }

  static Future<void> clearUserProfile() async {
    await _userProfileBox.delete('user');
  }

  // --- Products Caching (Last Loaded) ---
  static List<Map<String, dynamic>> getCachedProducts() {
    final List<dynamic>? rawProducts = _productsCacheBox.get('products');
    if (rawProducts == null) return [];
    return rawProducts.map((item) => Map<String, dynamic>.from(item as Map)).toList();
  }

  static Future<void> saveCachedProducts(List<Map<String, dynamic>> productsJson) async {
    await _productsCacheBox.put('products', productsJson);
  }
}
