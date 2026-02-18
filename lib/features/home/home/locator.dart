import 'package:morpheme_flutter_lite/core/global_variable.dart';

import 'presentation/cubit/home_cubit.dart';

void setupLocatorHome() {
  locator.registerFactory(() => HomeCubit(attendanceTodayBloc: locator()));
}
