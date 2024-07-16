import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key,required this.firstText, required this.secondText});
  final String firstText, secondText;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsetsDirectional.only(
          top: 24,
        ),
        height: 70,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1,
              color: Color(0xffF1F1F5)),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text('$firstText'),
                Text('$secondText'),
              ],
            ),
            Spacer(),
            Image.asset('assets/farwla.png', height: 40,width: 40,),
          ],
        ),
      ),
    );
  }
}
