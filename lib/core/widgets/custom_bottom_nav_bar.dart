import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:souq/core/utlis/app_colors.dart';
import 'package:souq/core/utlis/app_text_styles.dart';


ElevatedButton buildSelectedButton(
    int index, List<String> title, currentIndex) {
  void itemTapped() {
    currentIndex = index;
  }

  return ElevatedButton.icon(
    onPressed: () {
      itemTapped();
    },
    icon: CircleAvatar(
      backgroundColor: AppColors.primaryColor,
      child: Icon(bottomNavIcons[index], color: Colors.white),
    ),
    label: Padding(
      padding: Intl.defaultLocale == 'en'
          ? EdgeInsets.only(left: 4.0, right: 16.0)
          : EdgeInsets.only(left: 16.0, right: 4.0),
      child: Text(
        title[index],
        style: TextStyles.semiBold13,
      ),
    ),
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(AppColors.fillColor),
      surfaceTintColor: WidgetStatePropertyAll(AppColors.fillColor),
      shadowColor: WidgetStatePropertyAll(AppColors.fillColor),
      elevation: WidgetStatePropertyAll(0.2),
      padding: WidgetStatePropertyAll(
        EdgeInsets.zero,
      ),
    ),
  );
}

List<IconData> bottomNavIcons = [
  CupertinoIcons.house_fill,
  CupertinoIcons.rectangle_grid_2x2,
  CupertinoIcons.cart_fill,
  CupertinoIcons.person_alt,
];
