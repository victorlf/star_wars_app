import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      // colorScheme: ColorScheme.fromSwatch(
      //   brightness:
      //   //primarySwatch: Colors.white,
      //   //accentColor: Colors.blue[700],
      // ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleSpacing: 0.0,
        //titleTextStyle: TextStyle(color: Colors.white),
      ),
      //scaffoldBackgroundColor: const Color(0xFF121212),
      scaffoldBackgroundColor: const Color(0xFF151515),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.black,
          // fixedSize: Size(
          //   SizeConfig.width * 0.25,
          //   30.0,
          // ),
        ),
      ),
    );
  }
}
