import 'dart:async';
import 'package:service_plus_app/models/response/login_response.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbHelper {
  static Database? _database;
  static final DbHelper instance = DbHelper._();

  //tablename
  String userTable = "User";

  DbHelper._();

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'serviceplus.db');
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  Future<void> _createDb(Database db, int version) async {
    await db.execute("""CREATE TABLE $userTable (
  token TEXT,
  sId TEXT PRIMARY KEY,
  name TEXT,
  email TEXT,
  password TEXT,
  type TEXT,
  iV INTEGER
)
""");
  }

  Future<int> userDetailsInsert(UserResponse data) async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(userTable, limit: 1);
    if (result.isEmpty) {
      return await db.insert(userTable, data.toJson());
    } else {
      return await db.update(userTable, data.toJson(),
          where: 'sId = ?', whereArgs: [data.sId]);
      // Replace 'id = ?' and whereArgs with appropriate condition to update specific rows
    }
  }

  Future<UserResponse> getUser() async {
    final Database db = await database;
    List<Map<String, dynamic>> data = await db.query(userTable);
    return data.map((e) => UserResponse.fromJson(e)).toList()[0];
  }
}
