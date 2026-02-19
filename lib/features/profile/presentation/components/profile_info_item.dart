import 'package:flutter/material.dart';
import 'package:morpheme_flutter_lite/core/components/components.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_sizes.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';

class ProfileInfoItem extends StatelessWidget {
  const ProfileInfoItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: ConstantSizes.defaultPadding,
        vertical: ConstantSizes.s16,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(ConstantSizes.s8),
            decoration: BoxDecoration(
              color: context.color.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: context.color.primary, size: 20),
          ),
          const AtomSpacing.horizontal16(),
          AtomText.bodyMediumBold(label, color: context.color.white),
          const AtomSpacing.horizontal16(),
          Expanded(
            child: AtomText.bodyMedium(
              value,
              textAlign: TextAlign.end,
              color: context.color.white,
            ),
          ),
        ],
      ),
    );
  }
}
