import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final int id;
  final String title;
  final int price;
  final int quantity;
  final int tableNumber;

  const ProductEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.tableNumber,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        price,
        quantity,
        tableNumber,
      ];
}
