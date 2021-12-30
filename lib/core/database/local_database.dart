import 'package:sqflite/sqflite.dart';

abstract class LocalDatabase {
  Future insertMany(String tableName, List<Map<String, Object?>> entities);
  Future<List<Map<String, dynamic>>> getAll(String tableName);
  Future deleteAll(String tableName);
}

class LocalDatabaseImpl implements LocalDatabase {
  late final Database _database;

  LocalDatabaseImpl({required Database database}) {
    _database = database;
  }

  @override
  Future insertMany(
      String tableName, List<Map<String, Object?>> entities) async {
    try {
      final batch = _database.batch();

      for (var entityCount = 0; entityCount < entities.length; entityCount++) {
        batch.insert(tableName, entities[entityCount]);
      }
      await batch.commit(noResult: true);
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future<List<Map<String, dynamic>>> getAll(String tableName) async {
    try {
      final List<Map<String, dynamic>> map = await _database.query(
        tableName,
      );
      return map;
    } catch (ex) {
      rethrow;
    }
  }

  @override
  Future deleteAll(String tableName) async {
    try {
      await _database.delete(
        tableName,
      );
    } catch (ex) {
      rethrow;
    }
  }
}
