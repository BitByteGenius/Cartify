import 'package:cartify/features/personalization/models/address_model.dart';

class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String phoneNumber;
  final String profilePicture;
  final List<AddressModel> addresses;

  UserModel({
  required this.id,
  required this.firstName,
  required this.lastName,
  required this.username,
  required this.email,
  required this.phoneNumber,
  required this.profilePicture,
  required this.addresses,
});

  String get fullName => '$firstName $lastName';

  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
      'Addresses': addresses.map((e) => e.toJson()).toList(),
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['Id'] ?? '',
      firstName: json['FirstName'] ?? '',
      lastName: json['LastName'] ?? '',
      username: json['Username'] ?? '',
      email: json['Email'] ?? '',
      phoneNumber: json['PhoneNumber'] ?? '',
      profilePicture: json['ProfilePicture'] ?? '',
      addresses: (json['Addresses'] as List<dynamic>?)
              ?.map((e) =>
                  AddressModel.fromJson(Map<String, dynamic>.from(e)))
              .toList() ??
          [],
    );
  }
}