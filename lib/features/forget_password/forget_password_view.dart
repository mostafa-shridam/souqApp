import 'package:flutter/material.dart';
import 'package:souq/core/widgets/custom_app_bar.dart';
import 'package:souq/features/forget_password/widgets/forget_password_view_body.dart';
import 'package:souq/generated/l10n.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});
  static const String routeName = 'forgetPass';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: S.of(context).ForgetPassTitle,
        centerTitle: true,
        leading: () => Navigator.pop(context),
      ),
      body: ForgetPasswordViewBody(),
    );
  }
}
