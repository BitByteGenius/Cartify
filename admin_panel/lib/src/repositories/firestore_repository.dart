import 'package:cloud_firestore/cloud_firestore.dart';

typedef FromJson<T> = T Function(Map<String, dynamic> data, String docId);

typedef ToJson<T> = Map<String, dynamic> Function(T model);

class FirestoreRepository<T> {
  final CollectionReference _collection;
  final FromJson<T> _fromJson;
  final ToJson<T> _toJson;

  FirestoreRepository(this._collection, this._fromJson, this._toJson);

  Stream<List<T>> streamAll() {
    return _collection.snapshots().map((snapshot) => snapshot.docs
        .map((doc) => _fromJson(doc.data() as Map<String, dynamic>, doc.id))
        .toList());
  }

  Future<List<T>> getAll() async {
    final snapshot = await _collection.get();
    return snapshot.docs
        .map((doc) => _fromJson(doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  Future<T?> getById(String id) async {
    final doc = await _collection.doc(id).get();
    if (!doc.exists) return null;
    return _fromJson(doc.data() as Map<String, dynamic>, doc.id);
  }

  Future<void> add(T model) async {
    await _collection.add(_toJson(model));
  }

  Future<void> update(String id, T model) async {
    await _collection.doc(id).update(_toJson(model));
  }

  Future<void> delete(String id) async {
    await _collection.doc(id).delete();
  }
}
