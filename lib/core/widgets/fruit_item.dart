import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:souq/core/services/shared_preferences.dart';
import 'package:souq/core/utlis/app_colors.dart';
import 'package:souq/core/utlis/app_text_styles.dart';
import 'package:souq/core/utlis/constants/app_images.dart';
import 'package:souq/core/utlis/constants/constants.dart';
import 'package:souq/models/item_model.dart';

class FruitItem extends StatefulWidget {
  const FruitItem({super.key,});


  @override
  State<FruitItem> createState() => _FruitItemState();
}

class _FruitItemState extends State<FruitItem> {
  bool isFav = false;
  bool isSelect = false;

  List<ItemModel> items = [];

  @override
  Widget build(BuildContext context) {
    ItemModel itemModel = ItemModel(
      isSelect: isSelect,
      id: 0,
      productImage: Assets.imagesAppIcon,
      productName: 'Fruit',
      productSalary: '200',
      productDesc:
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)',
      conte: 4,
      rate: 4.2,
    );
    return Container(
          decoration: ShapeDecoration(
            color: Prefs.getBool(kIsDarkMode) == false
                ? AppColors.fillColorLight
                : AppColors.fillColorDark,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                4,
              ),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.favorite_outline),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Positioned.fill(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.imagesImage2,
                      fit: BoxFit.contain,
                      width: 120,
                      height: 120,
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    ListTile(
                      title: Text(
                        'Fruit',
                        textAlign: TextAlign.center,
                        style: TextStyles.bold16,
                      ),
                      subtitle: Text.rich(TextSpan(
                        text: '200',
                        style: TextStyles.regular13.copyWith(
                          color: AppColors.secondaryColor,
                        ),
                        children: [
                          TextSpan(
                            text: ' جنية',
                            style: TextStyles.regular13.copyWith(
                              color: AppColors.secondaryColor,
                            ),
                          ),
                          TextSpan(
                            text: '/كيلو',
                            style: TextStyles.regular13.copyWith(
                              color: AppColors.secondaryColor,
                            ),
                          ),
                        ],
                      )),
                      trailing: IconButton(
                        onPressed: () {},
                        icon: CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          child: Icon(
                            Icons.add,
                            color: Prefs.getBool(kIsDarkMode) == false
                                ? AppColors.fillColorLight
                                : AppColors.fillColorDark,
                          ),
                        ),
                        padding: EdgeInsetsDirectional.zero,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
  }
}
