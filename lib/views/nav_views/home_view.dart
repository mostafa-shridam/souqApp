import 'package:flutter/material.dart';
import 'package:souq/core/utlis/app_colors.dart';
import 'package:souq/core/widgets/custom_app_bar.dart';
import 'package:souq/core/widgets/custom_bottom_nav_bar.dart';
import 'package:souq/generated/l10n.dart';
import 'package:souq/views/cart_view/cart_view.dart';
import 'package:souq/views/home_view/home_view.dart';
import 'package:souq/views/products_view/products_view.dart';
import 'package:souq/views/settings_view/account_View.dart';

class NavView extends StatefulWidget {
  static const String routeName = 'homeView';

  const NavView({
    super.key,
  });

  @override
  State<NavView> createState() => _NavViewState();
}

class _NavViewState extends State<NavView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<String> title = [
      S.of(context).NavBarHome,
      S.of(context).NavBarProducts,
      S.of(context).NavBarCart,
      S.of(context).NavBarAccount,
    ];
    return Scaffold(
      extendBody: true,
      appBar: buildAppBar(
        context,
        title: title[currentIndex],
        centerTitle: true,
      ),
      body: screens.elementAt(currentIndex),
      bottomNavigationBar: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),
        ),
        child: BottomAppBar(
          surfaceTintColor: Colors.white,
          shadowColor: Colors.black,
          elevation: 66,
          height: 80,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              bottomNavIcons.length,
              (index) => currentIndex == index
                  ? buildSelectedButton(index, title, currentIndex)
                  : buildUnSelectedButton(index),
            ),
          ),
        ),
      ),
    );
  }

  IconButton buildUnSelectedButton(int index) {
    return IconButton(
        padding: EdgeInsets.symmetric(horizontal: 16),
        onPressed: () {
          currentIndex = index;
          setState(() {});
        },
        icon: Icon(
          bottomNavIcons[index],
          color: AppColors.primaryColor,
        ));
  }
}

List<Widget> screens = [
  HomeView(),
  ProductsView(),
  CartView(),
  AccountView(),
];


