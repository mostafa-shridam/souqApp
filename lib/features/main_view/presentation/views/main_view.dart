import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/main_view/presentation/views/widgets/bottom_nav_bar/second_custom_navigation_bar.dart';
import 'package:souq/features/main_view/presentation/views/cubit/main_cubit.dart';

class MainView extends StatelessWidget {
  static const String routeName = 'home';
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: MainCubit.get(context).currentIndex,
              children: MainCubit.get(context).homeWidgets,
            ),
          ),
          bottomNavigationBar: SecondCustomNavigationBar(
            cubit: MainCubit.get(context),
          ),
        );
      },
    );
  }
}
