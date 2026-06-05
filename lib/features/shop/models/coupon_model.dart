import 'package:cloud_firestore/cloud_firestore.dart';

class CouponModel {
  final String id;
  final String code;
  final double discountAmount;
  final double minAmount;
  final bool isActive;
  final DateTime expiryDate;

  CouponModel({
    required this.id,
    required this.code,
    required this.discountAmount,
    required this.minAmount,
    required this.isActive,
    required this.expiryDate,
  });

  // Empty model
  static CouponModel empty() => CouponModel(
        id: '',
        code: '',
        discountAmount: 0.0,
        minAmount: 0.0,
        isActive: false,
        expiryDate: DateTime.now(),
      );

  // Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'discountAmount': discountAmount,
      'minAmount': minAmount,
      'isActive': isActive,
      'expiryDate': Timestamp.fromDate(expiryDate),
    };
  }

  // Factory from JSON
  factory CouponModel.fromJson(Map<String, dynamic> json, String id) {
    return CouponModel(
      id: id,
      code: json['code'] ?? '',
      discountAmount: (json['discountAmount'] ?? 0.0).toDouble(),
      minAmount: (json['minAmount'] ?? 0.0).toDouble(),
      isActive: json['isActive'] ?? false,
      expiryDate: (json['expiryDate'] as Timestamp).toDate(),
    );
  }

  // Factory from DocumentSnapshot
  factory CouponModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return CouponModel.empty();
    return CouponModel.fromJson(document.data()!, document.id);
  }
}
