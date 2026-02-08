import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../extension/app_color_extension.dart';
import '../../constants/constant_sizes.dart';
import '../../themes/color_theme.dart';

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;

  const AppCard({super.key, required this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding ?? EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: context.containerColor,
        borderRadius: BorderRadius.circular(ConstantSizes.defaultRadius),
        border: Border.all(
          color: context.isDark
              ? PColor().grey.withValues(alpha: 0.1)
              : PColor().grey.withValues(alpha: 0.2),
          width: 1,
        ),
      ),
      child: child,
    );
  }
}
