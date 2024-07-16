import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:souq/constants/constants.dart';
import 'package:souq/core/utlis/app_colors.dart';
import 'package:souq/core/utlis/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.color,
    this.textColor,
    this.icon,
    this.borderSideColor,
    this.borderSideWidth,
  });

  final void Function() onPressed;
  final String text;
  final Color? color;
  final Color? textColor;
  final String? icon;
  final int? borderSideColor;
  final double? borderSideWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SizedBox(
        width: double.infinity,
        height: 54,
        child: TextButton(
          style: TextButton.styleFrom(
            shadowColor: AppColors.primaryColor.withOpacity(0.1),
            surfaceTintColor: AppColors.primaryColor.withOpacity(0.1),
            splashFactory: InkSplash.splashFactory,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Color(borderSideColor ?? 0xff),
                width: borderSideWidth ?? 0,
              ),
              borderRadius: BorderRadius.circular(
                16,
              ),
            ),
            backgroundColor: color ?? AppColors.primaryColor,
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null)
                SvgPicture.asset(
                  icon!,
                  ),
              Spacer(),
              Text(
                text,
                style: TextStyles.bold16.copyWith(
                  color: textColor ?? Colors.white,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
