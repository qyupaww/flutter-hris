import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_hris/extension/app_color_extension.dart';
import 'package:flutter_hris/core/themes/color_theme.dart';
import 'package:flutter_hris/core/themes/theme.dart';
import 'package:flutter_hris/core/components/atoms/atom_badge.dart';
import 'package:flutter_hris/core/components/atoms/atom_card.dart';
import 'package:flutter_hris/core/components/atoms/atom_custom_button.dart';
import 'package:flutter_hris/core/components/molecules/molecule_attendance_item.dart';

class AttendanceCard extends StatelessWidget {
  final VoidCallback onCheckOutPressed;

  const AttendanceCard({super.key, required this.onCheckOutPressed});

  @override
  Widget build(BuildContext context) {
    return AtomCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  'Status Absensi',
                  style: MyTheme.style.semiBold.copyWith(
                    color: context.blackWhiteColor,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              AtomBadge(
                label: 'SUDAH CHECK-IN',
                variant: AtomBadgeVariant.warning,
              ),
            ],
          ),
          Divider(color: PColor().grey.withValues(alpha: 0.2), height: 32.h),
          Row(
            children: [
              Expanded(
                child: MoleculeAttendanceItem(
                  label: 'JAM MASUK',
                  time: '08:00',
                  status: 'Tepat Waktu',
                  isCheckIn: true,
                ),
              ),
              Container(
                width: 1,
                height: 50.h,
                color: PColor().grey.withValues(alpha: 0.2),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: MoleculeAttendanceItem(
                  label: 'JAM PULANG',
                  time: '--:--',
                  status: 'Belum Absen',
                  isCheckIn: false,
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          AtomButton(
            label: 'Check Out Sekarang',
            onPressed: onCheckOutPressed,
            variant: AtomButtonVariant.primary,
          ),
          SizedBox(height: 12.h),
          Center(
            child: Text(
              'Pastikan Anda berada di area kantor sebelum melakukan absensi',
              textAlign: TextAlign.center,
              style: MyTheme.style.regular.copyWith(
                color: PColor().grey,
                fontSize: 10.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
