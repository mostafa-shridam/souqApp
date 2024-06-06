import 'package:flutter/material.dart';
import 'package:souq/core/utlis/app_text_styles.dart';

AppBar buildAppBar(context, {required String title, bool? centerTitle, void Function()? onTap}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: onTap != null ? GestureDetector(
      onTap: onTap,
      child: const Icon(
        Icons.arrow_back_ios_new,
      ),
    ): SizedBox(),
    centerTitle: centerTitle ?? false,
    title: Text(
      title,
      textAlign: TextAlign.center,
      style: TextStyles.bold19,
    ),
  );
}
