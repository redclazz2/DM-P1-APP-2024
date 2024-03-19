import 'package:dmpapp/models/product.dart';
import 'package:sqflite/sqflite.dart';
import '../../libraries/data_lib.dart' as data_lib;

class FavoritesDB {
  final tableName = "favorites";

  Future<void> createFavoritesTable(Database database) async {
    await database.execute("""
      CREATE TABLE IF NOT EXISTS $tableName(
        "id" INTEGER NOT NULL,
        "name" VARCHAR NOT NULL,
        "seller" VARCHAR NOT NULL,
        "rating" REAL NOT NULL,
        "image" VARCHAR NOT NULL,
        "isFavorite" INTEGER NOT NULL
      );""");
  }

  Future<int> insertFavoriteProduct({required Product product}) async {
    final database = await data_lib.liteContext.dataBase;

    return await database.rawInsert('''
    INSERT INTO $tableName (id, name, seller, rating, image, isFavorite) 
    VALUES (?, ?, ?, ?, ?, ?);
    ''', [
      product.id,
      product.name,
      product.seller,
      product.rating,
      product.image,
      product.isFavorite
    ]);
  }

  Future<void> handleFavoriteProducts() async {
    deleteFavorites();

    await data_lib.dataContext.getFavorites().then((value) => {
          for (Product product in value)
            {insertFavoriteProduct(product: product)}
        });
  }

  Future<List<Product>> fetchFavoriteProducts() async {
    final database = await data_lib.liteContext.dataBase;

    final products = await database.rawQuery('''
    SELECT * FROM $tableName''');

    try {
      return products
          .map((product) => Product.fromSqfliteDatabase(product))
          .toList();
    } catch (e) {
      return [];
    }
  }

  Future<dynamic> fetchFavoriteProduct(id) async {
    final database = await data_lib.liteContext.dataBase;

    final products = await database.rawQuery('''
    SELECT * FROM $tableName WHERE ID = ?;''', [id]);

    try {
      return products
          .map((product) => Product.fromSqfliteDatabase(product)).firstOrNull;
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteFavorite(id) async {
    final database = await data_lib.liteContext.dataBase;

    await database.rawDelete('''
    DELETE FROM $tableName WHERE ID = ?
    ''', [id]);
  }

  Future<void> deleteFavorites() async {
    final database = await data_lib.liteContext.dataBase;

    await database.rawDelete('''
    DELETE FROM $tableName
    ''');
  }
}
