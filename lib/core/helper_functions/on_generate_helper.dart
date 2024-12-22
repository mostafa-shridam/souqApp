import 'package:flutter/material.dart';
import 'package:souq/features/auth/presentation/views/login/sginin_view.dart';
import 'package:souq/features/auth/presentation/views/signup/widgets/sign_up_view.dart';
import 'package:souq/features/main_view/presentation/views/widgets/best_selling/presentation/views/best_selling_view.dart';
import 'package:souq/features/edit_account/presentation/views/edit_account_view.dart';
import 'package:souq/features/forget_password/forget_password_view.dart';
import 'package:souq/features/on_boarding/views/on_boarding_view.dart';
import 'package:souq/features/splash/presention/views/splash_view.dart';
import 'package:souq/features/main_view/presentation/views/main_view.dart';

import '../../features/main_view/presentation/views/widgets/details/presentation/view/details_view.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (context) => SplashView(),
      );
    case OnBoardingView.routeName:
      return MaterialPageRoute(
        builder: (context) => OnBoardingView(),
      );
    case ForgetPasswordView.routeName:
      return MaterialPageRoute(
        builder: (context) => ForgetPasswordView(),
      );
    case SginInView.routeName:
      return MaterialPageRoute(
        builder: (context) => SginInView(),
      );
    case SignUpView.routeName:
      return MaterialPageRoute(
        builder: (context) => SignUpView(),
      );
    case MainView.routeName:
      return MaterialPageRoute(
        builder: (context) => MainView(),
      );
    case EditAccountView.routeName:
      return MaterialPageRoute(
        builder: (context) => EditAccountView(),
      );
    case BestSellingView.routeName:
      return MaterialPageRoute(
        builder: (context) => BestSellingView(),
      );
    case DetailsView.routeName:
      return MaterialPageRoute(
          builder: (context) => DetailsView(), settings: settings);
  }
  return null;
}
