import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/atoms/app_card.dart';
import '../../../../core/components/atoms/app_icon_badge.dart';
import '../../../../core/themes/color_theme.dart';
import '../../../../core/themes/theme.dart';
import '../../../../extension/app_color_extension.dart';

class HomeLocationCard extends StatelessWidget {
  const HomeLocationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      child: Row(
        children: [
          const AppIconBox(
            icon: Icons.navigation,
            variant: AppIconVariant.primary,
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LOKASI SAAT INI',
                  style: MyTheme.style.regular.copyWith(
                    color: PColor().grey,
                    fontSize: 11.sp,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  'Sumedang, Kec.Tanjungsari',
                  style: MyTheme.style.medium.copyWith(
                    color: context.blackWhiteColor,
                    fontSize: 13.sp,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh, color: context.blackWhiteColor),
          ),
        ],
      ),
    );
  }
}
