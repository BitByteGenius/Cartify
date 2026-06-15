import 'package:cartify/features/shop/models/brand_model.dart';
import 'package:cartify/features/shop/models/product_attributes_model.dart';
import 'package:cartify/features/shop/models/product_variation_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double? salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel> productVariations;

  ProductModel({
    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.date,
    this.images,
    this.salePrice = 0.0,
    this.isFeatured,
    this.categoryId,
    this.description,
    this.productAttributes,
    this.productVariations,
  });

  // Create Empty func for clean code
  static ProductModel empty() => ProductModel(
    id: '',
    title: '',
    stock: 0,
    price: 0,
    thumbnail: '',
    productType: '',
  );

  //Json format
  Map<String, dynamic> toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand!.toJson(),
      'Description': description,
      'ProductType': productType,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      'ProductVariations': productVariations!.map((e) => e.toJson()).toList(),
    };
  }

  //Map Json Oriented document Snapshot from Firebase to Model
  factory ProductModel.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> document,
  ) {
    final data = document.data()!;
    return ProductModel(
      id: document.id,
      sku: data['SKU'],
      title: data['Title'],
      stock: data['Stock'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description: data ['Description'] ?? '',
      productType: data['ProductType']?? '',
      brand: : BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List <String>.from(data['Images']):[],
      productAttributes: (data['ProductAttributes'] as List <dynamic>).map((e) => productAttributeModel.fromJson(e)).tolist(),
      productVariations: (data['ProductVariations'] as List <dynamic>).map((e) => productVariationModel.fromJson(e)).tolist(),
      );
  }

  // Map Json-oriented document snapshot from firebase to model
}
