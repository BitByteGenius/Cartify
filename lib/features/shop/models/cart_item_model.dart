class CartItemModel {
  String? cartId;
  List<CartItemModel>? items;

  String? productId;
  String? variationId;
  String? title;
  String? image;
  String? brandName;
  double? price;
  int quantity;
  Map<String, dynamic>? selectedVariation;

  CartItemModel({
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

  static CartItemModel empty() => CartItemModel();

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
          ? (json['items'] as List)
              .map((e) => CartItemModel.fromJson(
                    Map<String, dynamic>.from(e),
                  ))
              .toList()
          : null,
      productId: json['productId'],
      variationId: json['variationId'],
      title: json['title'],
      image: json['image'],
      brandName: json['brandName'],
      price: json['price'] != null
          ? (json['price'] as num).toDouble()
          : null,
      quantity: json['quantity'] ?? 1,
      selectedVariation: json['selectedVariation'] != null
          ? Map<String, dynamic>.from(json['selectedVariation'])
          : null,
    );
  }
}