import 'package:flutter/material.dart';

void showTermsAndConditionsDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('AppLocalizations.of(context)!.termsAndConditions'),
        content: Text('AppLocalizations.of(context)!.termsAndConditionsText'),
        actions: [
          TextButton(
            child: Text('AppLocalizations.of(context)!.close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
