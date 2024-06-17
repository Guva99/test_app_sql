import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:product_services/data_models/db_product.dart';
import 'package:product_services/data_models/db_table.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static final DBProvider db = DBProvider();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await initDB();

    return _database!;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationSupportDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(
      path,
      version: 2,
      onOpen: (db) {},
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE MY_LIST ("
          "id INTEGER PRIMARY KEY,"
          "title TEXT, "
          "quantity INTEGER, "
          "tableNumber INTEGER, "
          "dateTime TEXT, "
          "price INTEGER"
          ")",
        );
      },
      // onUpgrade: (Database db, int oldVersion, int newVersion) async {
      //   if (oldVersion < 2) {
      //     await db.execute("ALTER TABLE MY_LIST ADD COLUMN tableNumber INTEGER");
      //   }
      // },
    );
  }

  updateProduct(DBProduct product) async {
    final db = await database;
    var res = await db.update(
      "MY_LIST",
      product.toMap(),
      where: "id = ?",
      whereArgs: [product.id],
    );

    return res;
  }

  deleteProduct(int id) async {
    final db = await database;
    return db.delete('MY_LIST', where: "id = ?", whereArgs: [id]);
  }

  Future<void> clearAllData() async {
    final db = await database;
    await db.delete("MY_LIST");
  }

  addProduct(DBProduct product) async {
    final db = await database;
    var raw = await db.rawInsert(
      "INSERT Into MY_LIST (id ,title ,price ,quantity ,tableNumber ,dateTime )"
      "VALUES (?,?,?,?,?,?)",
      [
        product.id,
        product.title,
        product.price,
        product.quantity,
        product.tableNumber,
        product.dateTime,
      ],
    );
    return raw;
  }

  Future<List<DBProduct>> getAllProduct() async {
    final db = await database;
    var res = await db.query("MY_LIST");
    List<DBProduct> list = res.isNotEmpty ? res.map((e) => DBProduct.fromMap(e)).toList() : [];
    return list;
  }

  Future<List<DBProduct>> getProductsByTableNumber(int tableNumber) async {
    final db = await database;
    var res = await db.query(
        "MY_LIST",
        where: "tableNumber = ?",
        whereArgs: [tableNumber]
    );
    List<DBProduct> list = res.isNotEmpty ? res.map((e) => DBProduct.fromMap(e)).toList() : [];
    return list;
  }


  Future<List<DBTable>> getActiveTableDetails() async {
    final db = await database;
    List<Map<String, dynamic>> result =
        await db.rawQuery("SELECT tableNumber, COUNT(id) as itemCount, SUM(price * quantity) as totalAmount "
            "FROM MY_LIST "
            "GROUP BY tableNumber "
            "HAVING COUNT(id) > 0" // Убедитесь, что у столика есть заказы
            );
    List<DBTable> tables = result
        .map((item) => DBTable(
              tableNumber: item['tableNumber'] as int,
              itemCount: item['itemCount'] as int,
              totalAmount: item['totalAmount'] as int,
            ))
        .toList();
    return tables;
  }

  Future<void> incrementProductQuantity(int productId) async {
    final db = await database;
    await db.rawUpdate('UPDATE MY_LIST SET quantity = quantity + 1 WHERE id = ?', [productId]);
  }

  Future<void> decrementProductQuantity(int productId) async {
    final db = await database;
    await db.rawUpdate('UPDATE MY_LIST SET quantity = quantity - 1 WHERE id = ?', [productId]);
  }
}
