import 'package:flutter/material.dart';
import 'package:souq/core/utlis/constants/constants.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utlis/app_colors.dart';
import 'package:souq/core/utlis/app_text_styles.dart';
import 'package:intl/intl.dart';
import 'package:souq/main.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({super.key, this.SouqAppState});

  final SouqApp? SouqAppState;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DropdownButton(
            icon: Icon(Icons.language),
            alignment: Alignment.center,
            hint: Text(Intl.getCurrentLocale() == 'ar' ? "العربية" : 'English'),
            padding: EdgeInsets.zero,
            iconDisabledColor: Color(
              0xffC9CECF,
            ),
            style: TextStyles.regular16.copyWith(
              color: Color(
                0xffC9CECF,
              ),
            ),
            iconEnabledColor: Color(
              0xffC9CECF,
            ),
            underline: SizedBox(),
            borderRadius: BorderRadius.circular(16),
            dropdownColor: AppColors.primaryColor.withOpacity(0.8),
            elevation: 6,
            isExpanded: false,
            value: SouqAppState,
            onChanged: (value) {
              if (value == 'en') {
                SouqApp.setLocale(context, const Locale('en'));
                Prefs.setBool(kSelectLanguage, true);
              } else if (value == 'ar') {
                SouqApp.setLocale(context, const Locale('ar'));
                Prefs.setBool(kSelectLanguage, true);
              }
              if (value == 'en' || value == 'ar') {
                Prefs.setBool(kSelectLanguage, true);
              }
              Prefs.setBool(kSelectLanguage, true);
            },
            items: [
              DropdownMenuItem(
                onTap: () => Prefs.setBool(kSelectLanguage, true),
                child: Text(
                  'English',
                  style: TextStyles.regular13,
                ),
                value: 'en',
              ),
              DropdownMenuItem(
                onTap: () => Prefs.setBool(kSelectLanguage, true),
                child: Text(
                  'العربية',
                  style: TextStyles.regular13,
                ),
                value: 'ar',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
