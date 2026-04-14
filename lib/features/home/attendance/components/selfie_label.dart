import 'package:flutter/material.dart';
import 'package:morpheme_flutter_lite/core/components/components.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_sizes.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';

class SelfieLabel extends StatelessWidget {
  const SelfieLabel({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(Icons.face, color: context.color.white, size: ConstantSizes.s24),
        SizedBox(width: ConstantSizes.s12),
        Expanded(
          child: AtomText.bodyLargeSemiBold(
            'Bukti Foto Selfie',
            color: context.color.white,
          ),
        ),
        AtomBadge.grey(text: 'Wajib'),
      ],
    );
  }
}
