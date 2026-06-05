class CartItemModel {
  String productId;
  String title;
  double price;
  String? image;
  int quantity;
  String color;
  String size;

  CartItemModel({
    required this.productId,
    required this.title,
    required this.price,
    this.image,
    this.quantity = 1,
    this.color = '',
    this.size = '',
  });

  // Empty model
  static CartItemModel empty() => CartItemModel(
        productId: '',
        title: '',
        price: 0.0,
      );

  // Convert model to JSON
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'title': title,
      'price': price,
      'image': image,
      'quantity': quantity,
      'color': color,
      'size': size,
    };
  }

  // Factory from JSON
  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['productId'] ?? '',
      title: json['title'] ?? '',
      price: (json['price'] ?? 0.0).toDouble(),
      image: json['image'],
      quantity: json['quantity'] ?? 1,
      color: json['color'] ?? '',
      size: json['size'] ?? '',
    );
  }
}
