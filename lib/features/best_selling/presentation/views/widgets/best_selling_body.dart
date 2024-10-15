import 'package:flutter/material.dart';
import 'package:souq/core/utlis/constants/constants.dart';
import 'package:souq/core/widgets/fruit_item.dart';

class BestSellingBody extends StatelessWidget {
  const BestSellingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(vertical: kVerticalPadding,horizontal: 12),
      itemCount: 12,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 163 / 214,
      ),
      itemBuilder: (context, index) {
        return const FruitItem();
      },
    );
  }
}
