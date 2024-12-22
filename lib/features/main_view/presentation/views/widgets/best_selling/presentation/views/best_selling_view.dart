import 'package:flutter/material.dart';
import 'package:souq/core/widgets/custom_app_bar.dart';
import 'package:souq/features/main_view/presentation/views/widgets/best_selling/presentation/views/widgets/best_selling_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});
  static const String routeName = 'best_selling_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: 'title',
        centerTitle: true,
        leading: () => Navigator.pop(context),
      ),
      body: BestSellingBody(),
    );
  }
}
