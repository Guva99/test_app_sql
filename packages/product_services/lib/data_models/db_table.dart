class DBTable  {
  final int tableNumber;
  final int itemCount;
  final int totalAmount;

  DBTable({
    required this.tableNumber,
    required this.itemCount,
    required this.totalAmount,
  });

  factory DBTable.fromMap (Map<String, dynamic> json) => DBTable (
    tableNumber: json['tableNumber'] ?? 0,
    itemCount: json['itemCount'] ?? '',
    totalAmount: json['totalAmount'] ?? '',

  );
  Map<String, dynamic> toMap() => {
    "tableNumber": tableNumber,
    "itemCount": itemCount,
    "totalAmount": totalAmount,
  };
}
