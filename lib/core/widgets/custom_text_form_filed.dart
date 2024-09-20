import 'package:flutter/material.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utlis/constants/constants.dart';
import 'package:souq/core/utlis/app_colors.dart';
import 'package:souq/core/utlis/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    required this.controller,
    this.validator,
    this.obscureText,
    this.maxLength,
    this.bottomPadding,
    this.startPadding,
    this.endPadding,
    this.topPadding,
    this.prefixIcon,
  });

  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon, prefixIcon;
  final TextEditingController controller;
  final double? bottomPadding, startPadding, endPadding, topPadding;
  final int? maxLength;
  final String? Function(String?)? validator;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: topPadding ?? 0,
        bottom: bottomPadding ?? kVerticalPadding,
        start: startPadding ?? 0,
        end: endPadding ?? 0,
      ),
      child: TextFormField(
        maxLength: maxLength,
        enableSuggestions: true,
        textCapitalization: TextCapitalization.words,
        obscureText: obscureText ?? false,
        validator: (value) => validator?.call(value),
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintStyle: TextStyles.bold13.copyWith(
            color: const Color(0xFF949D9E),
          ),
          hintText: hintText,
          filled: true,
          border: _buildBorder(),
          fillColor: Prefs.getBool(kIsDarkMode) == false
              ? AppColors.fillColorLight
              : AppColors.fillColorDark,
          enabledBorder: _buildBorder(),
          focusedBorder: _buildBorder(),
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
