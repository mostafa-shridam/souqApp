import 'package:flutter/material.dart';
import 'package:souq/core/utlis/app_colors.dart';
import 'package:souq/core/utlis/constants/constants.dart';

class CustomChangeItemInAccount extends StatelessWidget {
  const CustomChangeItemInAccount({
    super.key,
    required this.firstIcon,
    required this.itemName,
    required this.onChanged,
    required this.value,
  });
  final IconData firstIcon;
  final String itemName;
  final void Function(bool)? onChanged;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: kHorizontalPadding,
        vertical: kVerticalPadding - 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            firstIcon,
            color: AppColors.primaryColor,
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            itemName,
          ),
          const Spacer(),
          Switch(
            value: value,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
