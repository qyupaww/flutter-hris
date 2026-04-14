import 'package:flutter/material.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_flutter_lite/core/components/components.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_sizes.dart';
import 'package:morpheme_flutter_lite/core/extensions/date_time_extension.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/morpheme_colors.dart';
import 'package:morpheme_flutter_lite/features/home/home/presentation/cubit/home_cubit.dart';

class LiveTimeSection extends StatelessWidget {
  const LiveTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dateTime = context.select((HomeCubit cubit) => cubit.state.dateTime);

    return Column(
      spacing: ConstantSizes.s16,
      children: [
        Row(
          mainAxisAlignment: .center,
          children: [
            Container(
              width: ConstantSizes.s8,
              height: ConstantSizes.s8,
              decoration: BoxDecoration(
                color: context.color.primary.withValues(alpha: 0.8),
                shape: BoxShape.circle,
              ),
            ),
            AtomSpacing.horizontal8(),
            AtomText.bodySmall(
              'LIVE TIME',
              color: context.color.primary.withValues(alpha: 0.8),
            ),
          ],
        ),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(text: dateTime?.toFormatDateTime('HH:mm') ?? '--:--'),
              TextSpan(
                text: dateTime?.toFormatDateTime(':ss') ?? ':--',
                style: TextStyle(color: context.color.primary),
              ),
            ],
            style: TextStyle(
              fontSize: ConstantSizes.s48,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        AtomText.bodyMedium(
          dateTime?.toFormatDateTime('EEEE, d MMMM yyyy') ?? '',
        ),
      ],
    );
  }
}
