import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../extension/app_color_extension.dart';
import '../../themes/color_theme.dart';
import '../../themes/theme.dart';

class AttendanceItem extends StatelessWidget {
  final String label;
  final String time;
  final String status;
  final bool isCheckIn;

  const AttendanceItem({
    super.key,
    required this.label,
    required this.time,
    required this.status,
    this.isCheckIn = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              isCheckIn ? Icons.login_rounded : Icons.logout_rounded,
              color: PColor().grey,
              size: 16.sp,
            ),
            SizedBox(width: 6.w),
            Text(
              label,
              style: MyTheme.style.regular.copyWith(
                color: PColor().grey,
                fontSize: 10.sp,
                letterSpacing: 1.0,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          time,
          style: MyTheme.style.bold.copyWith(
            color: context.blackWhiteColor,
            fontSize: 24.sp,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          status,
          style: MyTheme.style.regular.copyWith(
            color: PColor().grey,
            fontSize: 12.sp,
          ),
        ),
      ],
    );
  }
}
