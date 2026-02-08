import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/themes/color_theme.dart';
import '../../../../core/themes/theme.dart';
import '../../../../extension/app_color_extension.dart';

class HomeLiveTimeSection extends StatelessWidget {
  const HomeLiveTimeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            '● LIVE TIME',
            style: MyTheme.style.bold.copyWith(
              color: PColor().primary,
              fontSize: 14.sp,
              letterSpacing: 1.2,
            ),
          ),
          SizedBox(height: 8.h),
          Text.rich(
            TextSpan(
              style: MyTheme.style.bold.copyWith(fontSize: 48.sp, height: 1.0),
              children: [
                TextSpan(
                  text: '16:51',
                  style: TextStyle(color: context.blackWhiteColor),
                ),
                TextSpan(
                  text: ':27',
                  style: TextStyle(color: PColor().primary),
                ),
              ],
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Minggu, 8 Februari 2026',
            style: MyTheme.style.medium.copyWith(
              color: PColor().grey,
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    );
  }
}
