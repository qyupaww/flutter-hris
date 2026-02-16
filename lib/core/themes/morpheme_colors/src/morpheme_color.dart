import 'package:flutter/material.dart';

extension MorphemeColorExtension on BuildContext {
  MorphemeColor get color => Theme.of(this).extension<MorphemeColor>()!;
}

class MorphemeColor extends ThemeExtension<MorphemeColor> {
  MorphemeColor({
    required this.primary,
    required this.secondary,
    required this.white,
    required this.background,
    required this.fillTextField,
    required this.border,
    required this.grey,
    required this.bgGrey,
    required this.info,
    required this.bgInfo,
    required this.error,
    required this.bgError,
    required this.success,
    required this.bgSuccess,
    required this.warning,
    required this.bgWarning,
  });

  final Color primary;
  final Color secondary;
  final Color white;
  final Color background;
  final Color fillTextField;
  final Color border;
  final Color grey;
  final Color bgGrey;
  final Color info;
  final Color bgInfo;
  final Color error;
  final Color bgError;
  final Color success;
  final Color bgSuccess;
  final Color warning;
  final Color bgWarning;

  @override
  MorphemeColor copyWith({
    Color? primary,
    Color? secondary,
    Color? white,
    Color? background,
    Color? fillTextField,
    Color? border,
    Color? grey,
    Color? bgGrey,
    Color? info,
    Color? bgInfo,
    Color? error,
    Color? bgError,
    Color? success,
    Color? bgSuccess,
    Color? warning,
    Color? bgWarning,
  }) {
    return MorphemeColor(
      primary: primary ?? this.primary,
      secondary: secondary ?? this.secondary,
      white: white ?? this.white,
      background: background ?? this.background,
      fillTextField: fillTextField ?? this.fillTextField,
      border: border ?? this.border,
      grey: grey ?? this.grey,
      bgGrey: bgGrey ?? this.bgGrey,
      info: info ?? this.info,
      bgInfo: bgInfo ?? this.bgInfo,
      error: error ?? this.error,
      bgError: bgError ?? this.bgError,
      success: success ?? this.success,
      bgSuccess: bgSuccess ?? this.bgSuccess,
      warning: warning ?? this.warning,
      bgWarning: bgWarning ?? this.bgWarning,
    );
  }

  @override
  MorphemeColor lerp(covariant MorphemeColor? other, double t) {
    if (other is! MorphemeColor) {
      return this;
    }

    return MorphemeColor(
      primary: Color.lerp(primary, other.primary, t) ?? primary,
      secondary: Color.lerp(secondary, other.secondary, t) ?? secondary,
      white: Color.lerp(white, other.white, t) ?? white,
      background: Color.lerp(background, other.background, t) ?? background,
      fillTextField:
          Color.lerp(fillTextField, other.fillTextField, t) ?? fillTextField,
      border: Color.lerp(border, other.border, t) ?? border,
      grey: Color.lerp(grey, other.grey, t) ?? grey,
      bgGrey: Color.lerp(bgGrey, other.bgGrey, t) ?? bgGrey,
      info: Color.lerp(info, other.info, t) ?? info,
      bgInfo: Color.lerp(bgInfo, other.bgInfo, t) ?? bgInfo,
      error: Color.lerp(error, other.error, t) ?? error,
      bgError: Color.lerp(bgError, other.bgError, t) ?? bgError,
      success: Color.lerp(success, other.success, t) ?? success,
      bgSuccess: Color.lerp(bgSuccess, other.bgSuccess, t) ?? bgSuccess,
      warning: Color.lerp(warning, other.warning, t) ?? warning,
      bgWarning: Color.lerp(bgWarning, other.bgWarning, t) ?? bgWarning,
    );
  }
}
