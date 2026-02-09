import 'package:go_router/go_router.dart';

import 'package:flutter_hris/core/constants/constant_routes.dart';
import 'package:flutter_hris/features/auth/presentations/pages/login_screen.dart';
import 'package:flutter_hris/features/auth/presentations/pages/register_screen.dart';

List<RouteBase> authRoutes = [
  GoRoute(
    name: ConstantRoutes.login,
    path: ConstantRoutes.login,
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    name: ConstantRoutes.register,
    path: ConstantRoutes.register,
    builder: (context, state) => const RegisterScreen(),
  ),
];
