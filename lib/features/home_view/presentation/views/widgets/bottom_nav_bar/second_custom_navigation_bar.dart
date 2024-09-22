import 'package:flutter/material.dart';

import '../../../../../../core/services/shared_preferences.dart';
import '../../../../../../core/utlis/app_colors.dart';
import '../../../../../../core/utlis/constants/constants.dart';

class SecondCustomNavigationBar extends StatelessWidget {
  const SecondCustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Prefs.getBool(kIsDarkMode) == false
                ? Color(0x19000000)
                : AppColors.fillColorDark,
            spreadRadius: 0,
            blurRadius: 24,
            offset: Offset(0, -2),
          )
        ],
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          topLeft: Radius.circular(30),
        ),
      ),
      
    );
  }
}