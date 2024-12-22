import 'package:flutter/material.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utils/constants/constants.dart';

import '../../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../../core/utils/app_text_styles.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({super.key, required this.count});
  final int count;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: const EdgeInsets.symmetric(vertical: 8),
      color: AppColors.primaryColor.withAlpha(40),
      child: Center(
        child: Text(
          Prefs.getBool(kNewLanguage)
              ? 'لديك $count منتجات في سله التسوق'
              : 'You have $count items in your cart',
          style: TextStyles.bold13.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
