import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utils/app_text_styles.dart';
import 'package:souq/core/utils/app_images.dart';
import 'package:souq/core/utils/constants/constants.dart';
import 'package:souq/features/main_view/presentation/views/widgets/home/presentation/view/widgets/featured_item_button.dart';
import 'package:souq/generated/l10n.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: size.width * 0.88,
        child: AspectRatio(
          aspectRatio: 342 / 158,
          child: Stack(
            children: [
              Positioned(
                right: Prefs.getBool(kNewLanguage) ? size.width * 0.4 : 0,
                bottom: 0,
                top: 0,
                left: Prefs.getBool(kNewLanguage) ? 0 : size.width * 0.4,
                child: SvgPicture.asset(
                  Assets.imagesImage2,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                padding: EdgeInsetsDirectional.only(
                  start: 28,
                ),
                width: size.width * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: svg.Svg(
                    Prefs.getBool(kNewLanguage) ?   Assets.imagesFeaturedImage : Assets.imagesFeaturedImageRotated,
                      color: Colors.amber,
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${S.of(context).offers} \20%',
                      style: TextStyles.regular13.copyWith(
                        color: Prefs.getBool(kIsDarkMode) == false
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    Text(
                      '${S.of(context).offers} \20%',
                      style: TextStyles.bold19.copyWith(
                        color: Prefs.getBool(kIsDarkMode) == false
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                    FeaturedItemButton(
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
