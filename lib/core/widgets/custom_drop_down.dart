import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/core/utils/constants/constants.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utils/app_colors.dart';
import 'package:souq/core/utils/app_text_styles.dart';
import 'package:souq/features/main_view/presentation/views/widgets/account/cubit/account_cubit.dart';

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
              hint:
                  Text(state is ChangeLanguageSuccess ? "العربية" : 'English'),
              padding: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
              iconDisabledColor: Color(
                0xffC9CECF,
              ),
              style: AppText.regular16.copyWith(
                color: Color(
                  0xffC9CECF,
                ),
              ),
              iconEnabledColor: Color(
                0xffC9CECF,
              ),
              underline: SizedBox(),
              borderRadius: BorderRadius.circular(16),
              dropdownColor: AppColors.primaryColor,
              elevation: 6,
              isExpanded: false,
              value: state is ChangeLanguageSuccess == false ? 'en' : 'ar',
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
                    style: AppText.regular13,
                  ),
                  value: 'en',
                ),
                DropdownMenuItem(
                  onTap: () => Prefs.setBool(kNewLanguage, false),
                  child: Text(
                    'العربية',
                    style: AppText.regular13,
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
