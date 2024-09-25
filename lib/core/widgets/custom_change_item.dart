import 'package:flutter/material.dart';
import 'package:souq/core/utlis/app_colors.dart';
import 'package:souq/core/utlis/constants/constants.dart';

import '../services/shared_preferences.dart';

class CustomChangeItemInAccount extends StatelessWidget {
  const CustomChangeItemInAccount({
    super.key,
    required this.firstIcon,
    required this.itemName,
    required this.onChanged,
    required this.value,
    this.thumbIcon,
  });
  final IconData firstIcon;
  final IconData ? thumbIcon;
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
            thumbIcon: WidgetStatePropertyAll(Icon(thumbIcon)),
            activeColor: Prefs.getBool(kIsDarkMode) == false
                ? AppColors.fillColorLight
                : AppColors.fillColorDark,
            activeTrackColor: AppColors.primaryColor,
            inactiveTrackColor: Prefs.getBool(kIsDarkMode) == false
                ? AppColors.fillColorLight
                : AppColors.fillColorDark,
          ),
        ],
      ),
    );
  }
}
