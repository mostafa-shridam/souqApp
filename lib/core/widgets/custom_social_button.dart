import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utils/app_colors.dart';
import 'package:souq/core/utils/constants/constants.dart';
import 'package:souq/core/utils/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton(
      {super.key,
      required this.image,
      required this.title,
      required this.onPressed});

  final String image;
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: SizedBox(
        width: double.infinity,
        height: 56,
        child: TextButton(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                color: Prefs.getBool(kIsDarkMode) == false
                    ? AppColors.fillColorLight
                    : AppColors.fillColorDark,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          onPressed: onPressed,
          child: ListTile(
            visualDensity: const VisualDensity(
              vertical: VisualDensity.minimumDensity,
            ),
            leading: SvgPicture.asset(image),
            title: Text(
              title,
              textAlign: TextAlign.center,
              style: AppText.semiBold16,
            ),
          ),
        ),
      ),
    );
  }
}
