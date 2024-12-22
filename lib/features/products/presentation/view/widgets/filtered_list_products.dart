import 'package:flutter/material.dart';
import 'package:souq/core/utils/app_colors.dart';

class FilteredListProducts extends StatelessWidget {
  const FilteredListProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 12,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.only(
                end: 8,
              ),
              child: CircleAvatar(
                radius: 36,
                backgroundColor: AppColors.primaryColor,
                backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/61127/pexels-photo-61127.jpeg?auto=compress&cs=tinysrgb&w=600",
                ),
              ),
            ),
            const Text("Banana"),
          ],
        );
      },
    );
  }
}
