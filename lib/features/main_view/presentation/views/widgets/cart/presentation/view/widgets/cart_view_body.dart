import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/core/utils/constants/constants.dart';
import 'package:souq/core/widgets/custom_button.dart';
import 'package:souq/features/main_view/presentation/views/widgets/cart/presentation/view/widgets/cart_header.dart';
import 'package:souq/features/main_view/presentation/views/widgets/cart/presentation/view/widgets/cart_sliver_list_item.dart';
import '../../../../../../../../products/presentation/view/widgets/products_app_bar.dart';
import '../../cubit/cart_cubit.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        var cubit = context.read<CartCubit>().cartEntity;
        return cubit.cartItemEntity.isEmpty ? Center(child: Text('Cart is empty')) : Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.bottomCenter,
          children: [
            CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      CustomMainAppBar(
                        title: 'Cart',
                        showBackIcon: true,
                      ),
                      cubit.cartItemEntity.isEmpty
                          ? SizedBox()
                          : CartHeader(
                              count: context
                                  .read<CartCubit>()
                                  .cartEntity
                                  .cartItemEntity
                                  .length,
                            ),
                      SizedBox(
                        height: context.height * 0.01,
                      )
                    ],
                  ),
                ),
                CartSliverListItems(
                  cartItemEntity: cubit.cartItemEntity,
                ),
              ],
            ),
            cubit.cartItemEntity.isEmpty
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: CustomButton(
                        onPressed: () {},
                        text: 'Checkout ${cubit.calculatTotalPrice()} pound'),
                  ),
          ],
        );
      },
    );
  }
}
