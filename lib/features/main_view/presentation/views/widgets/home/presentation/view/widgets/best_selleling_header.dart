import 'package:flutter/material.dart';
import 'package:souq/core/utils/app_text_styles.dart';
import 'package:souq/features/main_view/presentation/views/widgets/best_selling/presentation/views/best_selling_view.dart';
import 'package:souq/generated/l10n.dart';

class BestSellelingHeader extends StatelessWidget {
  const BestSellelingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, BestSellingView.routeName);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        child: Row(
          children: [
            Text(
              S.of(context).BestSelling,
              style: TextStyles.bold16,
            ),
            Spacer(),
            Text(
              S.of(context).MoreBestSelling,
              style: TextStyles.regular13.copyWith(
                color: Color(0xff949D9E),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
