import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:souq/core/cubits/products_cubit/products_cubit.dart';
import 'package:souq/core/utils/constants/constants.dart';
import 'package:souq/core/widgets/fruit_item.dart';

import '../../../../../../../../../core/helper_functions/dumy_products.dart';
import '../../../../home/presentation/view/widgets/products_grid_view.dart';

class BestSellingBody extends StatelessWidget {
  const BestSellingBody({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return GridView.builder(
            padding: EdgeInsets.symmetric(
                vertical: kVerticalPadding, horizontal: 12),
            itemCount: state.products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 163 / 214,
            ),
            itemBuilder: (context, index) {
              return FruitItem(
                productEntity: state.products[index],
              );
            },
          );
        } else if (state is ProductsFailure) {
          return Center(child: Text(state.errMessage));
        } else {
          return Skeletonizer.sliver(
            child: BestSellingGridView(
              productsEntity: getDumyProductsList(),
            ),
          );
        }
      },
    );
  }
}
