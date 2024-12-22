import 'package:flutter/material.dart';
import 'package:souq/features/main_view/presentation/views/widgets/cart/presentation/domain/cart_item_entity.dart';

import 'cart_item.dart';

class CartSliverListItems extends StatelessWidget {
  const CartSliverListItems({super.key, required this.cartItemEntity});
  final List<CartItemEntity> cartItemEntity;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: cartItemEntity.length,
      itemBuilder: (context, index) => CartItem(
        cartItemEntity: cartItemEntity[index],
      ),
    );
  }
}
