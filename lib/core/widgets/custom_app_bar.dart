import 'package:flutter/material.dart';
import 'package:souq/core/utils/app_text_styles.dart';

AppBar customAppBar(
  context, {
  required String title,
  bool? centerTitle,
  void Function()? leading,
  List<Widget>? actions,
  IconData? icon,
}) {
  return AppBar(
    actions: actions,
    leading: leading != null
        ? GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              icon ?? Icons.arrow_back_ios_new,
            ),
          )
        : SizedBox(),
    centerTitle: centerTitle ?? false,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: AppText.bold19,
    ),
  );
}
