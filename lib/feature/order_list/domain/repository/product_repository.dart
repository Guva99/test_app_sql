
import 'package:test_app_sql/feature/order_list/domain/entity/table_info_entity.dart';

abstract class OrderListRepository {


  Future<List<TableInfoEntity>> getActiveTableDetails();

}
