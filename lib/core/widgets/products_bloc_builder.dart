import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../features/main_view/presentation/views/widgets/home/presentation/view/widgets/products_grid_view.dart';
import '../cubits/products_cubit/products_cubit.dart';
import '../helper_functions/dumy_products.dart';

class ProductsBlocBuilder extends StatelessWidget {
  const ProductsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return BestSellingGridView(
            productsEntity: state.products,
          );
        } else if (state is ProductsFailure) {
          return SliverToBoxAdapter(
            child: Center(
              child: Text(
                state.errMessage,
              ),
            ),
          );
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
