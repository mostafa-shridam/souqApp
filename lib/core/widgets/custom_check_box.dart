import 'package:flutter/material.dart';
import 'package:souq/core/utils/app_colors.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox(
      {super.key, required this.isChacked, required this.onChecked});

  final bool isChacked;
  final ValueChanged<bool> onChecked;
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      isError: isChacked == false ? false : true,
      splashRadius: 10,
      tristate: isChacked == true ? false : true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      side: BorderSide(
          style: BorderStyle.solid, width: 1.5, color: Color(0xffDDDFDF)),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      activeColor: AppColors.primaryColor,
      fillColor: WidgetStatePropertyAll(isChacked == true
          ? AppColors.primaryColor
          : AppColors.fillColorLight,),
      value: isChacked,
      onChanged: (value) {
        onChecked(!isChacked);
      },
    );
  }
}
