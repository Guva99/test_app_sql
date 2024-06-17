import 'package:equatable/equatable.dart';

class TableInfoEntity extends Equatable{

const  TableInfoEntity({
    required this.tableNumber,
    required this.itemCount,
    required this.totalAmount,
  });
final int tableNumber;
final int itemCount;
final int totalAmount;

  @override
  List<Object?> get props => [
    tableNumber,
    itemCount,
    totalAmount,
  ];
}
