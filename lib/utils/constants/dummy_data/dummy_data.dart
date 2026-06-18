import 'package:cartify/features/authentication/models/usermodel.dart';
import 'package:cartify/features/personalization/models/address_model.dart';
import 'package:cartify/features/shop/models/banner_model.dart';
import 'package:cartify/features/shop/models/cart_item_model.dart';
import 'package:cartify/features/shop/models/category_model.dart';
import 'package:cartify/features/shop/models/order_model.dart';
import 'package:cartify/routes/routes.dart';
import 'package:cartify/utils/constants/image_string.dart';

class TDummyData {
  /// -- Banners
  static final List<BannerModel> banners = [
    BannerModel(
      imageUrl: TImage.promoBanner1,
      targetScreen: TRoutes.order,
      active: false,
    ),
    BannerModel(
      imageUrl: TImage.promoBanner2,
      targetScreen: TRoutes.cart,
      active: true,
    ),
    BannerModel(
      imageUrl: TImage.promoBanner3,
      targetScreen: TRoutes.favourites,
      active: true,
    ),
    BannerModel(
      imageUrl: TImage.promoBanner4,
      targetScreen: TRoutes.search,
      active: true,
    ),
    BannerModel(
      imageUrl: TImage.promoBanner5,
      targetScreen: TRoutes.settings,
      active: true,
    ),
    BannerModel(
      imageUrl: TImage.promoBanner6,
      targetScreen: TRoutes.userAddress,
      active: true,
    ),
    BannerModel(
      imageUrl: TImage.promoBanner1,
      targetScreen: TRoutes.checkout,
      active: false,
    ),
  ];

  /// -- User
  static final UserModel user = UserModel(
  id: '001',
  firstName: 'Rahul',
  lastName: 'Singh',
  username: 'rahul_singh',
  email: 'rahul@example.com',
  phoneNumber: '+919876543210',
  profilePicture: '',
  addresses: [
    AddressModel(
      id: '1',
      name: 'Rahul Kumar Singh',
      phoneNumber: '+919876543210',
      street: 'Bhitihara',
      city: 'Buxar',
      state: 'Bihar',
      postalCode: '802123',
      country: 'India',
      selectedAddress: true,
    ),
    AddressModel(
      id: '2',
      name: 'Rahul Office',
      phoneNumber: '+919876543210',
      street: 'Main Road',
      city: 'Patna',
      state: 'Bihar',
      postalCode: '800001',
      country: 'India',
    ),
  ],
);

  // Define this first

// Then create cart
static final CartItemModel cart = CartItemModel(
  cartId: '001',
  items: [
    CartItemModel(
      productId: '001',
      variationId: '1',
      quantity: 1,
      title: 'Nike Running Shoes',
image: TImage.productImage1,
brandName: 'Nike',
selectedVariation: {
  'Color': 'Black',
  'Size': '42',
},
price: 120,
    ),
    CartItemModel(
      productId: '002',
      variationId: '',
      quantity: 1,
      title: 'Nike Running Shoes',
image: TImage.productImage1,
brandName: 'Nike',
selectedVariation: {
  'Color': 'Black',
  'Size': '42',
},
price: 120,
    ),
  ],
);


  // orders
  static final List<OrderModel> orders = [
    OrderModel(
      id: 'CWT0012',
      userId: 'u1',
      status: 'processing',
      items: cart,
      totalAmount: 265.0,
      orderDate: DateTime(2023, 9, 1),
      deliveryDate: DateTime(2023, 9, 9),
      paymentMethod: 'Google Pay',
    ),
    OrderModel(
      id: 'CWT0013',
      userId: 'u1',
      status: 'processing',
      items: cart,
      totalAmount: 265.0,
      orderDate: DateTime(2024, 9, 1),
      deliveryDate: DateTime(2024, 9, 9),
      paymentMethod: 'Cash on Delivery',
    ),
  ];

  /// -- List of all Categories
  static final List<CategoryModel> categories = [
  CategoryModel(id: '1', image: TImage.sportIcon, name: 'Sports', isFeatured: true),
  CategoryModel(id: '5', image: TImage.furnitureIcon, name: 'Furniture', isFeatured: true),
  CategoryModel(id: '2', image: TImage.electronicsIcon, name: 'Electronics', isFeatured: true),
  CategoryModel(id: '3', image: TImage.clothIcon, name: 'Clothes', isFeatured: true),
  CategoryModel(id: '4', image: TImage.animalIcon, name: 'Animals', isFeatured: true),
  CategoryModel(id: '6', image: TImage.shoeIcon, name: 'Shoes', isFeatured: true),
  CategoryModel(id: '7', image: TImage.cosmeticsIcon, name: 'Cosmetics', isFeatured: true),
  CategoryModel(id: '14', image: TImage.jeweleryIcon, name: 'Jewelery', isFeatured: true),

  ///subcategories
  CategoryModel(id: '8', image: TImage.sportIcon, name: 'Sport Shoes', parentId: '1', isFeatured: false),
  CategoryModel(id: '9', image: TImage.sportIcon, name: 'Track suits', parentId: '1', isFeatured: false),
  CategoryModel(id: '10', image: TImage.sportIcon, name: 'Sports Equipments', parentId: '1', isFeatured: false),
  
  //furniture
  CategoryModel(id: '11', image: TImage.furnitureIcon, name: 'Bedroom furniture', parentId: '5', isFeatured: false),
  CategoryModel(id: '12', image: TImage.furnitureIcon, name: 'Kitchen furniture', parentId: '5', isFeatured: false),
  CategoryModel(id: '13', image: TImage.furnitureIcon, name: 'Office furniture', parentId: '5', isFeatured: false),
  //electronics
  CategoryModel(id: '14', image: TImage.electronicsIcon, name: 'Laptop', parentId: '2', isFeatured: false),
CategoryModel(id: '15', image: TImage.electronicsIcon, name: 'Mobile', parentId: '2', isFeatured: false),

CategoryModel(id: '16', image: TImage.clothIcon, name: 'Shirts', parentId: '3', isFeatured: false),

];
}

/*import 'package:cartify/data/repositories/banner_repository.dart';
import 'package:cartify/features/authentication/models/usermodel.dart';
import 'package:cartify/features/personalization/models/address_model.dart';
import 'package:cartify/features/shop/models/cart_item_model.dart';
import 'package:cartify/features/shop/models/category_model.dart';
import 'package:cartify/features/shop/models/order_model.dart';
import 'package:cartify/utils/constants/enums.dart';
import 'package:cartify/utils/constants/image_string.dart';
import 'package:flutter/cupertino.dart';

class TDummyData {
  /// -- Banners
  static final List<BannerModel> banners = [
    BannerModel(imageUrl: TImage.banner1, targetScreen: TRoutes.order, active: false),
    BannerModel(imageUrl: TImage.banner2, targetScreen: TRoutes.cart, active: true),
    BannerModel(imageUrl: TImage.banner3, targetScreen: TRoutes.favourites, active: true),
    BannerModel(imageUrl: TImage.banner4, targetScreen: TRoutes.search, active: true),
    BannerModel(imageUrl: TImage.banner5, targetScreen: TRoutes.settings, active: true),
    BannerModel(imageUrl: TImage.banner6, targetScreen: TRoutes.userAddress, active: true),
    BannerModel(imageUrl: TImage.banner8, targetScreen: TRoutes.checkout, active: false),
  ];

  /// -- User
  static final UserModel user = UserModel(
    firstName: 'Coding',
    lastName: 'with T',
    email: 'support@codingwithT.com',
    phoneNumber: '+14155552671',
    profilePicture: TImage.user,
    addresses: [
      AddressModel(
        id: '1',
        name: 'Anup Singh',
        phoneNumber: '+7086972424',
        street: 'Karma Buxar Bihar',
        city: 'Buxar',
        state: 'Bihar',
        postalCode: '802123',
        country: 'India',
      ),
      AddressModel(
        id: '6',
        name: 'Coding with Rahul',
        phoneNumber: '+6002515672',
        street: 'Bhitihara',
        city: 'Guwahati',
        state: 'Assam',
        postalCode: '702752',
        country: 'India',
      ),
    ],
  );

  //cart
  static final CartItemModel cart = CartItemModel(
    cartId: '001'
    items:[
      CartItemModel(
        productId: '001',
      variationId: '1',
      quality: '1'
      title: Products [0].thumbnail,
      image: Products [0].thumbnail,
      brandName: Products [0].brand!.name,
      selectedVariation: products [0].productVariations![0].attributesValues,
      price: products [0].productVariations![0].price,
    ),
    CartItemModel(
      productId: '002',
      variationId: '',
      quality: '1'
      title: Products [1].thumbnail,
      image: Products [1].thumbnail,
      brandName: Products [1].brand!.name,
      selectedVariation: products [1].productVariations![0].attributesValues,
      price: products [1].productVariations![0].price,

    ),

    
    ]
  );

  //orders
  final List<OrderModel> orders = [
  OrderModel(
    id: 'CWT0012',
    status: OrderStatus.processing,
    items: cart.items, // Works perfectly now
    totalAmount: 265,
    orderDate: DateTime(2023, 09, 1),
    deliveryDate: DateTime(2023, 09, 9),
  ),
  OrderModel(
    id: 'CWT0013',
    status: OrderStatus.processing,
    items: cart.items, // Works perfectly now
    totalAmount: 265,
    orderDate: DateTime(2024, 09, 1),
    deliveryDate: DateTime(2023, 09, 9),
  ),
];
    
    /// -- List of all Categories
static final List<CategoryModel> categories = [
  CategoryModel(id: '1', image: TImage.sportIcon, name: 'Sports', isFeatured: true),
  CategoryModel(id: '5', image: TImage.furnitureIcon, name: 'Furniture', isFeatured: true),
  CategoryModel(id: '2', image: TImage.electronicsIcon, name: 'Electronics', isFeatured: true),
  CategoryModel(id: '3', image: TImage.clothIcon, name: 'Clothes', isFeatured: true),
  CategoryModel(id: '4', image: TImage.animalIcon, name: 'Animals', isFeatured: true),
  CategoryModel(id: '6', image: TImage.shoeIcon, name: 'Shoes', isFeatured: true),
  CategoryModel(id: '7', image: TImage.cosmeticsIcon, name: 'Cosmetics', isFeatured: true),
  CategoryModel(id: '14', image: TImage.jeweleryIcon, name: 'Jewelery', isFeatured: true),

  ///subcategories
  CategoryModel(id: '8', image: TImage.sportIcon, name: 'Sport Shoes', parentId: '1', isFeatured: false),
  CategoryModel(id: '9', image: TImage.sportIcon, name: 'Track suits', parentId: '1', isFeatured: false),
  CategoryModel(id: '10', image: TImage.sportIcon, name: 'Sports Equipments', parentId: '1', isFeatured: false),
  
  //furniture
  CategoryModel(id: '11', image: TImage.furnitureIcon, name: 'Bedroom furniture', parentId: '5', isFeatured: false),
  CategoryModel(id: '12', image: TImage.furnitureIcon, name: 'Kitchen furniture', parentId: '5', isFeatured: false),
  CategoryModel(id: '13', image: TImage.furnitureIcon, name: 'Office furniture', parentId: '5', isFeatured: false),
  //electronics
  CategoryModel(id: '14', image: TImage.electronicsIcon, name: 'Laptop', parentId: '2', isFeatured: false),
CategoryModel(id: '15', image: TImage.electronicsIcon, name: 'Mobile', parentId: '2', isFeatured: false),

CategoryModel(id: '16', image: TImage.clothIcon, name: 'Shirts', parentId: '3', isFeatured: false),

];
  
}*/
