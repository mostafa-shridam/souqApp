import 'package:flutter/material.dart';

const kHorizontalPadding = 16.0;
const kVerticalPadding = 16.0;
const kIsOnBoardingSeen = 'isOnBoardingSeen';
const kIsLogin = 'isLogin';
const kUserData = 'UserData';
const kWebProvider = 'AIzaSyBsxJXiNFQB4QP_jwM8Nhzj4OJdNajJI18';
const kIsDarkMode = 'isDark';
const kNewLanguage = 'newLang';
const kChangeNotification = 'notification';
const kAppFontFamily = 'Cairo';
extension HeightExtension on BuildContext {
   double get height => MediaQuery.of(this).size.height;
   double get width => MediaQuery.of(this).size.width;
}