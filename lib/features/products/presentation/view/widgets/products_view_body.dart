import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/main_view/presentation/views/widgets/home/presentation/view/widgets/best_selleling_header.dart';
import 'package:souq/features/products/presentation/view/widgets/products_view_header.dart';
import 'package:souq/generated/l10n.dart';

import '../../../../../core/cubits/products_cubit/products_cubit.dart';
import '../../../../../core/widgets/products_bloc_builder.dart';
import '../../../../main_view/presentation/views/widgets/home/presentation/view/widgets/custom_serch_text_field.dart';
import 'filtered_list_products.dart';
import 'products_app_bar.dart';

class ProductsViewBody extends StatefulWidget {
  const ProductsViewBody({super.key});

  @override
  State<ProductsViewBody> createState() => _ProductsViewBodyState();
}

class _ProductsViewBodyState extends State<ProductsViewBody> {
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                CustomMainAppBar(
                  title: S.of(context).ProductsAppBar,
                  showNotificationIcon: true,
                  showBackIcon: false,
                ),
                CustomSerchTextField(),
                ProductsViewHeader(
                  resultLeanth: context.read<ProductsCubit>().resultLeanth,
                ),
                SizedBox(
                  height: 120,
                  child: FilteredListProducts(),
                ),
                BestSellelingHeader(),
                SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
          ProductsBlocBuilder(),
        ],
      ),
    );
  }
}
