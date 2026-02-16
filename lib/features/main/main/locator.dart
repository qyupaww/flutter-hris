import 'package:morpheme_flutter_lite/core/global_variable.dart';

import 'presentation/cubit/main_cubit.dart';

void setupLocatorMain() {
  // *Cubit
  locator.registerFactory(() => MainCubit());
}
