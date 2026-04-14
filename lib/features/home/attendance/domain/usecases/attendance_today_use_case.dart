import 'package:morpheme_http/morpheme_http.dart';

import '../entities/attendance_today_entity.dart';
import '../repositories/attendance_repository.dart';

class AttendanceTodayUseCase implements UseCase<AttendanceTodayEntity, void> {
  AttendanceTodayUseCase({required this.repository});

  final AttendanceRepository repository;

  @override
  Future<Either<MorphemeFailure, AttendanceTodayEntity>> call(
    void params, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  }) {
    return repository.attendanceToday(headers: headers);
  }
}
