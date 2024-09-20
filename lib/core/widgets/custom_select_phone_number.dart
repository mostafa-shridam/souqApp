import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:souq/core/widgets/custom_text_form_filed.dart';

class CustomSelectPhone extends StatelessWidget {
  CustomSelectPhone({
    super.key,
    required this.controller,
    required this.hintText,
  });
  final TextEditingController controller;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      hintText: hintText,
      textInputType: TextInputType.number,
      controller: controller,
      prefixIcon: CountryCodePicker(
        padding: EdgeInsetsDirectional.zero,
        hideMainText: false,
        showFlagMain: true,
        showFlag: false,
        initialSelection: 'EG',
        hideSearch: false,
        showCountryOnly: false,
        showOnlyCountryWhenClosed: false,
        closeIcon: Icon(Icons.close),
        showDropDownButton: false,
      ),
    );
  }
}
