import 'package:flutter/material.dart';
import 'package:souq/core/widgets/custom_app_bar.dart';
import 'package:souq/features/auth/presentation/views/signup/widgets/sgin_up_view_body.dart';
import 'package:souq/generated/l10n.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  static const String routeName = 'SignUp';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        onTap: () {
          return Navigator.pop(context);
        },
        context,
        title: S.of(context).appBarSignUp,
        centerTitle: true,
      ),
      body: SignUpViewBody(),
    );
  }
}