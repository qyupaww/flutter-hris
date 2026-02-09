import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_hris/core/constants/constant_sizes.dart';
import 'package:flutter_hris/core/themes/color_theme.dart';
import 'package:flutter_hris/core/themes/theme.dart';

enum AppBadgeVariant { primary, success, warning, danger, neutral }

class AppBadge extends StatelessWidget {
  final String label;
  final AppBadgeVariant variant;

  const AppBadge({
    super.key,
    required this.label,
    this.variant = AppBadgeVariant.primary,
  });

  @override
  Widget build(BuildContext context) {
    final baseColor = _getBadgeColor();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: baseColor.withValues(alpha: 0.15),

        border: Border.all(color: baseColor.withValues(alpha: 0.3), width: 1),

        borderRadius: BorderRadius.circular(ConstantSizes.defaultRadius),
      ),
      child: Text(
        label,
        style: MyTheme.style.medium.copyWith(color: baseColor, fontSize: 12.sp),
      ),
    );
  }

  Color _getBadgeColor() {
    final colors = PColor();

    switch (variant) {
      case AppBadgeVariant.primary:
        return colors.primary;
      case AppBadgeVariant.success:
        return colors.success;
      case AppBadgeVariant.warning:
        return colors.warning;
      case AppBadgeVariant.danger:
        return colors.danger;
      case AppBadgeVariant.neutral:
        return colors.grey;
    }
  }
}
