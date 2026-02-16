import 'package:morpheme_flutter_lite/core/global_variable.dart';
import 'package:morpheme_flutter_lite/core/locator.dart';
import 'package:morpheme_flutter_lite/features/splash/locator.dart';
import 'package:morpheme_flutter_lite/routes/routes.dart';
import 'package:morpheme_flutter_lite/features/auth/locator.dart';
import 'package:morpheme_flutter_lite/features/main/locator.dart';
import 'package:morpheme_flutter_lite/features/home/locator.dart';
import 'package:morpheme_flutter_lite/features/profile/locator.dart';

void setupLocator() {
  locator.registerLazySingleton(() => Routes.router);
  setupLocatorCore();
  setupLocatorFeatureSplash();
  setupLocatorFeatureAuth();
  setupLocatorFeatureMain();
  setupLocatorFeatureHome();
  setupLocatorFeatureProfile();
}
