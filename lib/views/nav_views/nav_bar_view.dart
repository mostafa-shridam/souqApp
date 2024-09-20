import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/core/widgets/custom_bottom_nav_bar.dart';
import 'package:souq/views/nav_views/cubit/nav_bar_cubit.dart';

class NavView extends StatelessWidget {
  static const String routeName = 'homeView';

  const NavView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, NavBarState>(
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          body: HomeCubit.get(context).homeWidgets.elementAt(
                HomeCubit.get(context).currentIndex,
              ),
          bottomNavigationBar: CustomBottomNavBar(),
        );
      },
    );
  }
}
