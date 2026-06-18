import 'package:cloud_firestore/cloud_firestore.dart';

class BrandModel {
  final String id;
  final String name;
  final String? logoUrl;
  final bool visibility;
  final int order;
  final Timestamp createdAt;
  final Timestamp updatedAt;
  final Map<String, dynamic>? metadata;

  BrandModel({
    required this.id,
    required this.name,
    this.logoUrl,
    required this.visibility,
    required this.order,
    required this.createdAt,
    required this.updatedAt,
    this.metadata,
  });

  factory BrandModel.fromJson(Map<String, dynamic> data, String id) => BrandModel(
    id: id,
    name: data['name'] ?? '',
    logoUrl: data['logoUrl'],
    visibility: data['visibility'] ?? true,
    order: data['order'] ?? 0,
    createdAt: data['createdAt'] ?? Timestamp.now(),
    updatedAt: data['updatedAt'] ?? Timestamp.now(),
    metadata: data['metadata'],
  );

  // Removed stray closing brace

  Map<String, dynamic> toJson() => {
        'name': name,
        'logoUrl': logoUrl,
        'visibility': visibility,
        'order': order,
        'createdAt': createdAt,
        'updatedAt': updatedAt,
        'metadata': metadata,
      };
}
