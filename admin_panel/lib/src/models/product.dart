import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final String currency;
  final String? brandId;
  final String? categoryId;
  final String? subcategoryId;
  final List<String>? variantIds;
  final List<String> imageUrls;
  final String? thumbnailUrl;
  final String status; // active, draft, archived
  final bool featured;
  final bool isVisible;
  final int stock;
  final String? sku;
  final int? lowStockThreshold;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  final Map<String, dynamic>? metadata;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.currency,
    this.brandId,
    this.categoryId,
    this.subcategoryId,
    this.variantIds,
    required this.imageUrls,
    this.thumbnailUrl,
    required this.status,
    required this.featured,
    required this.isVisible,
    required this.stock,
    this.sku,
    this.lowStockThreshold,
    required this.createdAt,
    required this.updatedAt,
    this.metadata,
  });

  factory ProductModel.fromJson(Map<String, dynamic> data, String id) => ProductModel(
        id: id,
        title: data['title'] ?? '',
        description: data['description'] ?? '',
        price: (data['price'] ?? 0).toDouble(),
        currency: data['currency'] ?? 'USD',
        brandId: data['brandId'],
        categoryId: data['categoryId'],
        subcategoryId: data['subcategoryId'],
        variantIds: (data['variantIds'] as List<dynamic>?)?.cast<String>(),
        imageUrls: (data['imageUrls'] as List<dynamic>).cast<String>(),
        thumbnailUrl: data['thumbnailUrl'],
        status: data['status'] ?? 'draft',
        featured: data['featured'] ?? false,
        isVisible: data['isVisible'] ?? true,
        stock: data['stock'] ?? 0,
        sku: data['sku'],
        lowStockThreshold: data['lowStockThreshold'],
        createdAt: data['createdAt'] ?? Timestamp.now(),
        updatedAt: data['updatedAt'] ?? Timestamp.now(),
        metadata: data['metadata'],
      );

  factory ProductModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ProductModel.fromJson(data, doc.id);
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'description': description,
        'price': price,
        'currency': currency,
        'brandId': brandId,
        'categoryId': categoryId,
        'subcategoryId': subcategoryId,
        'variantIds': variantIds,
        'imageUrls': imageUrls,
        'thumbnailUrl': thumbnailUrl,
        'status': status,
        'featured': featured,
        'isVisible': isVisible,
        'stock': stock,
        'sku': sku,
        'lowStockThreshold': lowStockThreshold,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'metadata': metadata,
      };
}
