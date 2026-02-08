import 'package:flutter/material.dart';

abstract class Themes {
  static ThemeData lightTheme = ThemeData();

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Color(0xFF0B0B0C),
    colorSchemeSeed: Color(0xFFF8B522),
  );
}
