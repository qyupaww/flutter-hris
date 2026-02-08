import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/atoms/custom_button.dart';
import '../../../../core/components/molecules/app_input.dart';
import '../../../../core/themes/color_theme.dart';
import '../../../../core/themes/theme.dart';
import '../../../../extension/app_color_extension.dart';

class RegisterFormSection extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onLoginPressed;
  final VoidCallback onRegisterPressed;
  const RegisterFormSection({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onLoginPressed,
    required this.onRegisterPressed,
  });

  @override
  State<RegisterFormSection> createState() => _RegisterFormSectionState();
}

class _RegisterFormSectionState extends State<RegisterFormSection> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create Account",
              style: MyTheme.style.bold.copyWith(
                fontSize: 30.sp,
                color: context.blackWhiteColor,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              "Please fill in the details below to register",
              style: MyTheme.style.regular.copyWith(
                fontSize: 14.sp,
                color: context.blackWhiteColor.withValues(alpha: 0.7),
              ),
            ),
            SizedBox(height: 24.h),
            AppInput(
              label: 'Full Name',
              hint: 'Enter your full name',
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 16.h),
            AppInput(
              label: 'Email Address',
              hint: 'Enter your email address',
              keyboardType: TextInputType.emailAddress,
              controller: widget.emailController,
            ),
            SizedBox(height: 16.h),
            AppInput(label: 'Company', hint: 'Select your company'),
            SizedBox(height: 16.h),
            AppInput(
              label: 'NIP',
              hint: 'Enter your NIP',
              keyboardType: TextInputType.numberWithOptions(),
            ),
            SizedBox(height: 16.h),
            AppInput(
              label: 'Division',
              hint: 'Enter your division',
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 16.h),
            AppInput(
              label: 'Password',
              hint: 'Enter your password',
              controller: widget.passwordController,
              obscureText: _isObscure,
              suffixIcon: IconButton(
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  color: PColor().grey,
                ),
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
              ),
            ),
            SizedBox(height: 24.h),
            AppButton(label: 'Register', onPressed: widget.onRegisterPressed),
            SizedBox(height: 36.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: MyTheme.style.regular.copyWith(
                    color: Theme.of(context).textTheme.bodyMedium?.color,
                    fontSize: 14.sp,
                  ),
                ),
                TextButton(
                  onPressed: widget.onRegisterPressed,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    foregroundColor: PColor().primary,
                  ),
                  child: Text(
                    'Login',
                    style: MyTheme.style.semiBold.copyWith(
                      color: PColor().primary,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
