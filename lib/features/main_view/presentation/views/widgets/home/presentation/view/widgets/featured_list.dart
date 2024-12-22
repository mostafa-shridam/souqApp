import 'package:flutter/material.dart';
import 'package:souq/features/main_view/presentation/views/widgets/home/presentation/view/widgets/featured_item.dart';

class FeaturedList extends StatelessWidget {
  const FeaturedList({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          4,
          (index) => const FeaturedItem(),
        ),
      ),
    );
  }
}
