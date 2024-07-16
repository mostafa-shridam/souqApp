import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:souq/core/utlis/app_colors.dart';
import 'package:souq/core/utlis/app_text_styles.dart';
import 'package:souq/core/widgets/custom_app_bar.dart';
import 'package:souq/features/on_boarding/views/on_boarding_view.dart';
import 'package:souq/generated/l10n.dart';
import 'package:souq/views/cart_view/cart_view.dart';
import 'package:souq/views/settings_view/account_View.dart';

class HomeView extends StatefulWidget {
  static const String routeName = 'homeView';

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: title[index],centerTitle: true,),
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        useLegacyColorScheme: false,
        enableFeedback: true,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        unselectedIconTheme: IconThemeData(
          color: AppColors.primaryColor,
        ),
        onTap: (value) {
          index = value;
          setState(() {

          });
        },
        currentIndex: index,
        backgroundColor: Colors.white,
        elevation: 24.0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyles.semiBold11.copyWith(
          color: AppColors.primaryColor,
        ),
        items: [
          BottomNavigationBarItem(
            icon: index == 0
                ? CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              child: Icon(
                CupertinoIcons.house_fill,
                color: Colors.white,
              ),
            )
                : Icon(
              CupertinoIcons.house_fill,
            ),
            label: S.of(context).NavBarHome,
          ),
          BottomNavigationBarItem(
            icon: index == 1
                ? CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              child: Icon(
                CupertinoIcons.rectangle_grid_2x2,
                color: Colors.white,
              ),
            )
                : Icon(
              CupertinoIcons.rectangle_grid_2x2,
            ),
            label: S.of(context).NavBarProducts,
          ),
          BottomNavigationBarItem(
            icon: index == 2
                ? CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              child: Icon(
                CupertinoIcons.cart_fill,
                color: Colors.white,
              ),
            )
                : Icon(
              CupertinoIcons.cart_fill,
            ),
            label: S.of(context).NavBarCart,
          ),
          BottomNavigationBarItem(
            icon: index == 3
                ? CircleAvatar(
              backgroundColor: AppColors.primaryColor,
              child: Icon(
                CupertinoIcons.person_alt,
                color: Colors.white,
              ),
            )
                : Icon(
              CupertinoIcons.person_alt,
            ),
            label: S.of(context).NavBarAccount,
          ),
        ],
      ),
    );
  }
}


List<Widget> screens = [
  AccountView(),
  CartView(),
  ProductsView(),
];
List<String> title = [
  "Home",
  "Products",
  "Cart",
  "Account",
];
