import 'package:flutter/cupertino.dart';
import 'package:souq/core/utils/constants/constants.dart';
import 'package:souq/core/widgets/custom_button.dart';
import 'package:souq/core/widgets/custom_text_form_filed.dart';

class EditAccountViewBody extends StatefulWidget {
  const EditAccountViewBody({super.key});

  @override
  State<EditAccountViewBody> createState() => _EditAccountViewBodyState();
}

class _EditAccountViewBodyState extends State<EditAccountViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: kVerticalPadding,
            horizontal: kHorizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text('المعلومات الشخصية'),
              const SizedBox(height: 16.0),
              CustomTextFormField(
                hintText: 'الاسم',
                textInputType: TextInputType.name,
                controller: nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'برجاء ادخال الاسم';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                hintText: 'الايميل',
                textInputType: TextInputType.emailAddress,
                controller: emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'برجاء ادخال الايميل';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid "@"';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),
              const Text('تغيير كلمة المرور'),
              const SizedBox(height: 24.0),
              CustomTextFormField(
                hintText: 'كلمة المرور القديمة',
                textInputType: TextInputType.visiblePassword,
                controller: passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'برجاء ادخال كلمة المرور';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                hintText: 'كلمة المرور الجديدة',
                textInputType: TextInputType.visiblePassword,
                controller: newPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'برجاء ادخال كلمة المرور الجديدة';
                  }
                  return null;
                },
              ),
              CustomTextFormField(
                hintText: 'تأكيد كلمة المرور',
                textInputType: TextInputType.visiblePassword,
                controller: newPasswordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'برجاء ادخال كلمة المرور';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32.0),
              CustomButton(
                horizontalPadding: 0,
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                  }
                  formKey.currentState!.validate();
                  autovalidateMode = AutovalidateMode.always;
                },
                text: 'حفظ التغييرات',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
