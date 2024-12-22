import 'package:dartz/dartz.dart';

import 'package:souq/core/entites/product_entity.dart';

import 'package:souq/core/errors/filures.dart';
import 'package:souq/core/models/product_model.dart';
import 'package:souq/core/services/data_services.dart';
import 'package:souq/generated/l10n.dart';

import '../../utils/backend_endpoint.dart';
import 'product_repo.dart';

class ProductRepoImpl implements ProductRepo {
  final DatabaseService databaseService;

  ProductRepoImpl({required this.databaseService});
  @override
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoint.getProducts,
          query: {
            'limit': 10,
            'orderBy': 'sellingCount',
            'descending': true
          }) as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure(
        message: S.current.FailedToGetProducts,
      ));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      var data = await databaseService.getData(
          path: BackendEndpoint.getProducts) as List<Map<String, dynamic>>;

      List<ProductEntity> products =
          data.map((e) => ProductModel.fromJson(e).toEntity()).toList();
      return right(products);
    } catch (e) {
      return left(ServerFailure(
        message: S.current.FailedToGetProducts,
      ));
    }
  }
}
