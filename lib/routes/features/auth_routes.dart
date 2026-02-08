import 'package:go_router/go_router.dart';
import 'package:mobile/core/constants/constant_routes.dart';
import 'package:mobile/features/auth/presentations/pages/login_screen.dart';
import 'package:mobile/features/auth/presentations/pages/register_screen.dart';

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
