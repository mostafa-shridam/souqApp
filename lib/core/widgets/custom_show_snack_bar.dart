import 'package:flutter/material.dart';
import 'package:souq/core/utlis/app_colors.dart';

void customShowSnackBar(BuildContext context,
    {required String message, Color? color}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color ?? AppColors.primaryColor.withOpacity(0.8),
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}
