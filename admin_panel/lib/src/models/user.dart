import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String? displayName;
  final String? photoUrl;
  final String role; // admin, manager, customer, etc.
  String status; // mutable for controller updates
  final Timestamp createdAt;
  final Timestamp? lastSeen;
  final Map<String, dynamic>? address;
  final String? phone;
  final Map<String, dynamic>? metadata;

  UserModel({
    required this.uid,
    required this.email,
    this.displayName,
    this.photoUrl,
    required this.role,
    required this.status,
    required this.createdAt,
    this.lastSeen,
    this.address,
    this.phone,
    this.metadata,
  });

  factory UserModel.fromJson(Map<String, dynamic> data, String id) {
    return UserModel(
      uid: id,
      email: data['email'] ?? '',
      displayName: data['displayName'],
      photoUrl: data['photoUrl'],
      role: data['role'] ?? 'customer',
      status: data['status'] ?? 'active',
      createdAt: data['createdAt'] ?? Timestamp.now(),
      lastSeen: data['lastSeen'],
      address: data['address'],
      phone: data['phone'],
      metadata: data['metadata'],
    );
  }

  factory UserModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return UserModel.fromJson(data, doc.id);
  }

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'displayName': displayName,
      'photoUrl': photoUrl,
      'role': role,
      'status': status,
      'createdAt': createdAt,
      'lastSeen': lastSeen,
      'address': address,
      'phone': phone,
      'metadata': metadata,
    };
  }
}
