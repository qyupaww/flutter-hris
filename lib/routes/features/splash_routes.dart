import 'package:go_router/go_router.dart';
import 'package:mobile/core/constants/constant_routes.dart';
import 'package:mobile/features/splash/presentations/pages/splash_screen.dart';

List<RouteBase> splashRoutes = [
  GoRoute(
    name: ConstantRoutes.splash,
    path: ConstantRoutes.splash,
    builder: (context, state) => const SplashScreen(),
  ),
];
