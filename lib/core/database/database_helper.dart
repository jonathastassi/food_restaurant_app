import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String databaseName = 'restaurants_cache.db';

class DatabaseHelper {
  static Future<Database> startDatabase() async {
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
