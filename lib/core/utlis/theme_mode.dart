import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:souq/core/utlis/app_colors.dart';

ThemeData themeDataLight() {
  TextStyle textColor = TextStyle(color: AppColors.fillColorDark);
  return ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryColor,
    ),
    fontFamily: 'Cairo',
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
      ),
    ),
    toggleButtonsTheme: ToggleButtonsThemeData(
      borderColor: AppColors.primaryColor,
      selectedBorderColor: AppColors.primaryColor,
      selectedColor: AppColors.primaryColor,
      fillColor: AppColors.primaryColor,
      color: AppColors.primaryColor,
      splashColor: AppColors.primaryColor.withOpacity(0.1),
      highlightColor: AppColors.primaryColor.withOpacity(0.1),
      hoverColor: AppColors.primaryColor.withOpacity(0.1),
      focusColor: AppColors.primaryColor.withOpacity(0.1),
      disabledColor: AppColors.primaryColor.withOpacity(0.1),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStatePropertyAll(AppColors.fillColorLight),
      fillColor: WidgetStatePropertyAll(AppColors.primaryColor),
    ),
    textTheme: TextTheme(
      bodyMedium: textColor,
      bodyLarge: textColor,
      bodySmall: textColor,
      displayLarge: textColor,
      displayMedium: textColor,
      displaySmall: textColor,
      headlineLarge: textColor,
      headlineMedium: textColor,
      headlineSmall: textColor,
      labelLarge: textColor,
      labelMedium: textColor,
      labelSmall: textColor,
      titleLarge: textColor,
      titleMedium: textColor,
      titleSmall: textColor,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
      ),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
      selectionColor: AppColors.primaryColor,
      selectionHandleColor: AppColors.primaryColor,
    ),
  );
}

Color textColorDark = AppColors.fillColorLight;

ThemeData themeDataDark() {
  TextStyle textColor = TextStyle(color: AppColors.fillColorLight);

  return ThemeData(
    fontFamily: 'Cairo',
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.darkModeColor,
    brightness: Brightness.dark,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.darkModeColor,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: AppColors.darkModeColor,
        statusBarIconBrightness: Brightness.light,
      ),
    ),
    toggleButtonsTheme: ToggleButtonsThemeData(
      borderColor: AppColors.primaryColor,
      selectedBorderColor: AppColors.primaryColor,
      selectedColor: AppColors.primaryColor,
      fillColor: AppColors.primaryColor,
      color: AppColors.primaryColor,
      splashColor: AppColors.primaryColor.withOpacity(0.1),
      highlightColor: AppColors.primaryColor.withOpacity(0.1),
      hoverColor: AppColors.primaryColor.withOpacity(0.1),
      focusColor: AppColors.primaryColor.withOpacity(0.1),
      disabledColor: AppColors.primaryColor.withOpacity(0.1),
    ),
    textTheme: TextTheme(
      bodyMedium: textColor,
      bodyLarge: textColor,
      bodySmall: textColor,
      displayLarge: textColor,
      displayMedium: textColor,
      displaySmall: textColor,
      headlineLarge: textColor,
      headlineMedium: textColor,
      headlineSmall: textColor,
      labelLarge: textColor,
      labelMedium: textColor,
      labelSmall: textColor,
      titleLarge: textColor,
      titleMedium: textColor,
      titleSmall: textColor,
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.primaryColor,
      selectionColor: AppColors.primaryColor.withOpacity(0.1),
      selectionHandleColor: AppColors.primaryColor.withOpacity(0.1),
    ),
  );
}
