import 'package:escribo_star_wars/core/http_client/http_client_imp.dart';
import 'package:escribo_star_wars/data/datasources/remote/remote_datasource.dart';
import 'package:escribo_star_wars/data/repositories/remote_repository.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/local/local_datasource.dart';
import 'data/repositories/local_repository.dart';

GetIt initInjections() {
  final i = GetIt.instance;

  i.registerFactory(() => HttpClientImp());
  i.registerFactory(() => RemoteDatasource(i<HttpClientImp>()));
  i.registerFactory(() => RemoteRepository(i<RemoteDatasource>()));
  i.registerFactory(() => LocalDatasource());
  i.registerFactory(() => LocalRepository(i<LocalDatasource>()));

  return i;
}
