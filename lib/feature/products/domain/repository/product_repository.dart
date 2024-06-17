import 'package:test_app_sql/feature/products/domain/entity/product_entity.dart';

abstract class ProductsRepository {
  Future<void> addProduct({
    required String name,
    required String dateTime,
    required int price,
    required int id,
    required int quantity,
    required int tableNumber,
  });

  Future<List<ProductEntity>> getProduct(int tableNumber);

  Future<void> deleteProduct({
    required int id,
  });

  Future<void> incrementProductQuantity({
    required int id,
  });

  Future<void> decrementProductQuantity({
    required int id,
  });

  Future<void> updateProduct({
    required String name,
    required String dateTime,
    required int price,
    required int id,
    required int quantity,
    required int tableNumber,
  });
}
