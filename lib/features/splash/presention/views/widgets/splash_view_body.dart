import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:souq/constants/constants.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/features/auth/presentation/views/login/sginin_view.dart';
import 'package:souq/features/on_boarding/views/on_boarding_view.dart';
import 'package:souq/views/nav_views/home_view.dart';

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
          children: [
            SvgPicture.asset(
              "assets/Plant.svg",
              matchTextDirection: true,
            ),
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
    bool isOnboardingSeen = Prefs.getBool(
      kIsOnBoardingSeen,
    );
    bool isLogin = Prefs.getBool(
      kIsLogin,
    );
    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      if (isOnboardingSeen) {
        Navigator.pushReplacementNamed(context, SginInView.routeName);
      }
      if (isLogin) {
        Navigator.pushReplacementNamed(context, NavView.routeName);
      } else {
        Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
      }
    });
  }
}
