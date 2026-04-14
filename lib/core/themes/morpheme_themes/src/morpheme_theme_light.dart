import 'package:flutter/material.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color_light.dart';

import 'morpheme_theme.dart';

final class MorphemeThemeLight extends MorphemeTheme {
  MorphemeThemeLight() : super('light');

  @override
  MorphemeColor get color => MorphemeColorLight();

  @override
  ThemeData get rawThemeData => ThemeData.light();

  @override
  ColorScheme get colorScheme =>
      ColorScheme.light(primary: color.primary, error: color.error);
}
