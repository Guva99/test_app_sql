class DBProduct {
  int id;
  String title;
  String dateTime;
  int price;
  int quantity;
  int tableNumber;

  DBProduct({
    required this.id,
    required this.title,
    required this.dateTime,
    required this.price,
    required this.quantity,
    required this.tableNumber,
  });

  factory DBProduct.fromMap (Map<String, dynamic> json) => DBProduct (
    id: json['id'] ?? 0,
    title: json['title'] ?? '',
    price: json['price'] ?? '',
    quantity: json['quantity'] ?? '',
    tableNumber: json['tableNumber'] ?? '',
    dateTime: json['dateTime'] ?? '',
  );
  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "price": price,
    "dateTime": dateTime,
    "quantity": quantity,
    "tableNumber": tableNumber,
  };
}
