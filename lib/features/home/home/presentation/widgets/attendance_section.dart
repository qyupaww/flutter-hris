import 'package:flutter/material.dart';
import 'package:morpheme_base/morpheme_base.dart';
import 'package:morpheme_flutter_lite/core/components/atoms/atoms.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_radius.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_sizes.dart';
import 'package:morpheme_flutter_lite/core/themes/morpheme_colors/src/morpheme_color.dart';
import 'package:morpheme_flutter_lite/features/home/home/presentation/cubit/home_cubit.dart';

class AttendanceSection extends StatelessWidget {
  const AttendanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.fillTextField,
        borderRadius: BorderRadius.circular(ConstantRadius.r12),
        border: Border.all(color: context.color.border),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(ConstantSizes.s16),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                AtomText.bodyMediumBold('Status Absensi'),
                AtomBadge.primary(text: 'Belum Absen'),
              ],
            ),
          ),
          Divider(color: context.color.border, height: 1),
          Padding(
            padding: EdgeInsets.all(ConstantSizes.s16),
            child: Column(
              spacing: ConstantSizes.s16,
              children: [
                IntrinsicHeight(
                  child: Row(
                    spacing: ConstantSizes.s16,
                    children: [
                      Expanded(
                        child: _StatusAttendance(
                          title: 'JAM MASUK',
                          time: '--:--',
                          status: 'Belum Absen',
                        ),
                      ),
                      VerticalDivider(color: context.color.border, width: 1),
                      Expanded(
                        child: _StatusAttendance(
                          title: 'JAM PULANG',
                          time: '--:--',
                          status: 'Belum Absen',
                        ),
                      ),
                    ],
                  ),
                ),
                AtomButton.elevated(
                  text: 'Check In Sekarang',
                  onPressed: () =>
                      context.read<HomeCubit>().onAttendancePressed(context),
                ),
                AtomText.bodySmall(
                  'Pastikan Anda berada di area kantor sebelum melakukan absensi',
                  textAlign: .center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _StatusAttendance extends StatelessWidget {
  const _StatusAttendance({
    required this.title,
    required this.time,
    required this.status,
  });

  final String title;
  final String time;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      spacing: ConstantSizes.s8,
      children: [
        Row(
          spacing: ConstantSizes.s8,
          children: [
            Icon(Icons.login, color: context.color.grey),
            Expanded(child: AtomText.bodyMediumBold(title)),
          ],
        ),
        AtomText.heading2(time),
        AtomText.bodySmall(status, color: context.color.grey),
      ],
    );
  }
}
