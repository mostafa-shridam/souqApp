import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:souq/core/utlis/constants/app_images.dart';
import 'package:souq/features/account/cubit/account_cubit.dart';

import '../../../../../core/helper_functions/get_user_data.dart';
import '../../../../../core/services/shared_preferences.dart';
import '../../../../../core/utlis/app_colors.dart';
import '../../../../../core/utlis/app_text_styles.dart';
import '../../../../../core/utlis/constants/constants.dart';

class AccountAppBar extends StatelessWidget {
  const AccountAppBar({
    super.key,
    required this.onFileChanged,
  });
  final ValueChanged<File?> onFileChanged;

  @override
  Widget build(BuildContext context) {
    var accountCubit = AccountCubit.get(context);
    var size = MediaQuery.of(context).size;
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
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.1,
                          vertical: size.height * 0.28,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: accountCubit.fileImage != null
                              ? Image.file(
                                  accountCubit.fileImage!,
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    return SvgPicture.asset(
                                      Assets.imagesUser,
                                      width: 80,
                                      height: 80,
                                    );
                                  },
                                )
                              : Image.network(
                                  getUserData().image,
                                  width: 80,
                                  height: 80,
                                  fit: BoxFit.fill,
                                  errorBuilder: (context, error, stackTrace) {
                                    return SvgPicture.asset(
                                      Assets.imagesUser,
                                      width: 80,
                                      height: 80,
                                    );
                                  },
                                ),
                        ),
                      );
                    },
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(40),
                  child: accountCubit.fileImage != null
                      ? Image.file(
                          accountCubit.fileImage!,
                          height: 80,
                          width: 80,
                          fit: BoxFit.fill,
                        )
                      : getUserData().image.isNotEmpty
                          ? Image.network(
                              getUserData().image,
                              width: 80,
                              height: 80,
                            )
                          : SvgPicture.asset(
                              Assets.imagesUser,
                              width: 80,
                              height: 80,
                            ),
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
                      accountCubit.pickImage();
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
