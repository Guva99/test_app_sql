import 'package:injectable/injectable.dart';
import 'package:product_models/product_model.dart';
import 'package:test_app_sql/feature/products/data/api/local_source/local_source.dart';
import 'package:test_app_sql/feature/products/domain/entity/product_entity.dart';

import '../../domain/repository/product_repository.dart';

@LazySingleton(as: ProductsRepository)
class ProductsRepositoryImpl extends ProductsRepository {
  final LocalResource localResource;

  ProductsRepositoryImpl({required this.localResource});

  @override
  Future<void> addProduct({
    required String name,
    required String dateTime,
     required int price,
    required int id,
    required int quantity,
    required int tableNumber,
  }) async {
    await localResource.addProduct(
      id: id,
      name: name,
      dateTime: dateTime,
      price: price,
      quantity: quantity,
      tableNumber: tableNumber,
    );
  }

  @override
  Future<List<ProductEntity>> getProduct(int tableNumber) async {
    return await localResource.getAllProduct( tableNumber);
  }

  @override
  Future<void> deleteProduct({required int id}) async {
    await localResource.deleteProductId(id);
  }

  @override
  Future<void> incrementProductQuantity({required int id}) async {
    await localResource.incrementProductQuantity(id);
  }

  @override
  Future<void> decrementProductQuantity({required int id}) async {
    await localResource.decrementProductQuantity(id);
  }

  @override
  Future<void> updateProduct({
    required String name,
     required String dateTime,
    required int price,
    required int id,
    required int quantity,
    required int tableNumber,
  }) async {
    return await localResource.updateProduct(
      id: id,
      name: name,
      dateTime: dateTime,
      price: price,
      quantity: quantity,
      tableNumber: tableNumber,
    );
  }
}
