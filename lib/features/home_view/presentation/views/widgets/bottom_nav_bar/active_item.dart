import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../core/services/shared_preferences.dart';
import '../../../../../../core/utlis/app_colors.dart';
import '../../../../../../core/utlis/app_text_styles.dart';
import '../../../../../../core/utlis/constants/constants.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image, required this.title});
  final String image, title;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsetsDirectional.only(end: 16),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
          color: Prefs.getBool(kIsDarkMode) == false
              ? AppColors.fillColorLight
              : AppColors.fillColorDark,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 30,
              height: 30,
              decoration: ShapeDecoration(
                color: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Center(
                child: SvgPicture.asset(
                  image,
                  height: 20,
                  width: 20,
                ),
              ),
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              title,
              style:
                  TextStyles.semiBold11.copyWith(color: AppColors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
