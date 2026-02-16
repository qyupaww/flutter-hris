import 'package:morpheme_http/morpheme_http.dart';
import '../entities/logout_entity.dart';

abstract class LogoutRepository {
  Future<Either<MorphemeFailure, LogoutEntity>> logout({
    Map<String, String>? headers,
  });
}
