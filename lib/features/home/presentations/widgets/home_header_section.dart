import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/components/atoms/app_badge.dart';
import 'package:mobile/core/themes/color_theme.dart';
import 'package:mobile/core/themes/theme.dart';
import 'package:mobile/extension/app_color_extension.dart';
import 'package:mobile/utils/theme_manager.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = context.isDark;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Pagi,',
              style: MyTheme.style.regular.copyWith(
                color: PColor().grey,
                fontSize: 12.sp,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'Faisal Rahman',
              style: MyTheme.style.bold.copyWith(
                color: context.blackWhiteColor,
                fontSize: 18.sp,
              ),
            ),
            SizedBox(height: 8.h),
            const AppBadge(
              label: 'Mobile Developer',
              variant: AppBadgeVariant.warning,
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
              icon: Icon(
                isDark ? Icons.light_mode : Icons.dark_mode,
                color: PColor().primary,
              ),
              tooltip: isDark ? 'Switch to Light Mode' : 'Switch to Dark Mode',
              onPressed: () => ThemeManager().toggleTheme(),
            ),
            SizedBox(width: 8.w),
            CircleAvatar(
              radius: 24.r,
              backgroundImage: const NetworkImage(
                'https://i.pravatar.cc/150?img=11',
              ),
              backgroundColor: PColor().greyLight,
            ),
          ],
        ),
      ],
    );
  }
}
