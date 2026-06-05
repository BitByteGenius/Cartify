import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final String currency;
  final String? brandId;
  final String? brandName;
  final String? categoryId;
  final String? subcategoryId;
  final List<String> imageUrls;
  final String? thumbnailUrl;
  final String status; // active, draft, archived
  final bool featured;
  final bool isVisible;
  final int totalStock;
  final String? sku;
  final List<String> sizes;
  final List<String> colors;
  final Map<String, int> stock; // E.g., {"Red_M": 10, "Blue_L": 5}
  final Timestamp createdAt;
  final Timestamp updatedAt;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    this.currency = 'INR',
    this.brandId,
    this.brandName,
    this.categoryId,
    this.subcategoryId,
    required this.imageUrls,
    this.thumbnailUrl,
    required this.status,
    required this.featured,
    required this.isVisible,
    required this.totalStock,
    this.sku,
    this.sizes = const [],
    this.colors = const [],
    this.stock = const {},
    required this.createdAt,
    required this.updatedAt,
  });

  // Empty model
  static ProductModel empty() => ProductModel(
        id: '',
        title: '',
        description: '',
        price: 0.0,
        imageUrls: [],
        status: 'draft',
        featured: false,
        isVisible: false,
        totalStock: 0,
        createdAt: Timestamp.now(),
        updatedAt: Timestamp.now(),
      );

  // Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'currency': currency,
      'brandId': brandId,
      'brandName': brandName,
      'categoryId': categoryId,
      'subcategoryId': subcategoryId,
      'imageUrls': imageUrls,
      'thumbnailUrl': thumbnailUrl,
      'status': status,
      'featured': featured,
      'isVisible': isVisible,
      'totalStock': totalStock,
      'sku': sku,
      'sizes': sizes,
      'colors': colors,
      'stock': stock,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  // Factory constructor from JSON
  factory ProductModel.fromJson(Map<String, dynamic> data, String id) {
    return ProductModel(
      id: id,
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      currency: data['currency'] ?? 'INR',
      brandId: data['brandId'],
      brandName: data['brandName'],
      categoryId: data['categoryId'],
      subcategoryId: data['subcategoryId'],
      imageUrls: (data['imageUrls'] as List<dynamic>?)?.cast<String>() ?? [],
      thumbnailUrl: data['thumbnailUrl'],
      status: data['status'] ?? 'draft',
      featured: data['featured'] ?? false,
      isVisible: data['isVisible'] ?? true,
      totalStock: data['totalStock'] ?? 0,
      sku: data['sku'],
      sizes: (data['sizes'] as List<dynamic>?)?.cast<String>() ?? [],
      colors: (data['colors'] as List<dynamic>?)?.cast<String>() ?? [],
      stock: (data['stock'] as Map<String, dynamic>?)?.map(
            (key, value) => MapEntry(key, value as int),
          ) ??
          const {},
      createdAt: data['createdAt'] ?? Timestamp.now(),
      updatedAt: data['updatedAt'] ?? Timestamp.now(),
    );
  }

  // Factory method from Firestore snapshot
  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProductModel.empty();
    return ProductModel.fromJson(document.data()!, document.id);
  }
}
