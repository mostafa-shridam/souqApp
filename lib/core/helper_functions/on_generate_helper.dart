import 'package:flutter/material.dart';
import 'package:souq/features/splash/presention/views/splash_view.dart';
import 'package:souq/features/splash/presention/views/widgets/splash_view_body.dart';

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
  }
  return null;
}
