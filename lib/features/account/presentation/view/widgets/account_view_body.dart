import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utlis/app_colors.dart';
import 'package:souq/core/utlis/app_text_styles.dart';
import 'package:souq/core/utlis/constants/app_images.dart';
import 'package:souq/core/utlis/constants/constants.dart';
import 'package:souq/core/widgets/custom_change_item.dart';
import 'package:souq/core/widgets/custom_check_box.dart';
import 'package:souq/core/widgets/custom_divider.dart';
import 'package:souq/core/widgets/custom_select_item.dart';
import 'package:souq/features/account/cubit/account_cubit.dart';
import 'package:souq/features/account/presentation/view/widgets/account_app_bar.dart';
import 'package:souq/features/auth/presentation/views/login/sginin_view.dart';
import 'package:souq/features/edit_account/presentation/views/edit_account_view.dart';
import 'package:souq/generated/l10n.dart';

class AccountViewBody extends StatelessWidget {
  const AccountViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountCubit, AccountState>(
      builder: (context, state) {
        final accountCubit = AccountCubit.get(context);

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AccountAppBar(accountCubit: accountCubit),
              CustomDivider(
                text: S.of(context).GeneralBarTitle,
              ),
              CustomSelectItemInAccount(
                firstIcon: SvgPicture.asset(Assets.imagesUser),
                secondeIcon: Icons.arrow_forward_ios,
                itemName: '${S.of(context).EditProfile}',
                onTap: () {
                  Navigator.pushNamed(context, EditAccountView.routeName);
                },
              ),
              CustomSelectItemInAccount(
                firstIcon: SvgPicture.asset(
                  Assets.imagesBox,
                  height: 20,
                  width: 20,
                ),
                secondeIcon: Icons.arrow_forward_ios,
                itemName: '${S.of(context).MyOrders}',
                onTap: () {
                  Navigator.pushNamed(context, EditAccountView.routeName);
                },
              ),
              CustomSelectItemInAccount(
                firstIcon: SvgPicture.asset(
                  Assets.imagesEmptyWallet,
                  height: 20,
                  width: 20,
                ),
                secondeIcon: Icons.arrow_forward_ios,
                itemName: '${S.of(context).Payments}',
                onTap: () {
                  Navigator.pushNamed(context, EditAccountView.routeName);
                },
              ),
              CustomSelectItemInAccount(
                firstIcon: Icon(
                  CupertinoIcons.heart,
                  color: AppColors.primaryColor,
                ),
                secondeIcon: Icons.arrow_forward_ios,
                itemName: '${S.of(context).Favourite}',
                onTap: () {
                  Navigator.pushNamed(context, EditAccountView.routeName);
                },
              ),
              CustomSelectItemInAccount(
                firstIcon: Icon(
                  CupertinoIcons.globe,
                  color: AppColors.primaryColor,
                ),
                secondeIcon: Icons.arrow_forward_ios,
                itemName: '${S.of(context).Language}',
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Prefs.getBool(kIsDarkMode) == false
                        ? AppColors.fillColorLight
                        : AppColors.fillColorDark,
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 200,
                        padding: const EdgeInsets.symmetric(
                            horizontal: kHorizontalPadding,
                            vertical: kVerticalPadding),
                        child: CustomModalBottomSheet(
                          accountCubit: accountCubit,
                          state: state,
                        ),
                      );
                    },
                  );
                },
              ),
              CustomChangeItemInAccount(
                firstIcon: Icons.notifications_outlined,
                itemName: '${S.of(context).Notifications}',
                onChanged: (bool change) {
                  accountCubit.changeNotification(change);
                },
                value: Prefs.getBool(kChangeNotification),
              ),
              CustomChangeItemInAccount(
                firstIcon: Icons.edit_outlined,
                thumbIcon: Prefs.getBool(kIsDarkMode) == false
                    ? Icons.light_mode
                    : Icons.dark_mode,
                itemName: '${S.of(context).Theme}',
                onChanged: (bool changeValue) {
                  accountCubit.changeThemeMode(changeValue);
                },
                value: Prefs.getBool(kIsDarkMode),
              ),
              CustomDivider(
                text: S.of(context).HelpBarTitle,
              ),
              CustomSelectItemInAccount(
                firstIcon: Icon(
                  CupertinoIcons.question_circle,
                ),
                secondeIcon: Icons.arrow_forward_ios,
                onTap: () {},
                itemName: S.of(context).WhoAreWe,
              ),
              SizedBox(
                height: kHorizontalPadding,
              ),
              Container(
                color: AppColors.primaryColor.withOpacity(0.7),
                child: Center(
                  child: TextButton(
                    style: ButtonStyle(
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.zero,
                      ),
                    ),
                    onPressed: () {
                      accountCubit.signOut();
                      Navigator.popAndPushNamed(
                        context,
                        SginInView.routeName,
                      );
                      Prefs.setBool(kIsLogin, false);
                    },
                    child: Text(
                      'LogOut',
                      style:
                          TextStyles.semiBold16.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        );
      },
    );
  }
}

class CustomModalBottomSheet extends StatelessWidget {
  const CustomModalBottomSheet({
    super.key,
    required this.accountCubit,
    required this.state,
  });

  final AccountCubit accountCubit;
  final AccountState state;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).SelectLanguage,
        ),
        SizedBox(
          height: 20,
        ),
        InkWell(
          onTap: () {
            accountCubit.changeLanguage(true);
            Navigator.pop(context);
          },
          child: Row(
            children: [
              CustomCheckBox(
                isChacked: Prefs.getBool(kNewLanguage) == true ? true : false,
                onChecked: (value) {
                  accountCubit.changeLanguage(value);
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                width: 10,
              ),
              Text('العربية'),
            ],
          ),
        ),
        Divider(),
        InkWell(
          onTap: () {
            accountCubit.changeLanguage(false);
            Navigator.pop(context);
          },
          child: Row(
            children: [
              CustomCheckBox(
                isChacked: Prefs.getBool(kNewLanguage) == false ? true : false,
                onChecked: (value) {
                  accountCubit.changeLanguage(false);
                  Navigator.pop(context);
                },
              ),
              SizedBox(
                width: 10,
              ),
              Text('English'),
            ],
          ),
        ),
      ],
    );
  }
}

