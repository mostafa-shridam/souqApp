import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/core/cubits/products_cubit/products_cubit.dart';
import 'package:souq/core/entites/product_entity.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utils/app_colors.dart';
import 'package:souq/core/utils/app_text_styles.dart';
import 'package:souq/core/utils/constants/constants.dart';
import 'package:souq/core/widgets/custom_show_snack_bar.dart';

import '../../features/main_view/presentation/views/widgets/cart/presentation/cubit/cart_cubit.dart';
import 'custom_cached_image.dart';

class FruitItem extends StatefulWidget {
  const FruitItem({
    super.key,
    required this.productEntity,
  });
  final ProductEntity productEntity;
  @override
  State<FruitItem> createState() => _FruitItemState();
}

class _FruitItemState extends State<FruitItem> {
  bool isFav = false;
  bool isSelect = false;

  @override
  Widget build(BuildContext context) {
    final productEntity = widget.productEntity;
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        return Container(
          decoration: ShapeDecoration(
            color: Prefs.getBool(kIsDarkMode) == false
                ? AppColors.fillColorLight
                : AppColors.fillColorDark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                4,
              ),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: -8,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      isFav = !isFav;
                      if (isFav == true) {
                        customShowSnackBar(context,
                            message: 'Success Add To Favourite',
                            color: Colors.green.shade200);
                      } else {
                        customShowSnackBar(context,
                            message: 'Success Remove From Favourite',
                            color: Colors.red.shade200);
                      }
                    });
                  },
                  icon: isFav
                      ? Icon(Icons.favorite)
                      : Icon(Icons.favorite_outline),
                ),
              ),
              Positioned.fill(
                top: 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomNetWorkImage(imageUrl: productEntity.imageUrl!),
                    SizedBox(
                      height: 24,
                    ),
                    ListTile(
                      title: Text(
                        productEntity.productName,
                        textAlign: TextAlign.start,
                        style: TextStyles.bold16,
                      ),
                      subtitle: Text.rich(TextSpan(
                        text: ' جنية ${productEntity.price}',
                        style: TextStyles.regular13.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                        children: [
                          TextSpan(
                            text: '/ ${productEntity.unitAmount}',
                            style: TextStyles.regular13.copyWith(
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        ],
                      )),
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            isSelect = !isSelect;
                            if (isSelect == true) {
                              context
                                  .read<CartCubit>()
                                  .addProductToCart(productEntity);
                              customShowSnackBar(context,
                                  message: 'Success Add To Cart',
                                  color: Colors.green.shade200);
                            } else {
                              context
                                  .read<CartCubit>()
                                  .removeItem(productEntity);
                              customShowSnackBar(context,
                                  message: 'Success Remove From Cart',
                                  color: Colors.red.shade200);
                            }
                          });
                        },
                        icon: isSelect
                            ? CircleAvatar(
                                backgroundColor: AppColors.primaryColor,
                                child: Icon(
                                  Icons.add,
                                  color: Prefs.getBool(kIsDarkMode) == false
                                      ? AppColors.fillColorLight
                                      : AppColors.fillColorDark,
                                ),
                              )
                            : Icon(Icons.add),
                        padding: EdgeInsetsDirectional.zero,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
