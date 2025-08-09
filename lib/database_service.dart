import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static const _databaseName = 'tv_shows_database.db';
  static const _databaseVersion = 1;

  static Database? _database;
