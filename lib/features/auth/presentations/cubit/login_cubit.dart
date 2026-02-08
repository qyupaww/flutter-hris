import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/constants/constant_routes.dart';
import 'package:mobile/features/auth/presentations/pages/login_screen.dart';

mixin LoginCubit on State<LoginScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onLoginPressed(BuildContext context) {
    context.goNamed(ConstantRoutes.home);
  }

  void onRegisterPressed(BuildContext context) {
    context.pushNamed(ConstantRoutes.register);
  }
}
