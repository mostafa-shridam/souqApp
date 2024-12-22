import 'package:souq/core/entites/product_entity.dart';

import 'cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItemEntity;

  CartEntity({required this.cartItemEntity});
  addCartItem(CartItemEntity item) => cartItemEntity.add(item);

  removeCartItem(CartItemEntity item) => cartItemEntity.remove(item);
  bool isExist(ProductEntity productEntity) {
    for (var element in cartItemEntity) {
      if (element.productEntity == productEntity) return true;
    }
    return false;
  }
}
