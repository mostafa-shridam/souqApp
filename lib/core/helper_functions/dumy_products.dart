import '../entites/product_entity.dart';

ProductEntity setDumyProducts() {
  return ProductEntity(
    exprissionMonths: 1,
    numberOfCalories: 1,
    unitAmount: 1,
    productName: 'productName',
    productCode: 'productCode',
    description: 'description',
    price: 1,
    isFeatured: true,
    imageUrl: null,
    reviews: [],
  );
}

List<ProductEntity> getDumyProductsList() =>
    List.generate(10, (_) => setDumyProducts());
