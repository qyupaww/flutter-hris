import 'package:morpheme_flutter_lite/core/global_variable.dart';

import 'presentation/cubit/attendance_cubit.dart';

void setupLocatorAttendance() {
  locator.registerFactory(() => AttendanceCubit());
}
