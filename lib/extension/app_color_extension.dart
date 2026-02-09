import 'package:flutter/material.dart';
import 'package:flutter_hris/core/themes/color_theme.dart';

final _color = PColor();

extension AppColors on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  Color get blackWhiteColor {
    return isDark ? _color.white : _color.black;
  }

  Color get containerColor {
    return isDark ? _color.containerDark : _color.white;
  }

  Color get backgroundColor {
    return isDark ? _color.backgroundDark : _color.white;
  }

  Color get greyDarkColor {
    return isDark ? _color.greyDark : _color.greyLight;
  }
}
