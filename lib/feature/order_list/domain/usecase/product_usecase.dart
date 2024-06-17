import 'package:injectable/injectable.dart';
import 'package:test_app_sql/feature/order_list/domain/entity/table_info_entity.dart';
import 'package:test_app_sql/feature/order_list/domain/repository/product_repository.dart';
import 'package:test_app_sql/feature/products/domain/entity/product_entity.dart';

@lazySingleton
class OrderListUseCase {
  final OrderListRepository productRepository;

  const OrderListUseCase({required this.productRepository});


  Future<List<TableInfoEntity>> getActiveTableDetails() async {
    return await productRepository.getActiveTableDetails();
  }



}
