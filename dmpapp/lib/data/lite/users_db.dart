import 'package:dmpapp/models/user.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:sqflite/sqflite.dart';
import '../../libraries/data_lib.dart' as data_lib;

class UsersDB{
  final tableName = "user";

  Future<void> createUserTable(Database database) async{
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName(
        "id" INTEGER NOT NULL,
        "token" TEXT NOT NULL,
        PRIMARY KEY ("id")
      );"""
    );
  }

  Future<int> insertUserToken({required String token}) async{
    final database = await data_lib.liteContext.dataBase;

    return await database.rawInsert('''
    INSERT INTO $tableName (token) VALUES (?)
    ''',[token]);
  }

  Future<User> fetchUserToken() async{
    final database = await data_lib.liteContext.dataBase;

    final user = await database.rawQuery('''
    SELECT * FROM $tableName''');
    return user.map((luser) => User.fromSqfliteDatabase(luser)).first;
  }

  Future<String> getUserToken() async{
    String token = "";

    await data_lib.usersDB.fetchUserToken().then(
    (user){
      token = user.token;
    });

    return token;
  }

  Future<bool> validateTokenDate() async{
    String token = await data_lib.usersDB.getUserToken();

    if(JwtDecoder.isExpired(token)){
      return false;
    }

    return true;
  }

  Future<void> deleteUserToken() async{
    final database = await data_lib.liteContext.dataBase;

    await database.rawDelete('''
    DELETE FROM $tableName
    ''');
  }
}