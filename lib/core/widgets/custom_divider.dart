import 'package:flutter/material.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utils/app_colors.dart';
import 'package:souq/core/utils/app_text_styles.dart';
import 'package:souq/core/utils/constants/constants.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
  
  color: Prefs.getBool(kIsDarkMode) == false ? AppColors.fillColorLight : AppColors.fillColorDark,
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: kHorizontalPadding,
        vertical: 6,
      ),
      margin: const EdgeInsetsDirectional.symmetric(
        vertical: kVerticalPadding,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: AppText.semiBold13,
          ),
        ],
      ),
    );
  }
}
