class CartItemModel {
  // Cart Fields
  final String? cartId;
  final List<CartItemModel>? items;

  // Item Fields
  final String? productId;
  final String? variationId;
  final String? title;
  final String? image;
  final String? brandName;
  final double? price;
  final int quantity;
  final Map<String, dynamic>? selectedVariation;

  const CartItemModel({
    this.cartId,
    this.items,
    this.productId,
    this.variationId,
    this.title,
    this.image,
    this.brandName,
    this.price,
    this.quantity = 1,
    this.selectedVariation,
  });

  static CartItemModel empty() => const CartItemModel(
        cartId: '',
        productId: '',
        variationId: '',
        title: '',
        image: '',
        brandName: '',
        price: 0,
      );

  bool get isCart => cartId != null;

  double get totalPrice => (price ?? 0) * quantity;

  Map<String, dynamic> toJson() {
    return {
      'cartId': cartId,
      'items': items?.map((e) => e.toJson()).toList(),
      'productId': productId,
      'variationId': variationId,
      'title': title,
      'image': image,
      'brandName': brandName,
      'price': price,
      'quantity': quantity,
      'selectedVariation': selectedVariation,
    };
  }

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      cartId: json['cartId'],
      items: json['items'] != null
          ? List<Map<String, dynamic>>.from(json['items'])
              .map((e) => CartItemModel.fromJson(e))
              .toList()
          : [],
      productId: json['productId'],
      variationId: json['variationId'],
      title: json['title'],
      image: json['image'],
      brandName: json['brandName'],
      price: json['price'] != null
          ? (json['price'] as num).toDouble()
          : 0.0,
      quantity: json['quantity'] ?? 1,
      selectedVariation: json['selectedVariation'] != null
          ? Map<String, dynamic>.from(json['selectedVariation'])
          : {},
    );
  }
}