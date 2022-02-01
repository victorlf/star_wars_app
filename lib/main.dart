import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:escribo_star_wars/data/datasources/local/local_datasource.dart';
import 'package:escribo_star_wars/data/models/favorite_model.dart';
import 'package:escribo_star_wars/data/repositories/local_repository.dart';
import 'package:flutter/material.dart';
import 'app_widget.dart';
import 'core/errors/failures.dart';

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

  // final LocalRepository ld = LocalRepository(LocalDatasource());
  // final ldSave = await ld.save(FavoriteModel(
  //     id: 0,
  //     name: "C-3PO",
  //     url: "https://swapi.dev/api/people/2/",
  //     type: 'character'));
  // ldSave.fold((l) => null, (r) => print('save $r'));

  // final rf = await ld.remove(FavoriteModel(
  //     id: 0,
  //     name: "C-3PO",
  //     url: "https://swapi.dev/api/people/2/",
  //     type: 'character'));

  // final lf = await ld.findAll();
  // lf.fold((l) => null, (r) {
  //   for (var c in r) {
  //     print(c.toString());
  //   }
  // });

  HttpOverrides.global = MyHttpOverrides();

  runApp(const AppWidget());
}
