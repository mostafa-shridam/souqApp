import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../core/helper_functions/get_user_data.dart';
import '../../../../../core/services/shared_preferences.dart';
import '../../../../../core/utlis/app_colors.dart';
import '../../../../../core/utlis/app_text_styles.dart';
import '../../../../../core/utlis/constants/constants.dart';
import '../../../cubit/account_cubit.dart';

class AccountAppBar extends StatelessWidget {
  const AccountAppBar({super.key, required this.accountCubit});
  final AccountCubit accountCubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: FractionalOffset.bottomCenter,
            clipBehavior: Clip.none,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(40),
                child: Image.network(
                  getUserData().image,
                  width: 80,
                  height: 80,
                ),
              ),
              Positioned(
                bottom: -15,
                child: CircleAvatar(
                  radius: 15,
                  backgroundColor: Prefs.getBool(kIsDarkMode) == false
                      ? AppColors.fillColorLight
                      : AppColors.fillColorDark,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      accountCubit.getNewImage(ImageSource.gallery);
                    },
                    icon: const Icon(
                      CupertinoIcons.camera,
                      color: AppColors.primaryColor,
                      size: 20,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                getUserData().name,
                style: TextStyles.bold13,
              ),
              Text(
                getUserData().email,
                style: TextStyles.regular13,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SecondAccountAppBar extends StatelessWidget {
  const SecondAccountAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        getUserData().name,
        style: TextStyles.regular13,
      ),
      subtitle: Text(
        getUserData().email,
        style: TextStyles.regular16,
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(90),
        child: Image.network(
          getUserData().image,
          cacheHeight: 120,
          cacheWidth: 120,
          fit: BoxFit.cover,
          height: 80,
          width: 80,
        ),
      ),
    );
  }
}
