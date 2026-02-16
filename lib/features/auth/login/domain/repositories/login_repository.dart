import 'package:morpheme_http/morpheme_http.dart';

import '../../data/models/body/login_body.dart';
import '../entities/login_entity.dart';

abstract class LoginRepository {
  Future<Either<MorphemeFailure, LoginEntity>> login(
    LoginBody body, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  });
}
