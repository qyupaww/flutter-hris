import 'package:morpheme_flutter_lite/core/global_variable.dart';
import 'package:morpheme_flutter_lite/features/splash/splash/presentation/cubit/splash_cubit.dart';

void setupLocatorSplash() {
  // *Cubit
  locator.registerFactory(() => SplashCubit());
}
