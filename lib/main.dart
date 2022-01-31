import 'dart:io';

import 'package:escribo_star_wars/data/repositories/remote_repository.dart';
import 'package:flutter/material.dart';
import 'app_widget.dart';
import 'core/http_client/http_client_imp.dart';
import 'data/datasources/remote_datasource.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // if (Platform.isAndroid) {
  //   await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  // }

  HttpOverrides.global = MyHttpOverrides();

  final r = RemoteRepository(RemoteDatasource(HttpClientImp()));
  final l = await r.getAllMovies();
  l.fold((e) => print(e.toString()), (success) {
    for (var m in success) {
      print(m.toString());
    }
  });

  runApp(const AppWidget());
}
