import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../extension/app_color_extension.dart';
import '../../constants/constant_sizes.dart';
import '../../themes/color_theme.dart';
import '../../themes/theme.dart';

class AppInput extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;

  const AppInput({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.onTap,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: MyTheme.style.regular.copyWith(
            color: context.blackWhiteColor,
            fontSize: 12.sp,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          readOnly: readOnly,
          onTap: onTap,
          validator: validator,
          style: MyTheme.style.medium.copyWith(
            color: context.blackWhiteColor,
            fontSize: 14.sp,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: MyTheme.style.regular.copyWith(
              color: PColor().grey,
              fontSize: 14.sp,
            ),
            filled: true,
            fillColor: context.containerColor,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 12.w,
              vertical: 16.h,
            ),
            suffixIcon: suffixIcon,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ConstantSizes.defaultRadius),
              borderSide: BorderSide(
                color: isDarkMode
                    ? context.containerColor
                    : PColor().grey.withValues(alpha: 0.5),
                width: 1,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ConstantSizes.defaultRadius),
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
                width: 1,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ConstantSizes.defaultRadius),
              borderSide: BorderSide(color: PColor().danger, width: 1),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(ConstantSizes.defaultRadius),
              borderSide: BorderSide(color: PColor().danger, width: 1),
            ),
          ),
        ),
      ],
    );
  }
}
