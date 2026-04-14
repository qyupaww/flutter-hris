import 'package:morpheme_http/morpheme_http.dart';

import '../entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<MorphemeFailure, ProfileEntity>> getProfile({
    Map<String, String>? headers,
  });
}
