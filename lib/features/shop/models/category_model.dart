import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  final String name;
  final String? parentId;
  final String? imageUrl;
  final bool isActive;
  final bool isFeatured;
  final Timestamp createdAt;
  final Timestamp? updatedAt;

  CategoryModel({
    required this.id,
    required this.name,
    this.parentId,
    this.imageUrl,
    this.isActive = true,
    this.isFeatured = false,
    required this.createdAt,
    this.updatedAt,
  });

  // Empty model
  static CategoryModel empty() => CategoryModel(
        id: '',
        name: '',
        createdAt: Timestamp.now(),
      );

  // Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'parentId': parentId,
      'imageUrl': imageUrl,
      'isActive': isActive,
      'isFeatured': isFeatured,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  // Factory from JSON
  factory CategoryModel.fromJson(Map<String, dynamic> data, String id) {
    return CategoryModel(
      id: id,
      name: data['name'] ?? '',
      parentId: data['parentId'],
      imageUrl: data['imageUrl'],
      isActive: data['isActive'] ?? true,
      isFeatured: data['isFeatured'] ?? false,
      createdAt: data['createdAt'] ?? Timestamp.now(),
      updatedAt: data['updatedAt'],
    );
  }

  // Factory from DocumentSnapshot
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return CategoryModel.empty();
    return CategoryModel.fromJson(document.data()!, document.id);
  }
}
