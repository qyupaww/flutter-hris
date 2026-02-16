import 'package:flutter/material.dart' show BuildContext;
import 'package:morpheme_flutter_lite/core/l10n/s.dart';
import 'package:morpheme_flutter_lite/core/l10n/s_id.dart';

extension LocalizationExtension on BuildContext {
  S get s => S.of(this) ?? SId();
}
