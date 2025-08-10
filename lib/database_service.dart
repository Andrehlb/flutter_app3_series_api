import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static const _databaseName = 'tv_shows_database.db';
  static const _databaseVersion = 1;

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tv_shows (
        id INTEGER PRIMARY KEY,
        imageUrl TEXT,
        name TEXT,
        webChannel TEXT,
        rating REAL,
        summary TEXT
      )
    ''');
  }
}