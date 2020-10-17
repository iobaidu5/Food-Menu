import 'dart:io';
import 'package:foodUI/models/data.dart';
import 'package:foodUI/models/image.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  static const String tableItem = 'itemTable';
  static const String tableImage = "imageTable";
  static const String tableData = "dataTable";

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._createInstance();
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'FOOD.db';
    return await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
      onOpen: (db) => print('Database is being opened!'),
    );
  }

  void _createDb(Database db, int version) async {
    await db.execute(
      """CREATE TABLE $tableData(id INTEGER PRIMARY KEY AUTOINCREMENT, 
      name STRING, number STRING, price STRING, amount STRING)""",
    );
    await db.execute(
      """CREATE TABLE $tableImage(id INTEGER PRIMARY KEY AUTOINCREMENT, name STRING,
        quantity STRING, amount STRING, image STRING)""",
    );
    await db.execute(
      """CREATE TABLE $tableItem(id INTEGER PRIMARY KEY AUTOINCREMENT, item STRING)""",
    );

    print('Database is being created');
  }

  Future<List<MyImage>> getImages() async {
    Database database = await this.database;
    var result = await database.rawQuery("SELECT * FROM imageTable");
    print(result);
    List<MyImage> data = result.isNotEmpty
        ? result.map((c) => MyImage.fromMap(c)).toList()
        : null;
    print("Get Values $data");
    return data;
  }

  Future<int> insertData(name, number, price, amount) async {
    Database database = await this.database;

    int result = await database.insert(tableData,
        {'name': name, 'number': number, 'price': price, 'amount': amount});
    return result;
  }

  Future<int> insertImage(
      String name, String quantity, String amount, String image) async {
    Database database = await this.database;

    int result = await database.insert(tableImage,
        {'name': name, 'quantity': quantity, 'amount': amount, 'image': image});
    return result;
  }

  Future<int> insertItem(String val) async {
    Database database = await this.database;
    // int result = await database
    //     .rawInsert("""INSERT INTO $tableItem (item) VALUES ($val)""");

    int result = await database.insert(tableItem, {'val': val});
    return result;
  }

  Future<int> getItems() async {
    Database database = await this.database;
    var result = await database.rawQuery("SELECT * FROM itemTable");
    return Sqflite.firstIntValue(result);
  }

  Future<List<Data>> getData() async {
    Database database = await this.database;
    var result = await database.rawQuery("SELECT * FROM dataTable");
    print(result);
    List<Data> data =
        result.isNotEmpty ? result.map((c) => Data.fromMap(c)).toList() : null;
    print("Get Values $data");
    return data;
  }

  Future<int> getCount() async {
    Database database = await this.database;
    var result = await database.rawQuery("SELECT COUNT(amount) FROM dataTable");
    return Sqflite.firstIntValue(result);
  }

  Future<int> deleteAll() async {
    Database database = await this.database;
    var result = await database.rawQuery("TRUNCATE table dataTable");
    return Sqflite.firstIntValue(result);
  }
}
