import 'package:flutter/material.dart';
import 'package:souq/core/utils/app_colors.dart';
import 'package:souq/core/utils/app_text_styles.dart';
import 'package:souq/core/utils/constants/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
    this.textColor,
    this.horizontalPadding,
  });

  final void Function() onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  final double? horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.symmetric(
          horizontal: horizontalPadding ?? kHorizontalPadding),
      child: SizedBox(
        width: double.infinity,
        height: 54,
        child: TextButton(
          style: TextButton.styleFrom(
            shadowColor: AppColors.primaryColor,
            surfaceTintColor: AppColors.primaryColor,
            splashFactory: InkSplash.splashFactory,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            backgroundColor: color ?? AppColors.primaryColor,
          ),
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: AppText.bold16.copyWith(
              color: textColor ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
