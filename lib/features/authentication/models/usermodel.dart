/*import 'package:cartify/utils/formatters/formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.phoneNumber,
    required this.profilePicture,
  });

  // Helper function to get full name
  String get fullName => '$firstName $lastName';

  // Helper function to format phone number
  String get formattedPhoneNo =>
      TFormatter.formatPhoneNumber(phoneNumber);

  // Static function to split full name
  static List<String> nameParts(String fullName) =>
      fullName.split(" ");

  // Static function to generate username
  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(" ");

    String firstName = nameParts[0].toLowerCase();

    String lastName =
        nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";

    String usernameWithPrefix = "cwt_$camelCaseUsername";

    return usernameWithPrefix;
  }

  // Empty user model
  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        email: '',
        username: '',
        phoneNumber: '',
        profilePicture: '',
      );

  // Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  // Factory method from Firestore snapshot
  factory UserModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data();

    if (data != null) {
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        email: data['Email'] ?? '',
        username: data['Username'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    }

    return UserModel.empty();
  }
}*/
import 'package:cartify/features/personalization/models/address_model.dart';
import 'package:cartify/utils/formatters/formatter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  final String username;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// NEW
  final List<AddressModel> addresses;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.username,
    required this.phoneNumber,
    required this.profilePicture,

    /// NEW
    this.addresses = const [],
  });

  /// Helper function to get full name
  String get fullName => '$firstName $lastName';

  /// Helper function to format phone number
  String get formattedPhoneNo =>
      TFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to split full name
  static List<String> nameParts(String fullName) =>
      fullName.split(" ");

  /// Static function to generate username
  static String generateUsername(String fullName) {
    List<String> nameParts = fullName.split(" ");

    String firstName = nameParts[0].toLowerCase();

    String lastName =
        nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUsername = "$firstName$lastName";

    return "cwt_$camelCaseUsername";
  }

  /// Empty user model
  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        email: '',
        username: '',
        phoneNumber: '',
        profilePicture: '',
        addresses: [],
      );

  /// Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'Username': username,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,

      /// NEW
      'Addresses': addresses.map((e) => e.toJson()).toList(),
    };
  }

  /// Factory method from Firestore snapshot
  factory UserModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data();

    if (data != null) {
      return UserModel(
        id: document.id,
        firstName: data['FirstName'] ?? '',
        lastName: data['LastName'] ?? '',
        email: data['Email'] ?? '',
        username: data['Username'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',

        /// NEW
        addresses: (data['Addresses'] as List<dynamic>?)
                ?.map(
                  (e) => AddressModel.fromJson(
                    Map<String, dynamic>.from(e),
                  ),
                )
                .toList() ??
            [],
      );
    }

    return UserModel.empty();
  }
}