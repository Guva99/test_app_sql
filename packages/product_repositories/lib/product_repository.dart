import 'package:product_models/product_model.dart';
import 'package:product_services/data_models/db_product.dart';
import 'package:product_services/database.dart';

class ProductDBRepository {
  Future<void> addProduct(ProductDBModel product) async {
    await DBProvider.db.addProduct(
      DBProduct(
        id: product.id,
        title: product.title,
        price: product.price,
        quantity: product.quantity,
        tableNumber: product.tableNumber,
        dateTime: product.dateTime,
      ),
    );
  }

  Future<List<ProductDBModel>> getAllProduct(int tableNumber) async {
    final tt = await DBProvider.db.getProductsByTableNumber(tableNumber);
    return tt
        .map(
          (e) => ProductDBModel(
            id: e.id,
            title: e.title,
            price: e.price,
            dateTime: e.dateTime,
            quantity: e.quantity,
            tableNumber: e.tableNumber,
          ),
        )
        .toList();
  }

  Future<void> deleteProductId(int id) async {
    await DBProvider.db.deleteProduct(id);
  }

  Future<List<TableDBInfoModel>> getActiveTableDetails() async {
    final data = await DBProvider.db.getActiveTableDetails();
    return data
        .map(
          (e) => TableDBInfoModel(
            tableNumber: e.tableNumber,
            itemCount: e.itemCount,
            totalAmount: e.totalAmount,
          ),
        )
        .toList();
  }

  Future<void> clearAllData() async {
    await DBProvider.db.clearAllData();
  }

  Future<void> incrementProductQuantity(int id) async {
    await DBProvider.db.incrementProductQuantity(id);
  }

  Future<void> decrementProductQuantity(int id) async {
    await DBProvider.db.decrementProductQuantity(id);
  }

  Future<void> updateProduct(ProductDBModel product) async {
    final result = await DBProvider.db.updateProduct(
      DBProduct(
        id: product.id,
        title: product.title,
        price: product.price,
        quantity: product.quantity,
        tableNumber: product.tableNumber,
        dateTime: product.dateTime,
      ),
    );
    return result;
  }
}
