import 'package:flutter/material.dart';
import 'package:souq/core/utils/app_colors.dart';
import 'package:souq/core/utils/constants/constants.dart';

class CustomSelectItemInAccount extends StatelessWidget {
  const CustomSelectItemInAccount({
    super.key,
    required this.firstIcon,
    required this.secondeIcon,
    required this.itemName,
    required this.onTap,
  });
  final IconData secondeIcon;
  final Widget firstIcon;
  final VoidCallback onTap;
  final String itemName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.symmetric(
            horizontal: kHorizontalPadding, vertical: kVerticalPadding - 4),
        child: Row(
          children: [
            firstIcon,
            const SizedBox(
              width: 12,
            ),
            Text(
              itemName,
            ),
            const Spacer(),
            Icon(
              secondeIcon,
              color: AppColors.primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
