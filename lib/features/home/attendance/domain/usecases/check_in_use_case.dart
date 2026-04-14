import 'package:morpheme_http/morpheme_http.dart';

import '../entities/check_in_entity.dart';
import '../repositories/attendance_repository.dart';
import '../../data/models/body/check_in_body.dart';

class CheckInUseCase implements UseCase<CheckInEntity, CheckInBody> {
  CheckInUseCase({required this.repository});

  final AttendanceRepository repository;

  @override
  Future<Either<MorphemeFailure, CheckInEntity>> call(
    CheckInBody body, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  }) {
    return repository.checkIn(body, headers: headers);
  }
}
