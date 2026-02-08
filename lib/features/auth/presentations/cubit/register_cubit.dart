import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/constant_routes.dart';
import '../pages/register_screen.dart';

mixin RegisterCubit on State<RegisterScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onRegisterPressed(BuildContext context) {
    context.goNamed(ConstantRoutes.home);
  }

  void onLoginPressed(BuildContext context) {
    context.goNamed(ConstantRoutes.login);
  }
}
