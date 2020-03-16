import 'dart:io';

import 'package:aasignupapp/_details.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  static DatabaseHelper _databaseHelper; // Singleton DatabaseHelper (only once in whole app)
  static Database _database;
  String DetailTable = 'detail_table';
  String Colusername = 'username';
  String Colemail = 'email';
  String Colmobile = 'mobile';
  String Colpassword = 'password';


  DatabaseHelper._createInstance();

  factory DatabaseHelper() {

    if ( _databaseHelper == null ) {
      _databaseHelper = DatabaseHelper._createInstance();
    }

    return _databaseHelper;
  }

  Future<Database> get database async {

    if ( _database == null ) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path to store database
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'details.db';

    // Open/create the database
    var DetailDatabase = await openDatabase(path, version: 1, onCreate: _createDb);
    return DetailDatabase;
  }

  void _createDb(Database db, int newV) async {
    await db.execute('CREATE TABLE $DetailTable($Colusername TEXT PRIMARY KEY, $Colemail TEXT, '
        '$Colmobile INTEGER, $Colpassword TEXT, )');
  }

  // Insert operation :
  Future<int> insertDetail(Details details) async {
    Database db = await this.database;
    var result = await db.insert(DetailTable, Details.toMap());
    return result;
  }

}