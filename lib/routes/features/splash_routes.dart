import 'package:go_router/go_router.dart';
import 'package:morpheme_flutter_lite/core/constants/constant_routes.dart';
import 'package:morpheme_flutter_lite/features/splash/splash/presentation/pages/splash_page.dart';
import 'package:morpheme_flutter_lite/routes/helper/helper_routes.dart';

List<RouteBase> splashRoutes = [
  GoRoute(
    name: ConstantRoutes.splash,
    path: joinRoutes([ConstantRoutes.splash]),
    builder: (context, state) => const SplashPage(),
  ),
];
