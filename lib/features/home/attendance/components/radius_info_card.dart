import 'package:flutter/material.dart';
import 'package:morpheme_flutter_lite/core/components/components.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_radius.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_sizes.dart';
import 'package:morpheme_flutter_lite/core/l10n/s.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';

class RadiusInfoCard extends StatelessWidget {
  final double distanceInMeters;
  final bool isInRadius;
  final double gpsAccuracy;
  final VoidCallback onRefresh;

  const RadiusInfoCard({
    super.key,
    required this.distanceInMeters,
    required this.isInRadius,
    required this.gpsAccuracy,
    required this.onRefresh,
  });

  String _statusText(BuildContext context) => isInRadius
      ? (S.of(context)?.insideRadius ?? 'DALAM RADIUS')
      : (S.of(context)?.outsideRadius ?? 'DILUAR RADIUS');

  Color _statusColor(BuildContext context) =>
      isInRadius ? context.color.success : context.color.error;

  String _distanceText(BuildContext context) => distanceInMeters < 1000
      ? '${distanceInMeters.toStringAsFixed(0)} ${S.of(context)?.meters ?? "meter"}'
      : '${(distanceInMeters / 1000).toStringAsFixed(1)} ${S.of(context)?.km ?? "km"}';

  String _gpsLabel(BuildContext context) {
    if (gpsAccuracy <= 10) {
      return S.of(context)?.gpsVeryAccurate ?? 'GPS Sangat Akurat';
    }
    if (gpsAccuracy <= 30) {
      return S.of(context)?.gpsAccurate ?? 'GPS Akurat';
    }
    if (gpsAccuracy <= 50) {
      return S.of(context)?.gpsEnough ?? 'GPS Cukup';
    }
    return S.of(context)?.gpsPoor ?? 'GPS Kurang Akurat';
  }

  double get _gpsBarFactor {
    if (gpsAccuracy <= 5) return 1.0;
    if (gpsAccuracy <= 10) return 0.9;
    if (gpsAccuracy <= 20) return 0.75;
    if (gpsAccuracy <= 50) return 0.5;
    return 0.25;
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _statusColor(context);

    return Container(
      padding: const EdgeInsets.all(ConstantSizes.s16),
      decoration: BoxDecoration(
        color: context.color.fillTextField,
        borderRadius: BorderRadius.circular(ConstantRadius.r16),
        border: Border.all(color: context.color.bgGrey, width: 1),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: ConstantSizes.s16,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: ConstantSizes.s4,
                  children: [
                    Row(
                      spacing: ConstantSizes.s8,
                      children: [
                        Icon(
                          Icons.circle,
                          size: ConstantSizes.s12,
                          color: statusColor,
                        ),
                        AtomText.bodySmall(
                          _statusText(context),
                          color: statusColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                    AtomText.bodyLarge(
                      _distanceText(context),
                      color: context.color.white,
                    ),
                    AtomText.bodySmall(
                      S.of(context)?.distanceDescription ??
                          'Jarak dari titik pusat kantor',
                      color: context.color.grey,
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: onRefresh,
                borderRadius: BorderRadius.circular(ConstantRadius.r8),
                child: Column(
                  spacing: ConstantSizes.s4,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(ConstantSizes.s8),
                      decoration: BoxDecoration(
                        color: statusColor.withValues(alpha: 0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.refresh,
                        color: statusColor,
                        size: ConstantSizes.s20,
                      ),
                    ),
                    AtomText.bodySmall(
                      S.of(context)?.refresh ?? 'Refresh',
                      color: context.color.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            spacing: ConstantSizes.s12,
            children: [
              Icon(
                Icons.satellite_alt,
                color: statusColor,
                size: ConstantSizes.s20,
              ),
              Expanded(
                child: Container(
                  height: ConstantSizes.s8,
                  decoration: BoxDecoration(
                    color: context.color.grey.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(ConstantRadius.r8),
                  ),
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: _gpsBarFactor,
                    child: Container(
                      decoration: BoxDecoration(
                        color: statusColor,
                        borderRadius: BorderRadius.circular(ConstantRadius.r8),
                      ),
                    ),
                  ),
                ),
              ),
              AtomText.bodySmall(_gpsLabel(context), color: statusColor),
            ],
          ),
        ],
      ),
    );
  }
}
