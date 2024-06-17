import 'package:injectable/injectable.dart';
import 'package:test_app_sql/feature/order_list/data/api/local_source/local_source.dart';
import 'package:test_app_sql/feature/order_list/data/model/table_info_model.dart';
import 'package:test_app_sql/feature/order_list/domain/entity/table_info_entity.dart';
import 'package:test_app_sql/feature/products/domain/entity/product_entity.dart';

import '../../domain/repository/product_repository.dart';

@LazySingleton(as: OrderListRepository)
class OrderListRepositoryImpl extends OrderListRepository {
  final LocalResourceOrderList localResource;

  OrderListRepositoryImpl({required this.localResource});

  @override
  Future<List<TableInfoEntity>> getActiveTableDetails() async {
    return await localResource.getActiveTableDetails();
  }
}
