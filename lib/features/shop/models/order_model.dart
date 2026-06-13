import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cartify/features/personalization/models/address_model.dart';
import 'package:cartify/features/shop/models/cart_item_model.dart';

class OrderModel {
  final String id;
  final String userId;
  final String status;
  final double totalAmount;
  final DateTime orderDate;
  final String paymentMethod;
  final AddressModel? address;
  final CartItemModel items;
  final DateTime? deliveryDate;

  OrderModel({
    required this.id,
    required this.userId,
    required this.status,
    required this.totalAmount,
    required this.orderDate,
    required this.paymentMethod,
    this.address,
    required this.items,
    this.deliveryDate,
  });

  /// Order Status
  String get orderStatusText {
    if (status.isEmpty) return 'Pending';
    return status[0].toUpperCase() + status.substring(1);
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'status': status,
      'totalAmount': totalAmount,
      'orderDate': Timestamp.fromDate(orderDate),
      'paymentMethod': paymentMethod,
      'address': address?.toJson(),
      'items': items.toJson(),
      'deliveryDate':
          deliveryDate != null ? Timestamp.fromDate(deliveryDate!) : null,
    };
  }

  /// Factory from JSON
  factory OrderModel.fromJson(
      Map<String, dynamic> json,
      String id,
      ) {
    return OrderModel(
      id: id,
      userId: json['userId'] ?? '',
      status: json['status'] ?? 'pending',
      totalAmount: (json['totalAmount'] ?? 0).toDouble(),
      orderDate: (json['orderDate'] as Timestamp).toDate(),
      paymentMethod: json['paymentMethod'] ?? 'Google Pay',
      address: json['address'] != null
          ? AddressModel.fromJson(
              Map<String, dynamic>.from(json['address']))
          : null,
      items: CartItemModel.fromJson(
        Map<String, dynamic>.from(json['items']),
      ),
      deliveryDate: json['deliveryDate'] != null
          ? (json['deliveryDate'] as Timestamp).toDate()
          : null,
    );
  }

  /// Factory from Firestore
  factory OrderModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document,
      ) {
    final data = document.data();

    if (data == null) {
      throw Exception('Document snapshot is null');
    }

    return OrderModel.fromJson(data, document.id);
  }
}