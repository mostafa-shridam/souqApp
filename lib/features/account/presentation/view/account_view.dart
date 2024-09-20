import 'package:flutter/material.dart';
import 'package:souq/core/widgets/custom_app_bar.dart';
import 'package:souq/features/account/presentation/view/widgets/account_view_body.dart';
import 'package:souq/generated/l10n.dart';


class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: S.of(context).NavBarAccount,
        centerTitle: true,
      ),
      body: const AccountViewBody(),
    );
  }
}
