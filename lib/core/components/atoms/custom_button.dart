import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/core/constants/constant_sizes.dart';
import 'package:mobile/core/themes/color_theme.dart';
import 'package:mobile/core/themes/theme.dart';
import 'package:mobile/extension/app_color_extension.dart';

enum AppButtonVariant { primary, secondary, tertiary }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final AppButtonVariant variant;

  const AppButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = AppButtonVariant.primary,
  });

  @override
  Widget build(BuildContext context) {
    if (variant == AppButtonVariant.primary) {
      return ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: PColor().black,
          minimumSize: Size(double.infinity, 54.h),
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
          minimumSize: Size(double.infinity, 54.h),
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
        minimumSize: Size(double.infinity, 54.h),
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
