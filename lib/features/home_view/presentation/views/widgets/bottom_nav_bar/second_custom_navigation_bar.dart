import 'package:flutter/material.dart';
import 'package:souq/features/home_view/presentation/views/cubit/home_cubit.dart';
import '../../../../../../core/services/shared_preferences.dart';
import '../../../../../../core/utlis/app_colors.dart';
import '../../../../../../core/utlis/constants/constants.dart';
import 'domain/entites/bottom_navigation_bar_entites.dart';
import 'navigation_bar_item.dart';

class SecondCustomNavigationBar extends StatelessWidget {
  const SecondCustomNavigationBar({super.key, required this.cubit});
  final HomeCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Prefs.getBool(kIsDarkMode) == false
            ? Colors.white
            : AppColors.darkModeColor,
        boxShadow: [
          BoxShadow(
            color: Prefs.getBool(kIsDarkMode) == false
                ? Color(0x19000000)
                : const Color(0x181F1F1F),
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
      child: Row(
        children: bottomNavigationBarEntites.asMap().entries.map((e) {
          var index = e.key;
          var entity = e.value;

          return Expanded(
            flex: cubit.currentIndex == index ? 3 : 2,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                cubit.changeIndex(index);
              },
              child: NavigationBarItem(
                isSelected: index == cubit.currentIndex,
                bottomNavigationBarEntites: entity,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
