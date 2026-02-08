import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobile/features/auth/presentations/cubit/register_cubit.dart';
import 'package:mobile/features/auth/presentations/widgets/register_form_section.dart';

import '../../../../core/constants/constant_sizes.dart';
import '../../../../core/themes/theme.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with RegisterCubit {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Register',
          style: MyTheme.style.bold.copyWith(fontSize: 18.sp),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(ConstantSizes.defaultPadding),
        child: RegisterFormSection(
          emailController: emailController,
          passwordController: passwordController,
          onLoginPressed: () => onLoginPressed(context),
          onRegisterPressed: () => onRegisterPressed(context),
        ),
      ),
    );
  }
}
