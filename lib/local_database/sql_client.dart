import 'package:sqflite/sqflite.dart' as sql;

class SqlClient {
  static Future<void> createTable(sql.Database database) async {
    await database.execute('''
      CREATE TABLE bookmarkTracks(
        id TEXT PRIMARY KEY NOT NULL,
        name TEXT
      )
''');
  }

  static Future<sql.Database> db() {
    return sql.openDatabase(
      'savedtracks.db',
      version: 1,
      onCreate: (db, version) async {
        await createTable(db);
      },
    );
  }

  static Future<int> createItem(String id, String name) async {
    final db = await SqlClient.db();
    final jsonData = {
      "id": id,
      "name": name,
    };
    final returnID = await db.insert(
      'bookmarkTracks',
      jsonData,
      conflictAlgorithm: sql.ConflictAlgorithm.replace,
    );

    return returnID;
  }

  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SqlClient.db();
    return db.query('bookmarkTracks');
  }

  static Future<void> deleteItem(int id) async {
    final db = await SqlClient.db();
    try {
      await db.delete('bookmarkTracks', where: "id = ?", whereArgs: [id]);
    } catch (e) {
      print(e.toString());
    }
  }
}
