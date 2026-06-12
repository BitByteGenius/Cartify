import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  final String name;
  final String? parentId;
  final String? image;
  final bool isActive;
  final bool isFeatured;
  final Timestamp? updatedAt;

  CategoryModel({
    required this.id,
    required this.name,
    this.parentId,
    this.image,
    this.isActive = true,
    required this.isFeatured,
    this.updatedAt,
  });

  // Empty model
  static CategoryModel empty() =>
      CategoryModel(id: '', name: '', isFeatured: false);

  // Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'ParentId': parentId,
      'image': image,
      'isActive': isActive,
      'isFeatured': isFeatured,
      'updatedAt': updatedAt,
    };
  }

  // Factory from JSON
  factory CategoryModel.fromJson(Map<String, dynamic> data, String id) {
    return CategoryModel(
      id: id,
      name: data['name'] ?? '',
      parentId: data['parentId'],
      image: data['image'] ?? '',
      isActive: data['isActive'] ?? true,
      isFeatured: data['isFeatured'] ?? false,
      updatedAt: data['updatedAt'],
    );
  }

  // Factory from DocumentSnapshot
  factory CategoryModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    if (document.data() != null) {
      final data = document.data()!;
      

      //map json record to model
      return CategoryModel(
       id: document.id,
        name: data['name'] ?? '',
        parentId: data['parentId'],
        image: data['image'] ?? '',
        isFeatured: data['isFeatured'] ?? false,
       );
    }else{
      return CategoryModel.empty();
    }
  }
}
