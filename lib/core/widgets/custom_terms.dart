import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utlis/constants/constants.dart';
import 'package:souq/core/utlis/app_colors.dart';
import 'package:souq/core/utlis/app_text_styles.dart';
import 'package:souq/core/widgets/custom_check_box.dart';
import 'package:souq/core/widgets/custom_show_terms_conditions.dart';
import 'package:souq/generated/l10n.dart';

class CustomTerms extends StatefulWidget {
  const CustomTerms({super.key, required this.onChanged});
  final ValueChanged<bool> onChanged;

  @override
  State<CustomTerms> createState() => _CustomTermsState();
}

bool isTermsAccepted = false;

class _CustomTermsState extends State<CustomTerms> {
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kHorizontalPadding - 10,
      ),
      child: Row(
        children: [
          CustomCheckBox(
            isChacked: isTermsAccepted,
            onChecked: (bool value) {
              isTermsAccepted = value;
              widget.onChanged(value);
              setState(() {});
            },
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: '${S.of(context).agreeConditions} ',
                style: TextStyles.regular13.copyWith(
                  color: Prefs.getBool(kIsDarkMode) == false
                      ? AppColors.fillColorDark
                      : AppColors.fillColorLight,
                ),
                children: [
                  TextSpan(
                    text: ' ${S.of(context).conditions}',
                    style: TextStyles.regular13
                        .copyWith(color: AppColors.primaryColor),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () => showTermsAndConditionsDialog(context),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
