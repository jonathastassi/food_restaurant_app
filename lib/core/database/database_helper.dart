import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String databaseName = 'restaurants_cache.db';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;

  Database? get database => _database;

  static Future<void> initializeDatabase() async {
    _database = await _startDatabase();
  }

  static Future<Database> _startDatabase() async {
    final database = await openDatabase(
        join(await getDatabasesPath(), databaseName),
        version: 1, onCreate: (Database db, int version) async {
      await db.execute('''
        create table RESTAURANTS ( 
          id integer not null, 
          name text not null,
          address text not null,
          image text not null,
          hours text
          )
        ''');
    });

    return database;
  }
}
