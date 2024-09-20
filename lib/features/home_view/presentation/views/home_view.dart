import 'package:flutter/material.dart';
import 'package:souq/features/home_view/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  static const String routeName = 'home';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: HomeViewBodyItem());
  }
}
