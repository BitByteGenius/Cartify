import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class BannerModel {
  final String id;
  final String imageUrl;
  final bool active;
  final String targetScreen;

  BannerModel({
    required this.id,
    required this.imageUrl,
    required this.active,
    required this.targetScreen,
  });

  // Empty model
  static BannerModel empty() => BannerModel(id: '', imageUrl: '', active: false, targetScreen: '');

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'active': active,
      'targetScreen': targetScreen,
    };
  }

  factory BannerModel.fromJson(Map<String, dynamic> json, String id) {
    return BannerModel(
      id: id,
      imageUrl: json['imageUrl'] ?? '',
      active: json['active'] ?? false,
      targetScreen: json['targetScreen'] ?? '',
    );
  }

  factory BannerModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> doc) {
    if (doc.data() == null) return BannerModel.empty();
    return BannerModel.fromJson(doc.data()!, doc.id);
  }
}

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Fetch all active banners
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final snapshot = await _db
          .collection('banners')
          .where('active', isEqualTo: true)
          .get();
      return snapshot.docs.map((doc) => BannerModel.fromSnapshot(doc)).toList();
    } catch (e) {
      throw 'Something went wrong while fetching promotional banners. Please try again.';
    }
  }
}
