import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});
  static const routeName = 'splash_body';
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        SvgPicture.asset("assets/Plant.svg"),
      ],
    );
  }
}
