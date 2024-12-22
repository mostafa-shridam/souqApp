import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:souq/core/services/firebase_auth_service.dart';
import 'package:souq/core/utils/app_images.dart';
import 'package:souq/core/utils/constants/constants.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/features/auth/presentation/views/login/sginin_view.dart';
import 'package:souq/features/main_view/presentation/views/main_view.dart';
import 'package:souq/features/on_boarding/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

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
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                Assets.imagesPlant,
                matchTextDirection: true,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 99,
            ),
            child: SvgPicture.asset(Assets.imagesLogo),
          ),
          SvgPicture.asset(
            Assets.imagesCircles,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }

  void excuteNavigation() {
    bool isOnboardingSeen = Prefs.getBool(
      kIsOnBoardingSeen,
    );
    var isSignedIn = FirebaseAuthService().isSignedIn();

    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      if (isOnboardingSeen) {
        if (isSignedIn) {
          Navigator.pushReplacementNamed(
            context,
            MainView.routeName,
          );
        } else {
          Navigator.pushReplacementNamed(
            context,
            SginInView.routeName,
          );
        }
      } else {
        Navigator.pushReplacementNamed(
          context,
          OnBoardingView.routeName,
        );
      }
    });
  }
}
