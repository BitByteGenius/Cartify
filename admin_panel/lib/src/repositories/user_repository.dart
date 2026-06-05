import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user.dart';
import 'firestore_repository.dart';

class UserRepository extends FirestoreRepository<UserModel> {
  UserRepository()
      : super(
          FirebaseFirestore.instance.collection('users'),
          (data, id) => UserModel.fromJson(data, id),
          (model) => model.toJson(),
        );
}
