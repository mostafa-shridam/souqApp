import 'package:flutter/material.dart';
import 'package:souq/core/entites/product_entity.dart';

class DetailsViewBody extends StatelessWidget {
  const DetailsViewBody({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(productEntity.productName),
      ],
    );
  }
}