import 'package:sqflite/sqflite.dart' as sql;
import 'package:path/path.dart' as path;

class DBHelper {
  static Future<void> insert(String table, Map<String, Object> data) async{
    final dbPath = await sql.getDatabasesPath();
    //open database or create if not exist
    final db = await sql.openDatabase(path.join(dbPath, 'geoPlaces.db'),
    onCreate: (db, version) {
        return db.execute('CREATE TABLE user_places(id TEXT PRIMARY KEY, title TEXT, image TEXT)');
    }, version: 1);

    //if we try to insert data with id that is already in database, then overrite that record
    await db.insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
  }
}