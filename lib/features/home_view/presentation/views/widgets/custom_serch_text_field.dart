import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utlis/app_colors.dart';
import 'package:souq/core/utlis/app_text_styles.dart';
import 'package:souq/core/utlis/constants/app_images.dart';
import 'package:souq/core/utlis/constants/constants.dart';
import 'package:souq/generated/l10n.dart';

class CustomSerchTextField extends StatelessWidget {
  const CustomSerchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: kVerticalPadding,
      ),
      child: Container(
        decoration: ShapeDecoration(
          color: Prefs.getBool(kIsDarkMode) == false
              ? Colors.white
              : AppColors.darkModeColor,
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
            prefixIcon: SizedBox(
              width: 30,
              height: 30,
              child: Center(
                child: SvgPicture.asset(
                  Assets.imagesSearch,
                ),
              ),
            ),
            suffixIcon: SizedBox(
              width: 30,
              child: Center(
                child: SvgPicture.asset(
                  Assets.imagesFilter,
                ),
              ),
            ),
            hintStyle: TextStyles.bold13.copyWith(
              color: const Color(0xFF949D9E),
            ),
            hintText: S.of(context).Searchfor,
            border: _buildBorder(),
            fillColor: Prefs.getBool(kIsDarkMode) == false
                ? AppColors.fillColorLight
                : AppColors.fillColorDark,
            enabledBorder: _buildBorder(),
            focusedBorder: _buildBorder(),
          ),
        ),
      ),
    );
  }
}

OutlineInputBorder _buildBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(4),
    borderSide: BorderSide(
      width: 1,
      color: Prefs.getBool(kIsDarkMode) == false
          ? AppColors.fillColorLight
          : AppColors.fillColorDark,
    ),
  );
}
