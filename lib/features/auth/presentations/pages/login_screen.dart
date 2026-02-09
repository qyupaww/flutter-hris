import 'package:flutter/material.dart';

import 'package:flutter_hris/core/constants/constant_sizes.dart';
import 'package:flutter_hris/features/auth/presentations/cubit/login_cubit.dart';
import 'package:flutter_hris/features/auth/presentations/widgets/login_form_section.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with LoginCubit {
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
      body: Padding(
        padding: EdgeInsets.all(ConstantSizes.defaultPadding),
        child: LoginFormSection(
          emailController: emailController,
          passwordController: passwordController,
          onLoginPressed: () => onLoginPressed(context),
          onRegisterPressed: () => onRegisterPressed(context),
        ),
      ),
    );
  }
}
