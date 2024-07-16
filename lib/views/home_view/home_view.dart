import 'package:flutter/material.dart';
import 'package:souq/views/home_view/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  static const String routeName = 'home';
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeViewBodyItem();
  }
}
