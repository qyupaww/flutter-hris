import 'package:flutter/material.dart';
import 'package:morpheme_flutter_lite/core/components/atoms/atom_spacing.dart';
import 'package:morpheme_flutter_lite/core/components/atoms/atom_text.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, required this.title, required this.subtitle});

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        AtomText.heading1(title),
        AtomSpacing.vertical16(),
        AtomText.bodyLarge(subtitle, color: context.color.grey),
      ],
    );
  }
}
