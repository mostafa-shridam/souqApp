
import 'review_entity.dart';

class ProductEntity {
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
  final num avgRating = 0;
  final bool isOrganic;
  final List<ReviewEntity> reviews;

  ProductEntity({
    required this.exprissionMonths,
    required this.numberOfCalories,
    required this.unitAmount,
    required this.productName,
    required this.productCode,
    required this.description,
    required this.price,
    required this.isFeatured,
    required this.reviews,
    this.isOrganic = false,
    this.imageUrl,
  });
}
