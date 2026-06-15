class BrandModel {
  String id;
  String name;
  String image;
  bool? isFeatured;
  int? productsCount;

  BrandModel({
    required this.id,
    required this.image,
    required this.name,
    this.isFeatured,
    this.productsCount,
  });

  // Empty Helper Function
  static BrandModel empty() => BrandModel(id: '', image: '', name: '');

  //convert model to json structure so that yo can store data in firebase
  Map<String, Object?> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Images': image,
      'ProductCount': productsCount,
      'IsFeatured': isFeatured,
    };
  }

  // Map Json oriented document snapshot from firebase to UserModel

  factory BrandModel.fromJson(Map<String, dynamic> document) {
    final data = document;
    if (data.isEmpty) return BrandModel.empty();
    return BrandModel(
      id: data['Id'] ?? '',
      image: data['Images'] ?? '',
      name: data['Name'] ?? '',
    );
  }
}
