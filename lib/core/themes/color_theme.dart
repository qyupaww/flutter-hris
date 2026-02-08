import 'package:flutter/material.dart';

class PColor {
  static final PColor _instance = PColor._internal();
  factory PColor() => _instance;
  PColor._internal();

  // Primary colors
  Color primary = const Color(0xFFF8B522);
  // Color secondary = const Color();

  // Status colors
  Color success = const Color(0xFF4BAC87);
  Color warning = const Color(0xFFFFD93D);
  Color danger = const Color(0xFFBE3D3D);

  // Neutral colors
  Color white = const Color(0xFFF9F9F9);
  Color black = const Color(0xFF151316);
  Color grey = const Color(0xff8F95B2);

  // Dark mode specific colors
  Color containerDark = const Color(0xff26262b);
  Color backgroundDark = const Color(0xff121212);
  Color greyDark = const Color(0xffB0B3C1);
  Color greyLight = const Color(0xff8288A2);
}
