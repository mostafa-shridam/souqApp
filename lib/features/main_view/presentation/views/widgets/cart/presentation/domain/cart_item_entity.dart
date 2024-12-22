import 'package:souq/core/entites/product_entity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
   int count;

  CartItemEntity({required this.productEntity, this.count = 0});
  num calculatTotalPrice() => productEntity.price * count;
  num calculatTotalWeight() => productEntity.unitAmount * count;
}