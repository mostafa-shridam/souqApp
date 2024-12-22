import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:souq/core/entites/product_entity.dart';
import 'package:souq/core/repos/product_repo/product_repo.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productRepo) : super(ProductsInitial());
  static ProductsCubit get(context) => BlocProvider.of(context);

  final ProductRepo productRepo;
  int resultLeanth = 0;
  int cartLeanth = 0;
  void getProducts() async {
    emit(ProductsLoading());
    final result = await productRepo.getProducts();
    result.fold(
      (failure) => emit(ProductsFailure(errMessage: failure.message)),
      (products) {
        resultLeanth = products.length;
        emit(ProductsSuccess(products: products));
      },
    );
  }

  void getBesSellingProducts() async {
    emit(ProductsLoading());
    final result = await productRepo.getBestSellingProducts();
    result.fold(
      (failure) => emit(ProductsFailure(errMessage: failure.message)),
      (products) => emit(ProductsSuccess(products: products)),
    );
  }
}
