import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:souq/core/utlis/app_colors.dart';
import 'package:souq/core/utlis/app_text_styles.dart';
import 'package:souq/core/widgets/custom_show_snack_bar.dart';import 'package:souq/models/item_model.dart';
import 'package:souq/views/item_details_view/item_detials_view.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({super.key, required this.itemModelData});

  final ItemModel itemModelData;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  bool isFav = false;
  bool isSelect = false;

  List<ItemModel> items = [];

  @override
  Widget build(BuildContext context) {
    ItemModel itemModel = ItemModel(
      isSelect: isSelect,
      id: 0,
      productImage: 'assets/AppIcon.png',
      productName: 'Fruit',
      productSalary: '200',
      productDesc:
          'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like)',
      conte: 4,
      rate: 4.2,
    );
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ItemDetailsView.routeName,
          arguments: itemModel,
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 50 * 2),
        child: GridView.builder(
          clipBehavior: Clip.none,
          itemCount: 10,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          itemBuilder: (context, index) => Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: AppColors.fillColor,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 30,
                  right: Intl.defaultLocale == 'ar' ? 28 : 0.0,
                  left: Intl.defaultLocale == 'ar' ? 28.0 : 0.0,
                  child: Image.asset(
                    itemModel.productImage!,
                    height: 100,
                    width: double.infinity,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: ({
                        id,
                      }) {
                        isFav = !isFav;
                        setState(() {});
                      },
                      icon: Icon(
                        isFav ? Icons.favorite_border : Icons.favorite,
                        color: AppColors.primaryColor,
                      ),
                    ),
                    Text(
                      '${itemModel.id = index}',
                      style: TextStyles.bold16,
                    ),
                  ],
                ),
                Positioned(
                  child: Text(
                    '${itemModel.productName}',
                    style: TextStyles.bold16,
                  ),
                  bottom: 60,
                  left: Intl.defaultLocale == 'ar' ? 0.0 : 10.0,
                  right: Intl.defaultLocale == 'ar' ? 10.0 : 0.0,
                ),
                Positioned(
                  child: Text(
                    '${itemModel.productSalary} / Kilo',
                    style: TextStyles.bold13
                        .copyWith(color: AppColors.secondaryColor),
                  ),
                  bottom: 26,
                  left: Intl.defaultLocale == 'ar' ? 0.0 : 10.0,
                  right: Intl.defaultLocale == 'ar' ? 10.0 : 0.0,
                ),
                Intl.defaultLocale == 'ar'
                    ? Positioned(
                        left: 2,
                        bottom: 28,
                        child: IconButton(
                          onPressed: () {
                            isSelect = !isSelect;
                            setState(() {});
                          },
                          icon: CircleAvatar(
                            backgroundColor: isSelect
                                ? AppColors.primaryColor
                                : Colors.transparent,
                            child: Icon(
                              Icons.add,
                              color: isSelect
                                  ? Colors.white
                                  : AppColors.primaryColor,
                            ),
                          ),
                        ),
                      )
                    : Positioned(
                        right: 2,
                        bottom: 28,
                        child: IconButton(
                          onPressed: () {
                            isSelect = !isSelect;
                            if (isSelect) {
                              customShowSnackBar(context,
                                  message: 'Success add to cart');
                            } else if (!isSelect) {
                              customShowSnackBar(context,
                                  message: 'Success remove to cart');
                            }
                            setState(() {});
                          },
                          icon: CircleAvatar(
                            backgroundColor: isSelect
                                ? AppColors.primaryColor
                                : Colors.transparent,
                            child: Icon(
                              Icons.add,
                              color: isSelect
                                  ? Colors.white
                                  : AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
            mainAxisSpacing: 12,
            crossAxisSpacing: 16,
          ),
        ),
      ),
    );
  }
}
