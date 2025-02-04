import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../../../../core/services/shared_preferences.dart';
import '../../../../../../../../../core/utils/app_colors.dart';
import '../../../../../../../../../core/utils/app_images.dart';
import '../../../../../../../../../core/utils/app_text_styles.dart';
import '../../../../../../../../../core/utils/constants/constants.dart';
import '../../../../../../../../../generated/l10n.dart';

class CustomSerchTextField extends StatelessWidget {
  const CustomSerchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        Prefs.getBool(kIsDarkMode) ?? false; // تخزين حالة الوضع الداكن

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: kVerticalPadding,
      ),
      child: Container(
        decoration: ShapeDecoration(
          color: isDarkMode
              ? AppColors.darkModeColor
              : Colors.white, // استخدام المتغير هنا
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
          shadows: [
            BoxShadow(
              color: Color(0x0A000000),
              blurRadius: 9,
              offset: Offset(0, 2),
              spreadRadius: 0,
            ),
          ],
        ),
        child: TextField(
          enableSuggestions: true,
          textCapitalization: TextCapitalization.words,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            prefixIcon: _buildPrefixIcon(),
            suffixIcon: _buildSuffixIcon(),
            hintStyle: AppText.bold13.copyWith(
              color: const Color(0xFF949D9E),
            ),
            hintText: S.of(context).Searchfor,
            border: _buildBorder(isDarkMode), // تمرير المتغير هنا
            fillColor: isDarkMode
                ? AppColors.fillColorDark
                : AppColors.fillColorLight, // استخدام المتغير هنا
            enabledBorder: _buildBorder(isDarkMode),
            focusedBorder: _buildBorder(isDarkMode),
          ),
        ),
      ),
    );
  }

  // دالة لبناء الـ prefixIcon بشكل منفصل
  Widget _buildPrefixIcon() {
    return SizedBox(
      width: 30,
      height: 30,
      child: Center(
        child: SvgPicture.asset(
          Assets.imagesSearch,
        ),
      ),
    );
  }

  Widget _buildSuffixIcon() {
    return SizedBox(
      width: 30,
      child: Center(
        child: SvgPicture.asset(
          Assets.imagesFilter,
        ),
      ),
    );
  }

  // دالة لبناء الحدود مع تمرير حالة الـ Dark Mode
  OutlineInputBorder _buildBorder(bool isDarkMode) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: BorderSide(
        width: 1,
        color: isDarkMode
            ? AppColors.fillColorDark
            : AppColors.fillColorLight, // استخدام المتغير هنا
      ),
    );
  }
}
