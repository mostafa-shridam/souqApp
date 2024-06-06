import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:souq/features/on_boarding/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  static const routeName = 'splash_body';

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    excuteNavigation();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: Locale != 'en' ? MainAxisAlignment.start : MainAxisAlignment.end,
          children: [
            SvgPicture.asset("assets/Plant.svg"),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 99,
          ),
          child: SvgPicture.asset("assets/Logo.svg"),
        ),
        SvgPicture.asset(
          "assets/Circles.svg",
          fit: BoxFit.fill,
        ),
      ],
    );
  }
  void excuteNavigation() {
    Future.delayed(
        Duration(
          seconds: 3,
        ),
            () {
          Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        }
    );
  }
}


