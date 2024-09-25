import 'package:souq/core/utlis/constants/app_images.dart';
import 'package:souq/generated/l10n.dart';

class BottomNavigationBarEntites {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavigationBarEntites({
    required this.activeImage,
    required this.inActiveImage,
    required this.name,
  });
}

List<BottomNavigationBarEntites> get bottomNavigationBarEntites => [
      BottomNavigationBarEntites(
        activeImage: Assets.imagesBottomHomeBold,
        inActiveImage: Assets.imagesBottomHomeOutliend,
        name: S.current.NavBarHome,
      ),
      BottomNavigationBarEntites(
        activeImage: Assets.imagesBottomProductsBold,
        inActiveImage: Assets.imagesBottomProductsOutliend,
        name: S.current.NavBarProducts,
      ),
      BottomNavigationBarEntites(
        activeImage: Assets.imagesBottomCartBold,
        inActiveImage: Assets.imagesBottomCartOutliend,
        name: S.current.NavBarCart,
      ),
      BottomNavigationBarEntites(
        activeImage: Assets.imagesBottomUserBold,
        inActiveImage: Assets.imagesBottomUserOutliend,
        name: S.current.NavBarAccount,
      ),
    ];
