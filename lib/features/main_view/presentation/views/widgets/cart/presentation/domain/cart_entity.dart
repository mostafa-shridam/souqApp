import 'package:souq/core/entites/product_entity.dart';

import 'cart_item_entity.dart';

class CartEntity {
  final List<CartItemEntity> cartItemEntity;

  CartEntity({required this.cartItemEntity});
  addCartItem(CartItemEntity item) => cartItemEntity.add(item);

  removeCartItem(CartItemEntity item) => cartItemEntity.remove(item);
  num calculatTotalPrice() => cartItemEntity.fold(0,
      (previousValue, element) => previousValue + element.calculatTotalPrice());

  bool isExist(ProductEntity productEntity) {
    for (var element in cartItemEntity) {
      if (element.productEntity == productEntity) return true;
    }
    return false;
  }

  CartItemEntity getCartItem({required ProductEntity productEntity}) {
    for (var carItem in cartItemEntity) {
      if (carItem.productEntity == productEntity) return carItem;
    }
    return CartItemEntity(productEntity: productEntity, count: 1,);
  }
}
