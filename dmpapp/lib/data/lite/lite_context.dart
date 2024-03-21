import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../../libraries/data_lib.dart' as data_lib;

//SQLite CRUD BASED ON: https://www.youtube.com/watch?v=9kbt4SBKhm0&t=257s
//HeyFlutter.com - Flutter SQL Database Storage Using SQLite & Sqflite CRUD - Youtube

class LiteContext{
  Database? _dataBase;

  Future<Database> get dataBase async{
    if(_dataBase != null){
      return _dataBase!;
    }

    _dataBase = await _initialize();
    return _dataBase!;
  }

  Future<String> get fullPath async{
    const name = 'products.db';
    final path = await getDatabasesPath();

    return join(path,name);
  }

  Future<Database> _initialize() async{
    final path = await fullPath;
    var database = await openDatabase(
      path,
      version: 1,
      onCreate: create,
      singleInstance: true
    );
    return database;
  }

  Future<void> create(Database database, int version)async { 
    await data_lib.usersDB.createUserTable(database);
    await data_lib.favoritesDB.createFavoritesTable(database);
  } 
}