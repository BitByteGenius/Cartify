import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cartify/features/shop/models/coupon_model.dart';
import 'package:get/get.dart';

class CouponRepository extends GetxController {
  static CouponRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Check if a coupon is valid
  Future<CouponModel?> getCoupon(String code) async {
    try {
      final snapshot = await _db
          .collection('coupons')
          .where('code', isEqualTo: code.trim().toUpperCase())
          .where('isActive', isEqualTo: true)
          .limit(1)
          .get();
      if (snapshot.docs.isNotEmpty) {
        return CouponModel.fromSnapshot(snapshot.docs.first);
      }
      return null;
    } catch (e) {
      throw 'Something went wrong while validating coupon. Please try again.';
    }
  }
}
