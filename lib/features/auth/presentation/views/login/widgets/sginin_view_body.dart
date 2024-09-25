import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:souq/core/utlis/constants/app_images.dart';
import 'package:souq/core/utlis/constants/constants.dart';
import 'package:souq/core/widgets/custom_button.dart';
import 'package:souq/core/widgets/custom_divider_centre_text.dart';
import 'package:souq/core/widgets/custom_social_button.dart';
import 'package:souq/core/widgets/custom_text_button.dart';
import 'package:souq/core/widgets/custom_text_form_filed.dart';
import 'package:souq/features/auth/presentation/views/cubits/signin_cubit/signin_cubit.dart';
import 'package:souq/features/auth/presentation/views/signup/widgets/sign_up_view.dart';
import 'package:souq/features/forget_password/forget_password_view.dart';
import 'package:souq/generated/l10n.dart';

class SginInViewBody extends StatefulWidget {
  const SginInViewBody({
    super.key,
  });

  @override
  State<SginInViewBody> createState() => _SginInViewBodyState();
}

class _SginInViewBodyState extends State<SginInViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  bool isPass = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Column(
            children: [
              CustomTextFormField(
                endPadding: kHorizontalPadding,
                startPadding: kHorizontalPadding,
                suffixIcon: Icon(
                  Icons.email_outlined,
                  color: Color(
                    0xffC9CECF,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid "@"';
                  }
                  return null;
                },
                controller: emailController,
                hintText: S.of(context).emailHintText,
                textInputType: TextInputType.emailAddress,
              ),
              CustomTextFormField(
                endPadding: kHorizontalPadding,
                startPadding: kHorizontalPadding,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                obscureText: isPass,
                suffixIcon: IconButton(
                  splashRadius: 112,
                  splashColor: Color(
                    0xfff6fdff,
                  ),
                  onPressed: () {
                    isPass = !isPass;
                    setState(() {});
                  },
                  icon: Icon(
                    isPass ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                    color: Color(
                      0xffC9CECF,
                    ),
                  ),
                ),
                controller: passwordController,
                hintText: S.of(context).passHintText,
                textInputType: TextInputType.text,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomTextButton(
                    horizontalPadding: kHorizontalPadding,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ForgetPasswordView.routeName,
                      );
                    },
                    text: S.of(context).forgetPass,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    SignInCubit.get(context).signInWithEmailAndPassword(
                      emailController.text,
                      passwordController.text,
                    );
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
                text: S.of(context).loginButton,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).createAccountQuestion,
                  ),
                  CustomTextButton(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpView.routeName);
                    },
                    text: S.of(context).createAccount,
                  ),
                ],
              ),
              CustomDividerCentreText(
                text: S.of(context).loginDivider,
              ),
              SizedBox(
                height: 30,
              ),
              SocialLoginButton(
                image: Assets.imagesGoogle,
                title: S.of(context).googleButton,
                onPressed: () {
                  SignInCubit.get(context).signInWithGoogle();
                },
              ),
              SizedBox(
                height: 12,
              ),
              SocialLoginButton(
                image: Assets.imagesFaceBook,
                title: S.of(context).facebookButton,
                onPressed: () {
                  SignInCubit.get(context).signInWithFacebook();
                },
              ),
              Platform.isIOS
                  ? Column(
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        SocialLoginButton(
                          image: Assets.imagesApple,
                          title: S.of(context).appleButton,
                          onPressed: () {
                            SignInCubit.get(context).signInWithApple();
                          },
                        ),
                      ],
                    )
                  : const SizedBox(),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
