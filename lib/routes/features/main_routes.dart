import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:flutter_hris/core/constants/constant_routes.dart';
import 'package:flutter_hris/features/home/presentations/pages/home_screen.dart';
import 'package:flutter_hris/features/main/presentations/pages/main_screen.dart';
import 'package:flutter_hris/routes/routes.dart';

List<RouteBase> mainRoutes = [
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) =>
        MainScreen(navigationShell: navigationShell),
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: ConstantRoutes.home,
            path: ConstantRoutes.home,
            builder: (context, state) => const HomeScreen(),
            routes: [
              GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                name: 'detail',
                path: '/detail', // /home/detail
                builder: (context, state) =>
                    Scaffold(body: Center(child: Text('Detail'))),
              ),
            ],
          ),
        ],
      ),
      // StatefulShellBranch(
      //   routes: [
      //     GoRoute(
      //       path: ConstantRoutes.history,
      //       builder: (context, state) => const HistoryScreen(),
      //     ),
      //   ],
      // ),
      // StatefulShellBranch(
      //   routes: [
      //     GoRoute(
      //       path: ConstantRoutes.profile,
      //       builder: (context, state) => const ProfileScreen(),
      //     ),
      //   ],
      // ),
    ],
  ),
];
