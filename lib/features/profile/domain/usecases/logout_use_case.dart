import 'package:morpheme_http/morpheme_http.dart';
import '../entities/logout_entity.dart';
import '../repositories/logout_repository.dart';

class LogoutUseCase implements UseCase<LogoutEntity, void> {
  LogoutUseCase({required this.repository});

  final LogoutRepository repository;

  @override
  Future<Either<MorphemeFailure, LogoutEntity>> call(
    void params, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  }) {
    return repository.logout(headers: headers);
  }
}
