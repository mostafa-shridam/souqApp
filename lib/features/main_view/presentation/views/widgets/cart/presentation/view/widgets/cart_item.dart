import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:souq/core/entites/product_entity.dart';
import 'package:souq/core/utils/constants/constants.dart';
import 'package:souq/core/widgets/custom_cached_image.dart';
import 'package:souq/features/main_view/presentation/views/widgets/cart/presentation/domain/cart_item_entity.dart';
import 'package:souq/generated/l10n.dart';

import '../../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../../core/utils/app_images.dart';
import '../../../../../../../../../core/utils/app_text_styles.dart';
import 'cart_action_buttons.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key, required this.cartItemEntity});
  final CartItemEntity cartItemEntity;
  @override
  Widget build(BuildContext context) {
    ProductEntity item = cartItemEntity.productEntity;
    return Container(
      height: context.height * 0.18,
      padding: EdgeInsets.symmetric(
        horizontal: kHorizontalPadding,
        vertical: 8,
      ),
      decoration: ShapeDecoration(
        shape: Border.symmetric(
          horizontal: BorderSide(
            width: 1,
            color: Color(0xffF1F1F5),
          ),
        ),
      ),
      child: Row(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.width * 0.2,
            padding: const EdgeInsets.symmetric(
              vertical: 12,
              horizontal: 12,
            ),
            decoration: BoxDecoration(
              color: Color(0xffF1F1F5),
            ),
            child: CustomNetWorkImage(imageUrl: item.imageUrl!),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.productName,
                  style: TextStyles.bold13,
                ),
                Text(
                  "${cartItemEntity.calculatTotalWeight()} Kilo",
                  style: TextStyles.regular13.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
                SizedBox(
                  height: context.height * 0.04,
                ),
                CartActionButtons(count: cartItemEntity.count),
              ],
            ),
          ),
          Column(
            spacing: context.height * 0.076,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: SvgPicture.asset(Assets.imagesTrash),
              ),
              Text(
                "${cartItemEntity.calculatTotalPrice()} Bound",
                style:
                    TextStyles.bold16.copyWith(color: AppColors.secondaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
