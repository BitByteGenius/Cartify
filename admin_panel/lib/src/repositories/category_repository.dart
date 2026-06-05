import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/category.dart';
import 'firestore_repository.dart';

class CategoryRepository extends FirestoreRepository<CategoryModel> {
  CategoryRepository()
      : super(
            FirebaseFirestore.instance.collection('categories'),
            (data, id) => CategoryModel.fromJson(data, id),
            (model) => model.toJson(),
          );
}
