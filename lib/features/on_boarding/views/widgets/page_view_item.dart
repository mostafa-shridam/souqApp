import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:souq/core/utlis/constants/constants.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utlis/app_text_styles.dart';
import 'package:souq/features/auth/presentation/views/login/sginin_view.dart';
import 'package:souq/generated/l10n.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.image,
    required this.backgroundImage,
    required this.subtitle,
    required this.title,
    required this.visibility,
  });

  final String image, backgroundImage;
  final String subtitle;
  final Widget title;
  final bool visibility;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: height * 0.5,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned.fill(
                  child: RepaintBoundary(
                    child: SvgPicture.asset(
                      backgroundImage,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Visibility(
                  visible: visibility,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: TextButton(
                      onPressed: () {
                        Prefs.setBool(kIsOnBoardingSeen, true);
                        Navigator.pushReplacementNamed(
                          context,
                          SginInView.routeName,
                        );
                      },
                      child: Text(
                        S.of(context).skipButton,
                        style: TextStyles.regular13.copyWith(
                          color: Color(0xFFC7C9CA),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 28.0),
            child: title,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: kHorizontalPadding,
            ),
            child: Text(
              subtitle,
              textAlign: TextAlign.center,
              style: TextStyles.semiBold13,
            ),
          ),
        ],
      ),
    );
  }
}
