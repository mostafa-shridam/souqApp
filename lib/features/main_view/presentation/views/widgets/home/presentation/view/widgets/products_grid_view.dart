import 'package:flutter/material.dart';
import 'package:souq/core/widgets/fruit_item.dart';

import '../../../../../../../../../core/entites/product_entity.dart';
import '../../../../details/presentation/view/details_view.dart';

class BestSellingGridView extends StatelessWidget {
  const BestSellingGridView({super.key, required this.productsEntity});
  final List<ProductEntity> productsEntity;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: productsEntity.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 163 / 214,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              DetailsView.routeName,
              arguments: productsEntity[index],
            );
          },
          child: FruitItem(
            productEntity: productsEntity[index],
          ),
        );
      },
    );
  }
}
