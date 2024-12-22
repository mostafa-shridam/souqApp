import 'package:flutter/material.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utils/app_colors.dart';
import 'package:souq/core/utils/app_images.dart';
import 'package:souq/core/utils/constants/constants.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key, required this.firstText, required this.secondText});
  final String firstText, secondText;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsetsDirectional.only(
          top: 24,
        ),
        height: 70,
        decoration: BoxDecoration(
          color: Prefs.getBool(kIsDarkMode) == false
              ? Colors.white
              : AppColors.fillColorDark,
          border: Border.all(width: 1, color: Prefs.getBool(kIsDarkMode) == false ? AppColors.fillColorLight : AppColors.darkModeColor),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('$firstText'),
                Text('$secondText'),
              ],
            ),
            Spacer(),
            Image.asset(
              Assets.imagesFarwla,
              height: 40,
              width: 40,
            ),
          ],
        ),
      ),
    );
  }
}
