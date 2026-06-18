import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  final String id;
  final String title;
  final String imageUrl;
  final String? targetUrl;
  final String type; // home, offer, promotional
  final int order;
  final bool isActive;
  final Timestamp? startAt;
  final Timestamp? endAt;
  final Map<String, dynamic>? metadata;

  BannerModel({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.targetUrl,
    required this.type,
    required this.order,
    required this.isActive,
    this.startAt,
    this.endAt,
    this.metadata,
  });

  factory BannerModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return BannerModel(
      id: doc.id,
      title: data['title'] ?? '',
      imageUrl: data['imageUrl'] ?? '',
      targetUrl: data['targetUrl'],
      type: data['type'] ?? 'home',
      order: data['order'] ?? 0,
      isActive: data['isActive'] ?? true,
      startAt: data['startAt'],
      endAt: data['endAt'],
      metadata: data['metadata'],
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'imageUrl': imageUrl,
        'targetUrl': targetUrl,
        'type': type,
        'order': order,
        'isActive': isActive,
        'startAt': startAt,
        'endAt': endAt,
        'metadata': metadata,
      };
}
