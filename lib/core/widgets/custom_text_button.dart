import 'package:flutter/material.dart';
import 'package:souq/core/utlis/app_colors.dart';
import 'package:souq/core/utlis/app_text_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.padding,
  });

  final void Function() onPressed;
  final String text;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
      child: TextButton(
        style: ButtonStyle(
          alignment: Alignment.center,
          overlayColor:
          MaterialStatePropertyAll(AppColors.primaryColor.withOpacity(0.1)),
          padding: MaterialStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: 4.0,
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyles.regular13.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
