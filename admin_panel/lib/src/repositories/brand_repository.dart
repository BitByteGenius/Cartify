import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/brand.dart';
import 'firestore_repository.dart';

class BrandRepository extends FirestoreRepository<BrandModel> {
  BrandRepository()
      : super(
            FirebaseFirestore.instance.collection('brands'),
            (data, id) => BrandModel.fromJson(data, id),
            (model) => model.toJson(),
          );
}


