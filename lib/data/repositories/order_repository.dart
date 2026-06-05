import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cartify/features/shop/models/order_model.dart';
import 'package:get/get.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Fetch all orders placed by the current user
  Future<List<OrderModel>> fetchUserOrders(String userId) async {
    try {
      final snapshot = await _db
          .collection('orders')
          .where('userId', isEqualTo: userId)
          .orderBy('orderDate', descending: true)
          .get();
      return snapshot.docs.map((doc) => OrderModel.fromSnapshot(doc)).toList();
    } catch (e) {
      throw 'Something went wrong while fetching order history. Please try again.';
    }
  }

  /// Save a new order when checkout is completed
  Future<void> saveOrder(OrderModel order) async {
    try {
      await _db.collection('orders').doc(order.id).set(order.toJson());
    } catch (e) {
      throw 'Something went wrong while saving your order details. Please try again.';
    }
  }
}
