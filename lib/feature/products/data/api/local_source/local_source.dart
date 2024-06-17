import 'package:injectable/injectable.dart';
import 'package:product_models/product_model.dart';
import 'package:product_repository/product_repository.dart';
import 'package:test_app_sql/feature/products/data/model/product_model.dart';

@lazySingleton
class LocalResource {
  ///Добавление продукта в базу
  Future<void> addProduct({
    required String name,
    required String dateTime,
    required int price,
    required int quantity,
    required int tableNumber,
    required int id,
  }) async {

    await ProductDBRepository().addProduct(ProductDBModel(
      id: id,
      title: name,
      dateTime: dateTime,
      price: price,
      quantity: quantity,
      tableNumber: tableNumber,
    ));
  }

  Future<List<ProductModel>> getAllProduct(int tableNumber) async {
    final List<ProductDBModel> dbModels = await ProductDBRepository().getAllProduct(tableNumber);
    return dbModels
        .map((dbModel) => ProductModel(
              id: dbModel.id,
              title: dbModel.title,
              price: dbModel.price,
              quantity: dbModel.quantity,
              tableNumber: dbModel.tableNumber,
            ))
        .toList();
  }

  Future<void> deleteProductId(int id) async {
    await ProductDBRepository().deleteProductId(id);
  }

  Future<void> decrementProductQuantity(int id) async {
    await ProductDBRepository().decrementProductQuantity(id);
  }

  Future<void> incrementProductQuantity(int id) async {
    await ProductDBRepository().incrementProductQuantity(id);
  }

  Future<void> updateProduct({
    required String name,
    required String dateTime,
    required int price,
    required int id,
    required int quantity,
    required int tableNumber,
  }) async {
    await ProductDBRepository().updateProduct(ProductDBModel(
      id: id,
      title: name,
      price: price,
      dateTime: dateTime,
      quantity: quantity,
      tableNumber: tableNumber,
    ));
  }
}
