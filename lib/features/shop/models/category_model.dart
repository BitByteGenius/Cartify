import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  final String name;
  final String? parentId;
   String image;
  final bool isActive;
  final bool isFeatured;
  final Timestamp? updatedAt;

   CategoryModel({
    required this.id,
    required this.name,
    this.parentId,
    required this.image,
    this.isActive = true,
    required this.isFeatured,
    this.updatedAt,
  });

  /// Empty Model
  static CategoryModel empty() =>  CategoryModel(
        id: '',
        name: '',
        image: '',
        isFeatured: false,
      );

  /// Convert Model to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'parentId': parentId,
      'image': image,
      'isActive': isActive,
      'isFeatured': isFeatured,
      'updatedAt': updatedAt,
    };
  }

  /// Create CategoryModel from Firestore JSON
  factory CategoryModel.fromJson(
    Map<String, dynamic> data,
    String documentId,
  ) {
    return CategoryModel(
      id: documentId,
      name: data['name'] ?? '',
      parentId: data['parentId'],
      image: data['image'] ?? '',
      isActive: data['isActive'] ?? true,
      isFeatured: data['isFeatured'] ?? false,
      updatedAt: data['updatedAt'],
    );
  }

  /// Create CategoryModel from Firestore Snapshot
  factory CategoryModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data();

    if (data == null) {
      return CategoryModel.empty();
    }

    return CategoryModel(
      id: document.id,
      name: data['name'] ?? '',
      parentId: data['parentId'],
      image: data['image'] ?? '',
      isActive: data['isActive'] ?? true,
      isFeatured: data['isFeatured'] ?? false,
      updatedAt: data['updatedAt'],
    );
  }
}