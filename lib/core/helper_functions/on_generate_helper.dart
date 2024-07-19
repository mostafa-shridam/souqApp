import 'package:flutter/material.dart';
import 'package:souq/features/auth/presentation/views/login/sginin_view.dart';
import 'package:souq/features/auth/presentation/views/signup/widgets/sign_up_view.dart';
import 'package:souq/features/on_boarding/views/on_boarding_view.dart';
import 'package:souq/features/select_language/select_language.dart';
import 'package:souq/features/splash/presention/views/splash_view.dart';
import 'package:souq/features/splash/presention/views/widgets/splash_view_body.dart';
import 'package:souq/views/home_view/home_view.dart';
import 'package:souq/views/item_details_view/item_detials_view.dart';
import 'package:souq/views/nav_views/home_view.dart';

import '../../models/item_model.dart';

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(
        builder: (context) => SplashView(),
      );
    case SelectLangugeView.routeName:
      return MaterialPageRoute(
        builder: (context) => SelectLangugeView(),
      );
    case OnBoardingView.routeName:
      return MaterialPageRoute(
        builder: (context) => OnBoardingView(),
      );
    case NavView.routeName:
      return MaterialPageRoute(
        builder: (context) => NavView(),
      );
    case SginInView.routeName:
      return MaterialPageRoute(
        builder: (context) => SginInView(),
      );
    case SignUpView.routeName:
      return MaterialPageRoute(
        builder: (context) => SignUpView(),
      );
    case HomeView.routeName:
      return MaterialPageRoute(
        builder: (context) => HomeView(),
      );
    case ItemDetailsView.routeName:
      if (settings.name == ItemDetailsView.routeName) {
        final model = settings.arguments as ItemModel;

        return MaterialPageRoute(
          builder: (context) => ItemDetailsView(
            title: model.productName.toString(),
            salary: model.productSalary.toString(),
            image: model.productImage.toString(),
            rate: model.rate!.toDouble(),
            conte: model.conte!.toInt(),
            desc: model.productDesc.toString(),
          ),
        );
      }
  }
  return null;
}
