// ignore_for_file: overridden_fields, annotate_overrides
import 'package:test_app_sql/feature/order_list/domain/entity/table_info_entity.dart';
import 'package:test_app_sql/feature/products/domain/entity/product_entity.dart';

class TableInfoModel extends TableInfoEntity {
  final int tableNumber;
  final int itemCount;
  final int totalAmount;

  const TableInfoModel({
    required this.tableNumber,
    required this.itemCount,
    required this.totalAmount,
  }) : super(
          tableNumber: tableNumber,
          itemCount: itemCount,
          totalAmount: totalAmount,
        );
}
