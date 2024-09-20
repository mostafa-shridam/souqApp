import 'package:flutter/material.dart';
import 'package:souq/core/widgets/custom_app_bar.dart';
import 'package:souq/features/edit_account/presentation/views/widgets/edit_account_view_body.dart';


class EditAccountView extends StatelessWidget {
  const EditAccountView({super.key});
  static const String routeName = 'Edit';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const EditAccountViewBody(),
      appBar: customAppBar(
        context,
        title: 'تعديل الحساب',
        centerTitle: true,
        leading: () => Navigator.pop(context),
      ),
    );
  }
}
