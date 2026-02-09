import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_hris/core/themes/color_theme.dart';

final _color = PColor();

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: _color.primary,
      hintColor: _color.primary,
      scaffoldBackgroundColor: _color.white,
      appBarTheme: AppBarTheme(
        iconTheme: IconThemeData(color: _color.primary),
        surfaceTintColor: Colors.transparent,
        shadowColor: _color.black.withValues(alpha: 0.1),
        elevation: 6,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: _color.black,
        ),
      ),
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: _color.black,
        displayColor: _color.black,
      ),
      colorScheme: ColorScheme.light(
        primary: _color.primary,
        // secondary: _color.secondary,
        error: _color.danger,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: _color.primary,
        unselectedItemColor: _color.grey,
        backgroundColor: _color.white,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: _color.white,
          backgroundColor: _color.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: _color.primary,
      hintColor: _color.primary,
      scaffoldBackgroundColor: _color.black,
      appBarTheme: AppBarTheme(
        backgroundColor: _color.black,
        iconTheme: IconThemeData(color: _color.white),
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: _color.white,
        ),
      ),
      textTheme: GoogleFonts.poppinsTextTheme().apply(
        bodyColor: _color.white,
        displayColor: _color.white,
      ),
      colorScheme: ColorScheme.dark(
        primary: _color.primary,
        // secondary: _color.secondary,
        error: _color.danger,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: _color.primary,
        unselectedItemColor: _color.grey,
        backgroundColor: _color.black,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: _color.white,
          backgroundColor: _color.primary,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
