import 'package:flutter/material.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utlis/app_colors.dart';
import 'package:souq/views/item_details_view/widgets/item_details_body.dart';

import '../../core/utlis/constants/constants.dart';

class ItemDetailsView extends StatelessWidget {
  const ItemDetailsView({
    super.key,
    required this.title,
    required this.image,
    required this.salary,
    required this.desc,
    required this.conte,
    required this.rate,
  });

  final String title, image, salary, desc;
  final int conte;
  final double rate;
  static const String routeName = 'details';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Prefs.getBool(kIsDarkMode) == false
            ? AppColors.fillColorLight
            : AppColors.fillColorDark,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_sharp)),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(221),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Image.asset(
                    image,
                    width: 140,
                    height: 140,
                  ),
                ),
              ],
            )),
        shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius:
                BorderRadius.vertical(bottom: Radius.elliptical(200, 80))),
      ),
      body: ItemDetailsBody(
        title: title,
        salary: salary,
        desc: desc,
        conte: conte,
        rate: rate,
      ),
    );
  }
}
