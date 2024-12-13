import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class SqfliteHelper {
  static const tableName = "todoList";

  Future<Database> openMyDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'myToDoDatabase.db'),
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE $tableName (
           id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
           title TEXT NOT NULL
          )
          ''');
      },
    );
  }

  Future<void> insertTask(String title) async {
    final db = await openMyDatabase();
    await db.insert(
      tableName,
      {'title': title},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> updateTask(int id, String title) async {
    final db = await openMyDatabase();
    await db.update(
      tableName,
      {'title': title},
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> deleteTask(int id) async {
    final db = await openMyDatabase();
    await db.delete(
      tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<Map<String, Object?>>> getTasks() async {
    final db = await openMyDatabase();
    return await db.query(tableName);
  }
}
