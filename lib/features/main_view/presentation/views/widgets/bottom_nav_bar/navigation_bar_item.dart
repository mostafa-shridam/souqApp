import 'package:flutter/material.dart';
import 'package:souq/features/main_view/presentation/views/widgets/bottom_nav_bar/active_item.dart';

import 'domain/entites/bottom_navigation_bar_entites.dart';
import 'in_active_item.dart';

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({super.key, required this.isSelected, required this.bottomNavigationBarEntites});
  final bool isSelected;
  final BottomNavigationBarEntites bottomNavigationBarEntites;
  @override
  Widget build(BuildContext context) {
    return isSelected ?  ActiveItem(image: bottomNavigationBarEntites.activeImage, title: bottomNavigationBarEntites.name,) :  InActiveItem(image:bottomNavigationBarEntites.inActiveImage);
  }
}
