import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String id;
  final String name;
  final String? description;
  final String? parentId;
  final String? imageUrl;
  final bool isActive;
  final Timestamp createdAt;
  final Timestamp? updatedAt;
  final Map<String, dynamic>? metadata;

  CategoryModel({
    required this.id,
    required this.name,
    this.description,
    this.parentId,
    this.imageUrl,
    this.isActive = true,
    required this.createdAt,
    this.updatedAt,
    this.metadata,
  });

  // Factory for JSON data
  factory CategoryModel.fromJson(Map<String, dynamic> data, String id) => CategoryModel(
        id: id,
        name: data['name'] ?? '',
        description: data['description'],
        parentId: data['parentId'],
        imageUrl: data['imageUrl'],
        isActive: data['isActive'] ?? true,
        createdAt: data['createdAt'] ?? Timestamp.now(),
        updatedAt: data['updatedAt'],
        metadata: data['metadata'],
      );

  // Convenience wrapper for DocumentSnapshot
  factory CategoryModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return CategoryModel.fromJson(data, doc.id);
  }

  Map<String, dynamic> toJson() => {
        'name': name,
        'description': description,
        'parentId': parentId,
        'imageUrl': imageUrl,
        'isActive': isActive,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'metadata': metadata,
      };
}
