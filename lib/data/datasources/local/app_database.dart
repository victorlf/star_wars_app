import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'local_datasource.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'escriboStarWars.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(LocalDatasource.tableSql);
    },
    version: 1,
    //onDowngrade: onDatabaseDowngradeDelete,
  );
}
