import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:souq/constants/constants.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/widgets/custom_button.dart';
import 'package:souq/core/widgets/custom_divider.dart';
import 'package:souq/core/widgets/custom_text_button.dart';
import 'package:souq/core/widgets/custom_text_form_filed.dart';
import 'package:souq/features/auth/presentation/views/cubits/signin_cubit/signin_cubit.dart';
import 'package:souq/features/auth/presentation/views/signup/widgets/sign_up_view.dart';
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
                suffixIcon: Icon(
                  Icons.email_outlined,
                  color: Color(
                    0xffC9CECF,
                  ),
                ),
                padding: 28,
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
                    onTap: () {},
                    text: S.of(context).forgetPass,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                onPressed: () {
                  Prefs.setBool(kIsLogin, true);

                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    SignInCubit.get(context).signInWithEmailAndPassword(
                        emailController.text, passwordController.text);
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
              CustomDivider(
                text: S.of(context).loginDivider,
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                borderSideWidth: 1,
                borderSideColor: 0xffDDDFDF,
                icon: 'assets/Google.svg',
                textColor: Colors.black,
                color: Color(0xffFFFFFF),
                onPressed: () {
                  SignInCubit.get(context).signInWithGoogle();
                },
                text: S.of(context).googleButton,
              ),
              SizedBox(
                height: 12,
              ),
              CustomButton(
                borderSideWidth: 1,
                borderSideColor: 0xffDDDFDF,
                icon: 'assets/FaceBook.svg',
                textColor: Colors.black,
                color: Color(0xffFFFFFF),
                onPressed: () {
                  SignInCubit.get(context).signInWithFacebook();
                },
                text: S.of(context).facebookButton,
              ),
              SizedBox(
                height: 12,
              ),
              CustomButton(
                borderSideWidth: 1,
                borderSideColor: 0xffDDDFDF,
                icon: 'assets/Apple.svg',
                textColor: Colors.black,
                color: Color(0xffFFFFFF),
                onPressed: () {},
                text: S.of(context).appleButton,
              ),
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
