import 'package:flutter/material.dart';
import 'package:souq/core/utlis/app_colors.dart';
import 'package:souq/core/utlis/app_text_styles.dart';
import 'package:souq/features/on_boarding/views/widgets/page_view_item.dart';
import 'package:souq/generated/l10n.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView(
        allowImplicitScrolling: true,
        scrollDirection: Axis.horizontal,
        controller: pageController,
        children: [
          PageViewItem(
            image: "assets/Image1.svg",
            backgroundImage: "assets/BackGroundImage1.svg",
            subtitle: S.of(context).subtitle1,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).title,
                  style: TextStyles.bold28.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                Text(
                  S.of(context).title1,
                  style: TextStyles.bold28.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
              ],
            ),
            visibility: true,
          ),
          PageViewItem(
            image: "assets/Image2.svg",
            backgroundImage: "assets/BackGroundImage2.svg",
            subtitle: S.of(context).subtitle2,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  S.of(context).title2,
                  style: TextStyles.bold28,
                ),
              ],
            ),
            visibility: false,
          ),
        ],
      ),
    );
  }
}
