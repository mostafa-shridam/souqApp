import 'package:flutter/material.dart';
import 'package:souq/core/utils/app_colors.dart';

void customShowSnackBar(BuildContext context,
    {required String message, Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: const Duration(seconds: 1),
      backgroundColor: color ?? AppColors.primaryColor,
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
