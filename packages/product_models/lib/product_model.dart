class ProductDBModel {
  final int id;
  final String title;
  final String dateTime;
  final int price;
  final int quantity;
  final int tableNumber;

  ProductDBModel({
    required this.id,
    required this.title,
    required this.dateTime,
    required this.price,
    required this.quantity,
    required this.tableNumber,
  });
}

class TableDBInfoModel {
  final int tableNumber;
  final int itemCount;
  final int totalAmount;

  TableDBInfoModel({
    required this.tableNumber,
    required this.itemCount,
    required this.totalAmount,
  });
}
