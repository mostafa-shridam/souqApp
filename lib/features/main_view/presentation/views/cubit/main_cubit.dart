import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/main_view/presentation/views/widgets/account/presentation/view/account_view.dart';
import 'package:souq/features/auth/data/domain/entites/user_intity.dart';
import 'package:souq/features/main_view/presentation/views/widgets/home/presentation/view/widgets/home_view_body.dart';

import '../widgets/cart/presentation/view/cart_view.dart';
import '../../../../products/presentation/view/products_view.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  static MainCubit get(context) => BlocProvider.of(context);
  List<Widget> homeWidgets = [
    HomeViewBody(),
    ProductsView(),
    CartView(),
    AccountView(),
  ];

  List<IconData> bottomNavIcons = [
    CupertinoIcons.house_fill,
    CupertinoIcons.rectangle_grid_2x2,
    CupertinoIcons.cart_fill,
    CupertinoIcons.person_alt,
  ];
  int currentIndex = 0;
  void changeIndex(int index) {
    currentIndex = index;
    emit(HomeChangeIndexState());
  }
}
