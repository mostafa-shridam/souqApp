import 'package:flutter/material.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utils/app_colors.dart';
import 'package:souq/core/utils/app_text_styles.dart';
import 'package:souq/core/utils/constants/constants.dart';
import 'package:souq/generated/l10n.dart';

class FeaturedItemButton extends StatelessWidget {
  const FeaturedItemButton({super.key, required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32,
      child: TextButton(
        style: TextButton.styleFrom(
          shadowColor: AppColors.primaryColor,
          surfaceTintColor: AppColors.primaryColor,
          splashFactory: InkSplash.splashFactory,
          shape: RoundedRectangleBorder(
            
            borderRadius: BorderRadius.circular(
              4,
            ),
          ),
          backgroundColor: Prefs.getBool(kIsDarkMode) == false
              ? AppColors.fillColorLight
              : AppColors.fillColorDark,
        ),
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: FittedBox(
            child: Text(
              S.of(context).shopNowButton,
              textAlign: TextAlign.center,
              style: AppText.bold13.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
