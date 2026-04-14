import 'package:morpheme_http/morpheme_http.dart';

import '../entities/profile_entity.dart';
import '../repositories/profile_repository.dart';

class GetProfileUseCase implements UseCase<ProfileEntity, void> {
  GetProfileUseCase({required this.repository});

  final ProfileRepository repository;

  @override
  Future<Either<MorphemeFailure, ProfileEntity>> call(
    void params, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  }) {
    return repository.getProfile(headers: headers);
  }
}
