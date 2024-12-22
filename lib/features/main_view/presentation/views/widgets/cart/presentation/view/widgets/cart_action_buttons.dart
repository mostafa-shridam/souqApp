import 'package:flutter/material.dart';

import '../../../../../../../../../core/utils/app_colors.dart';

class CartActionButtons extends StatefulWidget {
  const CartActionButtons({super.key, required this.count});
  final int count;

  @override
  State<CartActionButtons> createState() => _CartActionButtonsState();
}

class _CartActionButtonsState extends State<CartActionButtons> {
  late int count;
  @override
  void initState() {
    super.initState();
    count = widget.count;
  }

  void plus() => setState(() => count++);
  void minus() {
    if (count > 0) {
      setState(() => count--);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 12,
      children: [
        GestureDetector(
          onTap: () {
            plus();
          },
          child: CircleAvatar(
            radius: 14,
            backgroundColor: AppColors.primaryColor,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ),
        Text("$count"),
        GestureDetector(
          onTap: () {
            minus();
          },
          child: CircleAvatar(
            radius: 14,
            backgroundColor: AppColors.fillColorLight,
            child: Icon(
              Icons.remove,
              color: Color(0xff979899),
            ),
          ),
        ),
      ],
    );
  }
}