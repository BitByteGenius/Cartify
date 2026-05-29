import 'package:cartify/data/repositories.autentication/firebase_aut_execption.dart';
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
}