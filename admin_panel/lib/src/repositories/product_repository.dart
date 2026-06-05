import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product.dart';
import 'firestore_repository.dart';

class ProductRepository extends FirestoreRepository<ProductModel> {
  ProductRepository()
      : super(FirebaseFirestore.instance.collection('products'),
            (data, docId) => ProductModel.fromJson(data, docId),
            (model) => model.toJson());
}
