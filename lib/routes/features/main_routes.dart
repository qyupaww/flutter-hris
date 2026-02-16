import 'package:go_router/go_router.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_routes.dart';
import 'package:morpheme_flutter_lite/features/history/presentation/pages/history_page.dart';
import 'package:morpheme_flutter_lite/features/home/home/presentation/pages/home_page.dart';
import 'package:morpheme_flutter_lite/features/main/main/presentation/pages/main_page.dart';
import 'package:morpheme_flutter_lite/features/profile/presentation/pages/profile_page.dart';
import 'package:morpheme_flutter_lite/routes/helper/helper_routes.dart';

List<RouteBase> mainRoutes = [
  StatefulShellRoute.indexedStack(
    builder: (context, state, navigationShell) =>
        MainPage(navigationShell: navigationShell),
    branches: [
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: ConstantRoutes.home,
            path: joinRoutes([ConstantRoutes.home]),
            builder: (context, state) => const HomePage(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: ConstantRoutes.history,
            path: joinRoutes([ConstantRoutes.history]),
            builder: (context, state) => const HistoryPage(),
          ),
        ],
      ),
      StatefulShellBranch(
        routes: [
          GoRoute(
            name: ConstantRoutes.profile,
            path: joinRoutes([ConstantRoutes.profile]),
            builder: (context, state) => const ProfilePage(),
          ),
        ],
      ),
    ],
  ),
];
