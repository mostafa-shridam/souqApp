import 'package:flutter/material.dart';
import 'package:souq/core/entites/product_entity.dart';

import 'widgets/details_view_body.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});
  static const String routeName = '/details';
  @override
  Widget build(BuildContext context) {
    ProductEntity productEntity =
        ModalRoute.of(context)!.settings.arguments as ProductEntity;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(200),
          child: Image.network(
            productEntity.imageUrl!,
            fit: BoxFit.fill,
            height: 200,
          ),
        ),
      ),
      body: DetailsViewBody(
        productEntity: productEntity,
      ),
    );
  }
}
