import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/constants/constant_routes.dart';
import 'features/auth_routes.dart';
import 'features/main_routes.dart';
import 'features/splash_routes.dart';

GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

abstract class Routes {
  static final routerConfig = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: ConstantRoutes.splash,
    routes: [...splashRoutes, ...authRoutes, ...mainRoutes],
  );
}
