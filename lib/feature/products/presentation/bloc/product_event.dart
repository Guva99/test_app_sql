part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {
  const ProductEvent();
}

class ProductDeleteEvent extends ProductEvent {
  final int id;

  const ProductDeleteEvent({required this.id});
}

class ProductAddEvent extends ProductEvent {
  final String name;
  final String dateTime;
  final int price;
  final int quantity;
  final int tableNumber;

  const ProductAddEvent({
    required this.price,
    required this.name,
    required this.dateTime,
    required this.quantity,
    required this.tableNumber,
  });
}

class ProductGetDataEvent extends ProductEvent {
  final int tableNumber;

  const ProductGetDataEvent({
    required this.tableNumber,
});
}

class ProductIncreaseProductCountEvent extends ProductEvent {
  final int id;
  final int quantity;
  final int tableNumber;

  const ProductIncreaseProductCountEvent({
    required this.id,
    required this.quantity,
    required this.tableNumber,
  });
}

class ProductDecreaseProductCountEvent extends ProductEvent {
  final int id;
  final int quantity;
  final int tableNumber;

  const ProductDecreaseProductCountEvent({
    required this.id,
    required this.quantity,
    required this.tableNumber,
  });
}
