import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DashboardController extends GetxController {
  var revenue = 0.0.obs;
  var totalOrders = 0.obs;
  var totalUsers = 0.obs;
  var totalProducts = 0.obs;

  @override
  void onInit() {
    super.onInit();
    _loadMetrics();
  }

  void _loadMetrics() async {
    final db = FirebaseFirestore.instance;
    final ordersSnap = await db.collection('orders').get();
    totalOrders.value = ordersSnap.size;
    revenue.value = ordersSnap.docs.fold(0.0, (prev, doc) {
      final data = doc.data();
      return prev + ((data['total'] ?? 0) as num).toDouble();
    });
    totalUsers.value = (await db.collection('users').get()).size;
    totalProducts.value = (await db.collection('products').get()).size;
  }
}
