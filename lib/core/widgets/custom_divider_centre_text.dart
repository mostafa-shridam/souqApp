import 'package:flutter/material.dart';
import 'package:souq/core/utlis/app_colors.dart';
import 'package:souq/core/utlis/app_text_styles.dart';
import 'package:souq/core/utlis/constants/constants.dart';


class CustomDividerCentreText extends StatelessWidget {
  const CustomDividerCentreText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            indent: kHorizontalPadding,
            endIndent: 8,
            color: AppColors.primaryColor,
          ),
        ),
        Text(
          text,
          style: TextStyles.semiBold16.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
        const Expanded(
          child: Divider(
            indent: 8,
            endIndent: kHorizontalPadding,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}

