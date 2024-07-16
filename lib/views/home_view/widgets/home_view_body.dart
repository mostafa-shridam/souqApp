import 'package:flutter/material.dart';
import 'package:souq/models/item_model.dart';
import 'package:souq/views/home_view/widgets/custom_card.dart';

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
    return CustomCard(itemModelData: itemModel);
  }
}
