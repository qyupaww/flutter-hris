import 'package:go_router/go_router.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_routes.dart';
import 'package:morpheme_flutter_lite/features/auth/login/presentation/pages/login_page.dart';
import 'package:morpheme_flutter_lite/features/auth/register/presentation/pages/register_page.dart';
import 'package:morpheme_flutter_lite/routes/helper/helper_routes.dart';

List<RouteBase> authRoutes = [
  GoRoute(
    name: ConstantRoutes.login,
    path: joinRoutes([ConstantRoutes.login]),
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    name: ConstantRoutes.register,
    path: joinRoutes([ConstantRoutes.register]),
    builder: (context, state) => const RegisterPage(),
  ),
];
