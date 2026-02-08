import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/constants/constant_sizes.dart';
import 'package:mobile/core/themes/color_theme.dart';

enum AppIconVariant { primary, success, warning, danger, neutral }

class AppIconBox extends StatelessWidget {
  final IconData icon;
  final AppIconVariant variant;

  const AppIconBox({
    super.key,
    required this.icon,
    this.variant = AppIconVariant.primary,
  });

  @override
  Widget build(BuildContext context) {
    final baseColor = _getColor();

    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        color: baseColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(ConstantSizes.defaultRadius),
      ),
      child: Center(
        child: Icon(icon, color: baseColor, size: 20.sp),
      ),
    );
  }

  Color _getColor() {
    final colors = PColor();
    switch (variant) {
      case AppIconVariant.primary:
        return colors.primary;
      case AppIconVariant.success:
        return colors.success;
      case AppIconVariant.warning:
        return colors.warning;
      case AppIconVariant.danger:
        return colors.danger;
      case AppIconVariant.neutral:
        return colors.grey;
    }
  }
}
