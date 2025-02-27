import 'package:flutter/material.dart';
import 'package:souq/core/utils/constants/constants.dart';
import 'package:souq/core/utils/app_colors.dart';
import 'package:souq/core/utils/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onTap,
    required this.text,
    this.maxLines,
    this.horizontalPadding,
    this.verticalPadding,
  });

  final void Function() onTap;
  final String text;
  final double? horizontalPadding;
  final double? verticalPadding;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding ?? 4,
          vertical: verticalPadding ?? kVerticalPadding),
      child: InkWell(
        splashColor: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(
          8.0,
        ),
        onTap: onTap,
        child: Text(
          maxLines: maxLines,
          text,
          style: AppText.regular13.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
