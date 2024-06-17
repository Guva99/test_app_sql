// ignore_for_file: overridden_fields, annotate_overrides
import 'package:test_app_sql/feature/products/domain/entity/product_entity.dart';

class ProductModel extends ProductEntity {
  final int id;
  final String title;
  final int price;
  final int quantity;
  final int tableNumber;

  const ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.tableNumber,
  }) : super(
          id: id,
          title: title,
          price: price,
          quantity: quantity,
          tableNumber: tableNumber,
        );
}
