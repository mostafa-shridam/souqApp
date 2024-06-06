import 'package:flutter/material.dart';
import 'package:souq/constants/constants.dart';
import 'package:souq/core/utlis/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.textInputType,
    this.suffixIcon,
    required this.controller,
    this.padding,
    this.validator,
    this.obscureText,
  });

  final String hintText;
  final TextInputType textInputType;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final double? padding;
  final String? Function(String?)? validator;
  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: padding ?? 0.0,
        right: kHorizintalPadding,
        left: kHorizintalPadding,
      ),
      child: TextFormField(
        enableSuggestions: true,
        textCapitalization: TextCapitalization.words,
        obscureText: obscureText ?? false,
        validator: validator,
        controller: controller,
        keyboardType: textInputType,
        decoration: InputDecoration(
          suffixIcon: suffixIcon,
          hintStyle: TextStyles.bold13.copyWith(
            color: const Color(0xFF949D9E),
          ),
          hintText: hintText,
          filled: true,
          fillColor: const Color(0xFFF9FAFA),
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildBorder(),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4),
      borderSide: const BorderSide(
        width: 1,
        color: Color(0xFFE6E9E9),
      ),
    );
  }
}
