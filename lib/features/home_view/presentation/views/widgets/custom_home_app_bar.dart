import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:souq/core/helper_functions/get_user_data.dart';
import 'package:souq/core/utlis/app_text_styles.dart';
import 'package:souq/core/utlis/constants/app_images.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8),
      title: Text(
        'صباح الخير !..',
        style: TextStyles.regular16.copyWith(color: Color(0xff949D9E)),
      ),
      subtitle: Text(
        getUserData().name,
        style: TextStyles.bold19,
      ),
      leading: Image.asset(Assets.imagesFarwla),
      trailing: GestureDetector(
        onTap: () {},
        child: SvgPicture.asset(Assets.imagesNotification),
      ),
    );
  }
}
