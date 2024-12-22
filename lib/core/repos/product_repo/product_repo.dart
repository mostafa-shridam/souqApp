import 'package:dartz/dartz.dart';
import 'package:souq/core/entites/product_entity.dart';

import '../../errors/filures.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<Either<Failure, List<ProductEntity>>> getBestSellingProducts();
}
