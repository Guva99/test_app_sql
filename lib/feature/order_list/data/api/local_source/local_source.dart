import 'package:injectable/injectable.dart';
import 'package:product_models/product_model.dart';
import 'package:product_repository/product_repository.dart';
import 'package:test_app_sql/feature/order_list/data/model/table_info_model.dart';

@lazySingleton
class LocalResourceOrderList {
  ///Добавление продукта в базу

  Future<List<TableInfoModel>> getActiveTableDetails() async {
    final List<TableDBInfoModel> dbModels = await ProductDBRepository().getActiveTableDetails();

    return dbModels
        .map((dbModel) => TableInfoModel(
              tableNumber: dbModel.tableNumber,
              itemCount: dbModel.itemCount,
              totalAmount: dbModel.totalAmount,
            ))
        .toList();
  }
}
