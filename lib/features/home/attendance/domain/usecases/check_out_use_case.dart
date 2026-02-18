import 'package:morpheme_http/morpheme_http.dart';

import '../entities/check_out_entity.dart';
import '../repositories/attendance_repository.dart';
import '../../data/models/body/check_out_body.dart';

class CheckOutUseCase implements UseCase<CheckOutEntity, CheckOutBody> {
  CheckOutUseCase({required this.repository});

  final AttendanceRepository repository;

  @override
  Future<Either<MorphemeFailure, CheckOutEntity>> call(
    CheckOutBody body, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  }) {
    return repository.checkOut(body, headers: headers);
  }
}
