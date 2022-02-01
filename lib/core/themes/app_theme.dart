import 'dart:ui';

import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        titleSpacing: 8.0,
      ),
      scaffoldBackgroundColor: const Color(0xFF151515),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
