import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_hris/extension/app_color_extension.dart';
import 'package:flutter_hris/core/constants/constant_sizes.dart';
import 'package:flutter_hris/core/themes/color_theme.dart';
import 'package:flutter_hris/core/themes/theme.dart';

enum AppButtonVariant { primary, secondary, tertiary }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final AppButtonVariant variant;
  final double? width;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
    this.width = double.infinity,
  });

  @override
  Widget build(BuildContext context) {
    if (variant == AppButtonVariant.primary) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: PColor().black,
          minimumSize: Size(width ?? double.infinity, 54.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ConstantSizes.defaultRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: MyTheme.style.semiBold.copyWith(
            color: PColor().black,
            fontSize: 14.sp,
          ),
        ),
      );
    }

    if (variant == AppButtonVariant.secondary) {
      return OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: Theme.of(context).primaryColor,
          side: BorderSide(color: context.greyDarkColor),
          minimumSize: Size(width ?? double.infinity, 54.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(ConstantSizes.defaultRadius),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: MyTheme.style.semiBold.copyWith(
            color: Theme.of(context).primaryColor,
            fontSize: 14.sp,
          ),
        ),
      );
    }

    return TextButton(
      style: TextButton.styleFrom(
        foregroundColor: Theme.of(context).primaryColor,
        minimumSize: Size(width ?? double.infinity, 54.h),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: MyTheme.style.semiBold.copyWith(
          color: Theme.of(context).primaryColor,
          fontSize: 14.sp,
        ),
      ),
    );
  }
}
