import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/account/presentation/view/account_view.dart';
import 'package:souq/features/auth/data/domain/entites/user_intity.dart';
import 'package:souq/features/home_view/presentation/views/widgets/home_view_body.dart';
import 'package:souq/views/cart_view/cart_view.dart';
import 'package:souq/views/products_view/products_view.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  List<Widget> homeWidgets = [
    HomeViewBodyItem(),
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
