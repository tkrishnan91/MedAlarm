import 'dart:io';
import 'package:medalarm/db/Alarm.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

// database table and column names
final String tableAlarms = 'alarms';
final String columnId = '_id';
final String columnMedName = 'medname';
final String columnDosage = 'dosage';
final String columnMedTime = 'time';


// singleton class to manage the database
class DatabaseHelper {

  // This is the actual database filename that is saved in the docs directory.
  static final _databaseName = "medalarm.db";
  // Increment this version when you need to change the schema.
  static final _databaseVersion = 1;

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only allow a single open connection to the database.
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // open the database
  _initDatabase() async {
    // The path_provider plugin gets the right directory for Android or iOS.
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    // Open the database. Can also add an onUpdate callback parameter.
    return await openDatabase(path,
        version: _databaseVersion,
        onCreate: _onCreate);
  }

  // SQL string to create the database
  Future _onCreate(Database db, int version) async {
    await db.execute('''
              CREATE TABLE $tableAlarms (
                $columnId INTEGER PRIMARY KEY,
                $columnMedName TEXT NOT NULL,
                $columnMedTime TEXT NOT NULL,
                $columnDosage INTEGER NOT NULL,
              )
              ''');
  }

  // Database helper methods:

  Future<int> insert(Alarm alarm) async {
    Database db = await database;
    int id = await db.insert(tableAlarms, alarm.toMap());
    return id;
  }

  Future<Alarm> queryAlarm(int id) async {
    Database db = await database;
    List<Map> maps = await db.query(tableAlarms,
        columns: [columnId, columnDosage, columnMedTime, columnMedName],
        where: '$columnId = ?',
        whereArgs: [id]);
    if (maps.length > 0) {
      return Alarm.fromMap(maps.first);
    }
    return null;
  }
}