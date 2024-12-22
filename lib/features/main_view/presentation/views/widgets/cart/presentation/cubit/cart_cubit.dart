import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:souq/core/entites/product_entity.dart';

import '../domain/cart_entity.dart';
import '../domain/cart_item_entity.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartEntity cartEntity = CartEntity(
    cartItemEntity: [],
  );
  void addProductToCart(ProductEntity productEntity) {
    bool isExist = cartEntity.isExist(productEntity);
    if (isExist) {
    } else {
      CartItemEntity cartItemEntity = CartItemEntity(
        productEntity: productEntity,
        count: 1,
      );

      cartEntity.cartItemEntity.add(cartItemEntity);
    }
    emit(CartItemAdded());
  }

  void removeItem(ProductEntity productEntity) {
    cartEntity.cartItemEntity.remove(productEntity);
    emit(CartItemRemoved());
  }
}
