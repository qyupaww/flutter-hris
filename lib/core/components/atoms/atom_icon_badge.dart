import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_hris/core/constants/constant_sizes.dart';
import 'package:flutter_hris/core/themes/color_theme.dart';

enum AtomIconVariant { primary, success, warning, danger, neutral }

class AtomIconBox extends StatelessWidget {
  final IconData icon;
  final AtomIconVariant variant;

  const AtomIconBox({
    super.key,
    required this.icon,
    this.variant = AtomIconVariant.primary,
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
      case AtomIconVariant.primary:
        return colors.primary;
      case AtomIconVariant.success:
        return colors.success;
      case AtomIconVariant.warning:
        return colors.warning;
      case AtomIconVariant.danger:
        return colors.danger;
      case AtomIconVariant.neutral:
        return colors.grey;
    }
  }
}
