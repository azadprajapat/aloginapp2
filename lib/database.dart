import 'dart:io';

import 'package:aasignupapp/_details.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {

  static DatabaseHelper _databaseHelper; // Singleton DatabaseHelper (only once in whole app)
  static Database _database;
  String detailTable = 'detail_table';
  String ColId='id';
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
    await db.execute('CREATE TABLE $detailTable($ColId INTEGER PRIMARY KEY AUTOINCREMENT ,  $Colusername TEXT , $Colemail TEXT, '
        '$Colmobile INTEGER, $Colpassword TEXT, )');
  }

  // Insert operation :
  Future<int> insertDetail(Details details) async {
    Database db = await this.database;
      var result = await db.insert(detailTable, details.toMap());
      return result;

  }
  Future<List<Map<String, dynamic>>> getDetailMapList() async {
    Database db = await this.database;

//		var result = await db.rawQuery('SELECT * FROM $noteTable order by $colPriority ASC');
    var result = await db.query(detailTable, orderBy: '$ColId ASC ');
    return result;
  }
  Future<List<Details>> getDetailList() async {

    var detailMapList = await getDetailMapList(); // Get 'Map List' from database
    int count = detailMapList.length;         // Count the number of map entries in db table

    List<Details> detailList = List<Details>();
    // For loop to create a 'Note List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      detailList.add(Details.fromMapObject(detailMapList[i]));
    }

    return detailList;
  }



}