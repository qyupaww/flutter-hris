import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/components/atoms/custom_button.dart';
import '../../../../core/components/molecules/app_input.dart';
import '../../../../core/themes/color_theme.dart';
import '../../../../core/themes/theme.dart';
import '../../../../extension/app_color_extension.dart';

class LoginFormSection extends StatefulWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final VoidCallback onLoginPressed;
  final VoidCallback onRegisterPressed;

  const LoginFormSection({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.onLoginPressed,
    required this.onRegisterPressed,
  });

  @override
  State<LoginFormSection> createState() => _LoginFormSectionState();
}

class _LoginFormSectionState extends State<LoginFormSection> {
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome Back',
            style: MyTheme.style.bold.copyWith(
              color: context.blackWhiteColor,
              fontSize: 30.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Sign in access your dashboard and continue tracking your attendance efficiently',
            textAlign: TextAlign.justify,
            style: MyTheme.style.regular.copyWith(
              color: context.blackWhiteColor.withValues(alpha: 0.7),
              fontSize: 14.sp,
            ),
          ),
          SizedBox(height: 36.h),
          AppInput(
            label: 'Email Address',
            hint: 'Enter your email address',
            keyboardType: TextInputType.emailAddress,
            controller: widget.emailController,
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
          AppButton(label: 'Login', onPressed: widget.onLoginPressed),
          SizedBox(height: 36.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Don\'t have an account? ',
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
                  'Register',
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
    );
  }
}
