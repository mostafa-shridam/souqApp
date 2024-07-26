import 'package:flutter/material.dart';
import 'package:souq/core/utlis/app_colors.dart';
import 'package:souq/core/utlis/app_text_styles.dart';
import 'package:souq/core/utlis/constants/app_images.dart';
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
            image: Assets.imagesImage1,
            backgroundImage: Assets.imagesBackGroundImage1,
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
            image: Assets.imagesImage2,
            backgroundImage: Assets.imagesBackGroundImage2,
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
