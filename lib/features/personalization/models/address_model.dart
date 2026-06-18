import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  final String id;
  final String name;
  final String phoneNumber;
  final String street;
  final String postalCode;
  final String city;
  final String state;
  final String country;
  final DateTime? dateTime;
  bool selectedAddress;

  AddressModel({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.street,
    required this.postalCode,
    required this.city,
    required this.state,
    required this.country,
    this.dateTime,
    this.selectedAddress = false,
  });

  // Empty model
  static AddressModel empty() => AddressModel(
        id: '',
        name: '',
        phoneNumber: '',
        street: '',
        postalCode: '',
        city: '',
        state: '',
        country: '',
      );

  // Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phoneNumber,
      'street': street,
      'postalCode': postalCode,
      'city': city,
      'state': state,
      'country': country,
      'dateTime': dateTime != null ? Timestamp.fromDate(dateTime!) : null,
      'selectedAddress': selectedAddress,
    };
  }

  // Factory from JSON
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      street: json['street'] ?? '',
      postalCode: json['postalCode'] ?? '',
      city: json['city'] ?? '',
      state: json['state'] ?? '',
      country: json['country'] ?? '',
      dateTime: json['dateTime'] != null
          ? (json['dateTime'] as Timestamp).toDate()
          : null,
      selectedAddress: json['selectedAddress'] ?? false,
    );
  }

  // Factory from DocumentSnapshot
  factory AddressModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();
    if (data == null) return AddressModel.empty();
    return AddressModel.fromJson(data);
  }

  @override
  String toString() {
    return '$street, $city, $state - $postalCode, $country';
  }
}
