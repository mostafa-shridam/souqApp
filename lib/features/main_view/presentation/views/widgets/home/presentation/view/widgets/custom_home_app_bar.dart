import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:souq/core/helper_functions/get_user_data.dart';
import 'package:souq/core/utils/app_text_styles.dart';
import 'package:souq/core/utils/app_images.dart';
import 'package:souq/generated/l10n.dart';

import '../../../../../../../../../core/utils/app_colors.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8),
      title: Text(
        S.of(context).HelloBar,
        style: TextStyles.regular16.copyWith(color: Color(0xff949D9E)),
      ),
      subtitle: Text(
        getUserData().name,
        style: TextStyles.bold19,
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(1000),
        child: Image.network(
          getUserData().image,
        
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) {
            return SvgPicture.asset(
              Assets.imagesUser,
              width: 80,
              height: 80,
              fit: BoxFit.fill,
              theme: SvgTheme(currentColor: AppColors.primaryColor),
            );
          },
        ),
      ),
      trailing: GestureDetector(
        onTap: () {},
        child: SvgPicture.asset(Assets.imagesNotification),
      ),
    );
  }
}
