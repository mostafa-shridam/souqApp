import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/core/utlis/constants/constants.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utlis/app_colors.dart';
import 'package:souq/core/utlis/app_text_styles.dart';
import 'package:souq/features/account/cubit/account_cubit.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        final accountCubit = AccountCubit.get(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DropdownButton(
              icon: Icon(Icons.language),
              alignment: Alignment.center,
              hint: Text(accountCubit.currentLanguage ? "العربية" : 'English'),
              padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
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
              dropdownColor: AppColors.primaryColor.withOpacity(0.6),
              elevation: 6,
              isExpanded: false,
              value: accountCubit.currentLanguage == false ? 'en' : 'ar',
              onChanged: (value) {
                if (value == 'en') {
                  accountCubit.changeLanguage(false);
                  Prefs.setBool(kNewLanguage, false);
                } else if (value == 'ar') {
                  accountCubit.changeLanguage(true);
                  Prefs.setBool(kNewLanguage, true);
                }
              },
              items: [
                DropdownMenuItem(
                  onTap: () => Prefs.setBool(kNewLanguage, true),
                  child: Text(
                    'English',
                    style: TextStyles.regular13,
                  ),
                  value: 'en',
                ),
                DropdownMenuItem(
                  onTap: () => Prefs.setBool(kNewLanguage, false),
                  child: Text(
                    'العربية',
                    style: TextStyles.regular13,
                  ),
                  value: 'ar',
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
