import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:souq/core/utlis/constants/constants.dart';
import 'package:souq/core/utlis/app_colors.dart';
import 'package:souq/core/utlis/app_text_styles.dart';
import 'package:souq/core/widgets/custom_container.dart';
import 'package:souq/models/item_model.dart';

class ItemDetailsBody extends StatefulWidget {
  const ItemDetailsBody({super.key, required this.title, required this.salary, required this.desc, required this.rate, required this.conte});

  final String title, salary,desc;
  final int conte;
  final double rate;

  @override
  State<ItemDetailsBody> createState() => _ItemDetailsBodyState();
}

class _ItemDetailsBodyState extends State<ItemDetailsBody> {
  int itemNumber = 0;

  void increment() {
    itemNumber++;
    setState(() {});
  }

  void decrement() {
    if (itemNumber <= 0) {
      itemNumber = 0;
    } else {
      itemNumber--;
    }
    setState(() {});
  }
  ItemModel? itemModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding,vertical: kVerticalPadding,),
        child: Column(
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.title.toString(),style: TextStyles.semiBold16,),
                    SizedBox(
                      height: 20,
                    ),
                    Text('${widget.salary.toString()} / kilo',style: TextStyles.semiBold13.copyWith(
                      color: Color(0xffF4A91F)
                    ),),
                  ],
                ),
                Spacer(),
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          increment();
                        },
                        icon: Icon(
                          CupertinoIcons.add_circled_solid,
                          color: AppColors.primaryColor,
                          size: 40,
                        )),
                    Text('${itemNumber}'),
                    IconButton(
                        onPressed: () {
                          decrement();
                        },
                        icon: CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColors.fillColor,
                          child: Icon(
                            CupertinoIcons.minus,
                            color: Color(0xff979899),
                          ),
                        )),
                  ],
                )
              ],
            ),
            SizedBox(height: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('⭐ ${widget.rate.toString()}'),
                SizedBox(height: 20,),
                Text('${widget.desc.toString()}',style: TextStyles.regular13.copyWith(
                  color: Color(0xff979899)
                ),),
                Row(
                  children: [
                    CustomContainer(firstText: '100%', secondText: 'organic',),
                    SizedBox(width: 12,),
                    CustomContainer(firstText: 'General', secondText: 'local',),
                  ],
                ),
                Row(
                  children: [
                    CustomContainer(firstText: '100%', secondText: 'organic',),
                    SizedBox(width: 12,),
                    CustomContainer(firstText: 'General', secondText: 'local',),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

