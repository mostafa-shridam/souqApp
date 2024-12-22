import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utils/app_colors.dart';
import 'package:souq/core/utils/app_text_styles.dart';
import 'package:souq/core/utils/constants/constants.dart';
import 'package:souq/generated/l10n.dart';
import 'package:souq/features/main_view/presentation/views/cubit/main_cubit.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> bottomTitle = [
      S.of(context).NavBarHome,
      S.of(context).NavBarProducts,
      S.of(context).NavBarCart,
      S.of(context).NavBarAccount,
    ];
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
      child: BottomAppBar(
        surfaceTintColor: Prefs.getBool(kIsDarkMode) == false
            ? AppColors.fillColorLight
            : AppColors.fillColorDark,
        shadowColor: Prefs.getBool(kIsDarkMode) == false
            ? AppColors.fillColorDark
            : AppColors.fillColorLight,
        elevation: 66,
        height: 80,
        color: Prefs.getBool(kIsDarkMode) == false
            ? Colors.white
            : AppColors.darkModeColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            MainCubit.get(context).bottomNavIcons.length,
            (index) => MainCubit.get(context).currentIndex == index
                ? BuildSelectedButton(
                    bottomNavIcons: MainCubit.get(context).bottomNavIcons,
                    index: index,
                    title: bottomTitle,
                  )
                : BuildUnSelectedButton(
                    index: index,
                    onPressed: () {
                      MainCubit.get(context).changeIndex(index);
                    },
                    bottomNavIcons: MainCubit.get(context).bottomNavIcons,
                  ),
          ),
        ),
      ),
    );
  }
}

class BuildSelectedButton extends StatelessWidget {
  const BuildSelectedButton({
    super.key,
    required this.index,
    required this.title,
    required this.bottomNavIcons,
  });
  final int index;
  final List<String> title;
  final List<IconData> bottomNavIcons;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: CircleAvatar(
        backgroundColor: AppColors.primaryColor,
        child: Icon(bottomNavIcons[index],
            color: Prefs.getBool(kIsDarkMode) == false
                ? AppColors.fillColorLight
                : AppColors.fillColorDark),
      ),
      label: Padding(
        padding: Intl.defaultLocale == 'en'
            ? EdgeInsets.only(left: 4.0, right: 16.0)
            : EdgeInsets.only(left: 16.0, right: 4.0),
        child: Text(
          title[index],
          style: TextStyles.semiBold13.copyWith(
              color: Prefs.getBool(kIsDarkMode) == false
                  ? AppColors.fillColorDark
                  : AppColors.fillColorLight),
        ),
      ),
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(
            Prefs.getBool(kIsDarkMode) == false
                ? AppColors.fillColorLight
                : AppColors.fillColorDark),
        surfaceTintColor: WidgetStatePropertyAll(AppColors.fillColorLight),
        shadowColor: WidgetStatePropertyAll(
          Prefs.getBool(kIsDarkMode) == false
              ? AppColors.fillColorLight
              : AppColors.fillColorDark,
        ),
        elevation: WidgetStatePropertyAll(0.2),
        padding: WidgetStatePropertyAll(
          EdgeInsets.zero,
        ),
      ),
    );
  }
}

class BuildUnSelectedButton extends StatelessWidget {
  const BuildUnSelectedButton({
    super.key,
    required this.index,
    required this.onPressed,
    required this.bottomNavIcons,
  });
  final int index;
  final VoidCallback onPressed;
  final List<IconData> bottomNavIcons;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      padding: EdgeInsets.symmetric(horizontal: 16),
      onPressed: onPressed,
      icon: Icon(
        bottomNavIcons[index],
        color: AppColors.primaryColor,
      ),
    );
  }
}
