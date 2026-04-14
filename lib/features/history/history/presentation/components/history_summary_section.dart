import 'package:flutter/material.dart';
import 'package:morpheme_flutter_lite/core/components/atoms/atom_spacing.dart';
import 'package:morpheme_flutter_lite/core/components/atoms/atom_text.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_sizes.dart';
import 'package:morpheme_flutter_lite/core/extensions/localization_extension.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';

class HistorySummarySection extends StatelessWidget {
  const HistorySummarySection({
    super.key,
    required this.presentCount,
    required this.lateCount,
    required this.absentCount,
  });

  final int presentCount;
  final int lateCount;
  final int absentCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _SummaryBox(
            title: context.s.onTime,
            count: presentCount.toString(),
            icon: Icons.check_circle,
            iconColor: context.color.success,
          ),
        ),
        const AtomSpacing.horizontal12(),
        Expanded(
          child: _SummaryBox(
            title: context.s.late,
            count: lateCount.toString(),
            icon: Icons.warning_rounded,
            iconColor: context.color.error,
          ),
        ),
        const AtomSpacing.horizontal12(),
        Expanded(
          child: _SummaryBox(
            title: context.s.absent,
            count: absentCount.toString(),
            icon: Icons.cancel,
            iconColor: context.color.grey,
          ),
        ),
      ],
    );
  }
}

class _SummaryBox extends StatelessWidget {
  const _SummaryBox({
    required this.title,
    required this.count,
    required this.icon,
    required this.iconColor,
  });

  final String title;
  final String count;
  final IconData icon;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.color.fillTextField,
        borderRadius: BorderRadius.circular(ConstantSizes.s12),
        border: Border.all(color: context.color.bgGrey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: AtomText.bodySmall(
                  title,
                  color: context.color.grey,
                  fontWeight: FontWeight.bold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(width: 4),
              Icon(icon, size: 16, color: iconColor),
            ],
          ),
          const AtomSpacing.vertical8(),
          AtomText.bodyLarge(count, fontWeight: FontWeight.bold),
        ],
      ),
    );
  }
}
