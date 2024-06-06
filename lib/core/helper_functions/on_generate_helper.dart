import 'package:flutter/material.dart';
import 'package:souq/features/auth/presentation/views/login/login_view.dart';
import 'package:souq/features/auth/presentation/views/signup/widgets/sign_up_view.dart';
import 'package:souq/features/on_boarding/views/on_boarding_view.dart';
import 'package:souq/features/splash/presention/views/splash_view.dart';
import 'package:souq/features/splash/presention/views/widgets/splash_view_body.dart';
import 'package:souq/views/home_view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (context) => SplashView(),
      );
      case SplashViewBody.routeName:
        return MaterialPageRoute(
          builder: (context) => SplashViewBody(),
        );
    case OnBoardingView.routeName:
      return MaterialPageRoute(
        builder: (context) => OnBoardingView(),
      );
    case HomeView.routeName:
      return MaterialPageRoute(
        builder: (context) => HomeView(),
      );
    case LoginView.routeName:
      return MaterialPageRoute(
        builder: (context) => LoginView(),
      );
    case SignUpView.routeName:
      return MaterialPageRoute(
        builder: (context) => SignUpView(),
      );
  }
  return null;
}
