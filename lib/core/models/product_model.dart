
import 'package:souq/core/entites/product_entity.dart';

import 'review_model.dart';

class ProductModel {
  final String productName;
  final String productCode;
  final String description;
  final num price;
  final bool isFeatured;
  String? imageUrl;
  final int exprissionMonths;
  final int numberOfCalories;
  final int unitAmount;
  final num ratingCount = 0;
  final num avgRating;
  final num sellingCount;
  final bool isOrganic;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.productName,
    required this.productCode,
    required this.description,
    required this.avgRating,
    required this.price,
    required this.isFeatured,
    required this.exprissionMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.reviews,
    required this.sellingCount,
    this.isOrganic = false,
    this.imageUrl,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      avgRating: getAvgRating(json['reviews'] != null
          ? List<ReviewModel>.from(
              json['reviews'].map(
                (e) => ReviewModel.fromJson(e),
              ),
            )
          : []),
      productName: json['productName'],
      productCode: json['productCode'],
      description: json['description'],
      price: json['price'],
      isFeatured: json['isFeatured'],
      imageUrl: json['imageUrl'],
      exprissionMonths: json['exprissionMonths'],
      numberOfCalories: json['numberOfCalories'],
      unitAmount: json['unitAmount'],
      isOrganic: json['isOrganic'],
      sellingCount: json['sellingCount'],
      reviews: json['reviews'] != null
          ? List<ReviewModel>.from(
              json['reviews'].map((e) => ReviewModel.fromJson(e)))
          : [],
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      exprissionMonths: exprissionMonths,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
      productName: productName,
      productCode: productCode,
      description: description,
      price: price,
      isFeatured: isFeatured,
      imageUrl: imageUrl,
      reviews: reviews.map((e) => e.toEntity()).toList(),
    );
  }

  toJson() {
    return {
      'productName': productName,
      'productCode': productCode,
      'description': description,
      'price': price,
      'isFeatured': isFeatured,
      'imageUrl': imageUrl,
      'exprissionMonths': exprissionMonths,
      'numberOfCalories': numberOfCalories,
      'unitAmount': unitAmount,
      'isOrganic': isOrganic,
      'sellingCount': sellingCount,
      'reviews': reviews.map((e) => e.toJson()).toList(),
    };
  }
}

num getAvgRating(List<ReviewModel> reviews) {
  var sum = 0.0;
  for (var review in reviews) {
    sum += review.rating;
  }
  return sum / reviews.length;
}
