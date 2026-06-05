import 'package:cloud_firestore/cloud_firestore.dart';

class ReviewModel {
  final String id;
  final String productId;
  final String userId;
  final String userName;
  final String userProfileImage;
  final double rating;
  final String comment;
  final DateTime createdAt;

  ReviewModel({
    required this.id,
    required this.productId,
    required this.userId,
    required this.userName,
    required this.userProfileImage,
    required this.rating,
    required this.comment,
    required this.createdAt,
  });

  // Empty model
  static ReviewModel empty() => ReviewModel(
        id: '',
        productId: '',
        userId: '',
        userName: '',
        userProfileImage: '',
        rating: 0.0,
        comment: '',
        createdAt: DateTime.now(),
      );

  // Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'userId': userId,
      'userName': userName,
      'userProfileImage': userProfileImage,
      'rating': rating,
      'comment': comment,
      'createdAt': Timestamp.fromDate(createdAt),
    };
  }

  // Factory from JSON
  factory ReviewModel.fromJson(Map<String, dynamic> json, String id) {
    return ReviewModel(
      id: id,
      productId: json['productId'] ?? '',
      userId: json['userId'] ?? '',
      userName: json['userName'] ?? '',
      userProfileImage: json['userProfileImage'] ?? '',
      rating: (json['rating'] ?? 0.0).toDouble(),
      comment: json['comment'] ?? '',
      createdAt: (json['createdAt'] as Timestamp).toDate(),
    );
  }

  // Factory from DocumentSnapshot
  factory ReviewModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ReviewModel.empty();
    return ReviewModel.fromJson(document.data()!, document.id);
  }
}
