import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:souq/constants/constants.dart';
import 'package:souq/core/utlis/app_colors.dart';
import 'package:souq/core/utlis/app_text_styles.dart';
import 'package:souq/core/widgets/custom_button.dart';
import 'package:souq/core/widgets/custom_text_button.dart';
import 'package:souq/core/widgets/custom_text_form_filed.dart';
import 'package:souq/features/auth/presentation/views/login/login_view.dart';
import 'package:souq/generated/l10n.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({
    super.key,
  });

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  bool isPass = false;
  bool agreeToTerms = false;

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Column(
            children: [
              CustomTextFormField(
                suffixIcon: Icon(
                  CupertinoIcons.person,
                  color: Color(
                    0xffC9CECF,
                  ),
                ),
                padding: 28,
                validator: (value) {
                  if (value!.isEmpty) {
                    return S.of(context).validatorName;
                  }
                  return null;
                },
                controller: nameController,
                hintText: S.of(context).nameHintText,
                textInputType: TextInputType.emailAddress,
              ),
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
                    return S.of(context).validateEmail;
                  }
                  if (!value.contains('@')) {
                    return S.of(context).validateEmailCheck;
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
                    return S.of(context).validatePass;
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
                    isPass ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                    color: Color(
                      0xffC9CECF,
                    ),
                  ),
                ),
                controller: passwordController,
                hintText: S.of(context).passHintText,
                textInputType: TextInputType.text,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: kHorizintalPadding - 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Checkbox(
                      isError: agreeToTerms == false ? false : true,
                      splashRadius: 10,
                      tristate: agreeToTerms == true ? false : true,
                      side: BorderSide(style: BorderStyle.solid),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      activeColor: AppColors.primaryColor,
                      value: agreeToTerms,
                      onChanged: (value) {
                        setState(() {
                          agreeToTerms = value!;
                        });
                      },
                    ),
                    Text(
                      S.of(context).agreeConditions,
                      style: TextStyles.regular13,
                    ),
                    CustomTextButton(
                      horizontalPadding: 4,
                      onTap: () {
                        // Open Terms and Conditions page or dialog
                        showTermsAndConditionsDialog(context);
                      },
                      text: S.of(context).conditions,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    passwordController.text;
                    emailController.text;
                    nameController.text;
                  }
                },
                text: S.of(context).signUpButton,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    S.of(context).haveAccountQuestion,
                  ),
                  CustomTextButton(
                    onTap: () {
                      Navigator.pushReplacementNamed(
                          context, LoginView.routeName);
                    },
                    text: S.of(context).haveAccount,
                  ),
                ],
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
