import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:souq/core/utlis/constants/constants.dart';
import 'package:souq/core/widgets/custom_button.dart';
import 'package:souq/core/widgets/custom_show_snack_bar.dart';
import 'package:souq/core/widgets/custom_terms.dart';
import 'package:souq/core/widgets/custom_text_button.dart';
import 'package:souq/core/widgets/custom_text_form_filed.dart';
import 'package:souq/features/auth/presentation/views/cubits/signup_cubit/signup_cubit.dart';
import 'package:souq/features/auth/presentation/views/login/sginin_view.dart';
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
  late bool isTermsAccepted = false;

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidateMode,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 24.0),
          child: Column(
            children: [
              CustomTextFormField(
                endPadding: kHorizontalPadding,
                startPadding: kHorizontalPadding,
                suffixIcon: Icon(
                  CupertinoIcons.person,
                  color: Color(
                    0xffC9CECF,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return S.of(context).validatorName;
                  }
                  return null;
                },
                controller: nameController,
                hintText: S.of(context).nameHintText,
                textInputType: TextInputType.name,
              ),
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
                endPadding: kHorizontalPadding,
                startPadding: kHorizontalPadding,
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
              CustomTerms(
                onChanged: (bool value) {
                  isTermsAccepted = value;
                },
              ),
              SizedBox(
                height: 30,
              ),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (isTermsAccepted) {
                      SignupCubit.get(context).createUserWithEmailAndPassword(
                        emailController.text,
                        nameController.text,
                        passwordController.text,
                      );
                    } else {
                      customShowSnackBar(
                        context,
                        message: S.of(context).DisAgreeTerms,
                        color: Colors.red.shade200,
                      );
                    }
                  } else {
                    setState(() {
                      autoValidateMode = AutovalidateMode.always;
                    });
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
                          context, SginInView.routeName);
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
