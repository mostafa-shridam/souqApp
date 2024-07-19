import 'package:flutter/material.dart';
import 'package:souq/core/widgets/custom_drop_down.dart';
import 'package:souq/generated/l10n.dart';

class SelectLangugeView extends StatelessWidget {
  const SelectLangugeView({super.key});
  static const String routeName = 'selectLang';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).SelectLanguage),
        centerTitle: true,
      ),
      body: Center(
        child: CustomDropDown(
          isSelectLang: true,
        ),
      ),
    );
  }
}
