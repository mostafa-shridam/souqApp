import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/core/widgets/products_bloc_builder.dart';
import '../../../../../../../../../core/cubits/products_cubit/products_cubit.dart';
import 'best_selleling_header.dart';
import 'custom_home_app_bar.dart';
import 'custom_serch_text_field.dart';
import 'featured_list.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getBesSellingProducts();
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
                CustomHomeAppBar(),
                CustomSerchTextField(),
                FeaturedList(),
                SizedBox(
                  height: 12,
                ),
                BestSellelingHeader(),
                SizedBox(
                  height: 8,
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
