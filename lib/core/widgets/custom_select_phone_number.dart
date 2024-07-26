import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:souq/core/utlis/constants/constants.dart';
import 'package:souq/core/widgets/custom_text_form_filed.dart';

class CustomSelectPhone extends StatefulWidget {
  CustomSelectPhone({
    super.key,
    required this.formKey,
  });
  final GlobalKey<FormState> formKey;

  @override
  _CustomSelectPhoneState createState() => _CustomSelectPhoneState();
}

class _CustomSelectPhoneState extends State<CustomSelectPhone> {

  final TextEditingController controller = TextEditingController();
  String initialCountry = 'EG';
  PhoneNumber number = PhoneNumber(isoCode: 'EG');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(
          horizontal: 2,
          vertical: kVerticalPadding,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CountryCodePicker(
              padding: EdgeInsetsDirectional.zero,
              hideMainText: false,
              showFlagMain: true,
              showFlag: false,
              initialSelection: 'EG',
              hideSearch: false,
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
            ),
            Expanded(
              child: CustomTextFormField(
                validator: ( f) {
                  if (value!.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                padding: 0,
                hintText: 'here',
                textInputType: TextInputType.phone,
                controller: controller,
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
