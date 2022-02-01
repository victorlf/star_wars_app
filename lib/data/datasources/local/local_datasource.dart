import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:escribo_star_wars/data/models/favorite_model.dart';
import 'package:sqflite/sqflite.dart';

import 'app_database.dart';

class LocalDatasource {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT,'
      '$_url TEXT,'
      '$_type TEXT)';

  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _url = 'url';
  static const String _type = 'type';

  Future<int> save(FavoriteModel favorite) async {
    final db = await getDatabase();
    final favoriteMap = favorite.toMap();
    return db.insert(_tableName, favoriteMap);
  }

  Future<List<FavoriteModel>> findAll() async {
    final db = await getDatabase();
    List<Map<String, dynamic>> result = await db.query(_tableName);
    final favorites =
        List<FavoriteModel>.from(result.map((x) => FavoriteModel.fromMap(x)));
    return favorites;
  }

  Future<int> remove(FavoriteModel favorite) async {
    final db = await getDatabase();
    //final favoriteMap = favorite.toMap();
    return await db
        .rawDelete('DELETE FROM $_tableName WHERE name = ?', [favorite.name]);
  }
}
