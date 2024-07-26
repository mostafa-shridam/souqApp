import 'package:flutter/material.dart';
import 'package:souq/core/utlis/constants/constants.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utlis/app_text_styles.dart';
import 'package:souq/features/auth/presentation/views/login/sginin_view.dart';
import 'package:souq/main.dart';

class AccountView extends StatelessWidget {
  AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {
              Prefs.setBool(kIsOnBoardingSeen, false);
              Navigator.pushReplacementNamed(
                context,
                SginInView.routeName,
              );
            },
            child: Text('Logout'),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                    borderSide: BorderSide.none,
                  ),
                  backgroundColor: Colors.white,
                  insetPadding: EdgeInsets.zero,
                  title: Text(
                    'Change Language',
                    style: TextStyles.bold16,
                  ),
                  contentPadding: EdgeInsets.zero,
                  actions: [
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            SouqApp.setLocale(context, const Locale('en'));
                          },
                          child: Text(
                            "English",
                            style: TextStyles.bold16,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            SouqApp.setLocale(context, const Locale('ar'));
                          },
                          child: Text(
                            "العربية",
                            style: TextStyles.bold16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
            child: Text('Change Lang'),
          ),
        ],
      ),
    );
  }
}
