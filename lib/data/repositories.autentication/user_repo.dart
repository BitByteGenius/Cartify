import 'package:cartify/utils/exceptions/firebase_aut_execption.dart';
import 'package:cartify/features/authentication/models/usermodel.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserRepo extends GetxController {
  static UserRepo get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // Save user data to Firebase
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db
          .collection("Users")
          .doc(user.id)
          .set(user.toJson());

    } on FirebaseAuthException catch (e) {

      throw TFirebaseAuthException(e.code).message;

    } catch (e) {

      throw 'Something went wrong. Please try again';
    }
  }

  // Fetch user details based on user ID
  Future<UserModel?> getUserRecord(String userId) async {
    try {
      final documentSnapshot = await _db.collection("Users").doc(userId).get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      }
      return null;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}