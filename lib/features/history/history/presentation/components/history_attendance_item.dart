import 'package:flutter/material.dart';
import 'package:morpheme_flutter_lite/core/components/atoms/atom_spacing.dart';
import 'package:morpheme_flutter_lite/core/components/atoms/atom_text.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_sizes.dart';
import 'package:morpheme_flutter_lite/core/l10n/s.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';
import 'package:morpheme_flutter_lite/features/history/history/domain/entities/history_entity.dart';

import 'package:intl/intl.dart';

class HistoryAttendanceItem extends StatelessWidget {
  const HistoryAttendanceItem({super.key, required this.data});

  final DataHistory data;

  String _formatUtcToLocal(String? timeStr) {
    if (timeStr == null || timeStr.isEmpty) return '--:--';
    try {
      final parts = timeStr.split(':');
      if (parts.length >= 2) {
        final hh = int.parse(parts[0]);
        final mm = int.parse(parts[1]);
        var ss = 0;
        if (parts.length >= 3) {
          ss = int.parse(parts[2].split('.')[0]);
        }
        final utcDate = DateTime.utc(2000, 1, 1, hh, mm, ss);
        final localDate = utcDate.toLocal();
        return DateFormat('HH:mm:ss').format(localDate);
      }
    } catch (_) {}
    return timeStr;
  }

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    IconData statusIcon;
    String statusLabel;

    switch (data.status?.toLowerCase()) {
      case 'on_time':
      case 'on time':
      case 'present':
        statusColor = context.color.success;
        statusIcon = Icons.check_circle;
        statusLabel = S.of(context)?.onTime ?? 'Tepat Waktu';
        break;
      case 'late':
        statusColor = context.color.error;
        statusIcon = Icons.warning_rounded;
        statusLabel = S.of(context)?.late ?? 'Terlambat';
        break;
      case 'absent':
        statusColor = context.color.warning;
        statusIcon = Icons.cancel;
        statusLabel = S.of(context)?.absent ?? 'Alpha';
        break;
      default:
        statusColor = context.color.warning;
        statusIcon = Icons.hourglass_bottom;
        statusLabel = S.of(context)?.notCheckedInYet ?? 'Belum Check-in';
    }

    String formattedDate = 'Hari Ini';
    if (data.date != null) {
      formattedDate = DateFormat('dd MMM yyyy').format(data.date!.toLocal());
    }

    final localCheckIn = _formatUtcToLocal(data.checkInTime);
    final localCheckOut = _formatUtcToLocal(data.checkOutTime);

    return Container(
      decoration: BoxDecoration(
        color: context.color.fillTextField,
        borderRadius: BorderRadius.circular(ConstantSizes.s12),
        border: Border.all(color: context.color.bgGrey),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: statusColor.withAlpha(51),
                    borderRadius: BorderRadius.circular(ConstantSizes.s12),
                  ),
                  child: Icon(statusIcon, color: statusColor, size: 24),
                ),
                const AtomSpacing.horizontal16(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AtomText.bodyMediumBold(
                        formattedDate,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const AtomSpacing.vertical4(),
                      AtomText.bodyMedium(
                        'Shift Pagi • 08:00 - 17:00',
                        color: context.color.grey,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor.withAlpha(26),
                    borderRadius: BorderRadius.circular(ConstantSizes.s16),
                    border: Border.all(color: statusColor.withAlpha(77)),
                  ),
                  child: AtomText.bodyMedium(
                    statusLabel,
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Divider(color: context.color.bgGrey.withAlpha(77), height: 1),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AtomText.bodySmall(
                        S.of(context)?.timeInTitle ?? 'JAM MASUK',
                        color: context.color.grey,
                      ),
                      const AtomSpacing.vertical4(),
                      AtomText.bodyLarge(
                        localCheckIn,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 1,
                  height: 30,
                  color: context.color.bgGrey.withAlpha(77),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AtomText.bodySmall(
                        S.of(context)?.timeOutTitle ?? 'JAM PULANG',
                        color: context.color.grey,
                      ),
                      const AtomSpacing.vertical4(),
                      AtomText.bodyLarge(
                        localCheckOut,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
