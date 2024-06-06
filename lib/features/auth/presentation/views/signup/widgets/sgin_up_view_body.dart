
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:souq/constants/constants.dart';
import 'package:souq/core/widgets/custom_text_form_filed.dart';
import 'package:souq/core/widgets/custom_button.dart';
import 'package:souq/core/widgets/custom_text_button.dart';
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
  void initState(){
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
                validator:  (value) {
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
                validator:  (value) {
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
                validator:  (value) {
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
                  onPressed: ()
                  {
                    isPass = !isPass;
                    setState(() {

                    });
                  },
                  icon:Icon(
                    isPass ? CupertinoIcons.eye :  CupertinoIcons.eye_slash,
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
                    padding: kHorizintalPadding,
                    onPressed: () {},
                    text: S.of(context).forgetPass,
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              CustomButton(
                onPressed: ()
                {
                  if(formKey.currentState!.validate())
                  {
                    passwordController.text;
                    emailController.text;
                    nameController.text;
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
                    onPressed: ()
                    {

                    },
                    text: S.of(context).createAccount,
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
