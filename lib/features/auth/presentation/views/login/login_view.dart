import 'package:flutter/material.dart';
import 'package:souq/core/widgets/custom_app_bar.dart';
import 'package:souq/features/auth/presentation/views/login/widgets/login_body.dart';
import 'package:souq/generated/l10n.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  static const String routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        context,
        title: S.of(context).appBarLogin,
        centerTitle: true,
      ),
      body: LoginViewBody(),
    );
  }
}
