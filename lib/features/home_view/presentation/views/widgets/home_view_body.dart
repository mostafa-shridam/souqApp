import 'package:flutter/material.dart';
import 'package:souq/features/home_view/presentation/views/widgets/best_selleling_header.dart';
import 'package:souq/features/home_view/presentation/views/widgets/best_selling_grid_view.dart';
import 'package:souq/features/home_view/presentation/views/widgets/featured_list.dart';
import 'package:souq/models/item_model.dart';
import 'package:souq/features/home_view/presentation/views/widgets/custom_home_app_bar.dart';
import 'package:souq/features/home_view/presentation/views/widgets/custom_serch_text_field.dart';

class HomeViewBodyItem extends StatefulWidget {
  const HomeViewBodyItem({
    super.key,
  });

  @override
  State<HomeViewBodyItem> createState() => _HomeViewBodyItemState();
}

class _HomeViewBodyItemState extends State<HomeViewBodyItem> {
  late final ItemModel itemModel;
  @override
  void initState() {
    super.initState();
    itemModel = ItemModel();
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
          BestSellingGridView(),
        ],
      ),
    );
  }
}
