import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souq/features/account/presentation/view/account_view.dart';
import 'package:souq/features/auth/data/domain/entites/user_intity.dart';
import 'package:souq/features/auth/data/domain/repo/auth_repo.dart';
import 'package:souq/views/cart_view/cart_view.dart';
import 'package:souq/features/home_view/presentation/views/home_view.dart';
import 'package:souq/views/products_view/products_view.dart';
part 'nav_bar_state.dart';

class HomeCubit extends Cubit<NavBarState> {
  HomeCubit(this.authRepo) : super(HomeInitial());
  static HomeCubit get(context) => BlocProvider.of(context);
  final AuthRepo authRepo;

  void getUserData(UserEntity userEntity) {
    var result = authRepo.getUserData(uid: userEntity.uId);
    result;
    emit(GetUserDataSuccess(userEntity: userEntity));
  }

  List<Widget> homeWidgets = [
    HomeView(),
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
