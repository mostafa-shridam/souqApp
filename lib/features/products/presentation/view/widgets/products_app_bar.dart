import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:souq/core/utils/app_text_styles.dart';
import 'package:souq/core/utils/app_images.dart';

class CustomMainAppBar extends StatelessWidget {
  const CustomMainAppBar({
    super.key,
    this.showNotificationIcon,
    this.showBackIcon,
    required this.title,
  });
  final bool? showNotificationIcon, showBackIcon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 8),
      leading: showBackIcon ?? false
          ? GestureDetector(
              onTap: () {},
              child: Icon(Icons.arrow_back_ios_new),
            )
          : null,
      title: Center(
        child: Text(
          title,
          style: AppText.bold19,
        ),
      ),
      trailing: showNotificationIcon ?? false
          ? GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(Assets.imagesNotification),
            )
          : null,
    );
  }
}
