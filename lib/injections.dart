import 'dart:io';

import 'package:escribo_star_wars/controller/cubit/api_cubit.dart';
import 'package:escribo_star_wars/controller/cubit/home_menu_cubit.dart';
import 'package:escribo_star_wars/core/http_client/http_client_imp.dart';
import 'package:escribo_star_wars/data/datasources/remote/remote_datasource.dart';
import 'package:escribo_star_wars/data/repositories/remote_repository.dart';
import 'package:get_it/get_it.dart';

GetIt initInjections() {
  final i = GetIt.instance;

  i.registerFactory(() => HttpClientImp());
  i.registerFactory(() => RemoteDatasource(i<HttpClientImp>()));
  i.registerFactory(() => RemoteRepository(i<RemoteDatasource>()));

  return i;
}
