import 'package:flutter/material.dart';
import 'package:souq/generated/l10n.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Text(
          S.of(context).appBarTitle,
        ),
      ),
    );
  }
}
