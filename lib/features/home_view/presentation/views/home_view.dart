import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/home_view/presentation/views/cubit/home_cubit.dart';

import 'widgets/bottom_nav_bar/second_custom_navigation_bar.dart';

class HomeView extends StatelessWidget {
  static const String routeName = 'home';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: HomeCubit.get(context).homeWidgets.elementAt(
                  HomeCubit.get(context).currentIndex,
                ),
          ),
          bottomNavigationBar: SecondCustomNavigationBar(),
        );
      },
    );
  }
}
