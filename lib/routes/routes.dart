import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_routes.dart';
import 'package:morpheme_flutter_lite/core/global_variable.dart';
import 'package:morpheme_flutter_lite/routes/features/auth_routes.dart';
import 'package:morpheme_flutter_lite/routes/features/main_routes.dart';
import 'package:morpheme_flutter_lite/routes/features/splash_routes.dart';

abstract class Routes {
  static GoRouter router = GoRouter(
    navigatorKey: rootNavigatorKey,
    debugLogDiagnostics: kDebugMode,
    initialLocation: ConstantRoutes.splash,
    routes: [...splashRoutes, ...authRoutes, ...mainRoutes],
  );
}
