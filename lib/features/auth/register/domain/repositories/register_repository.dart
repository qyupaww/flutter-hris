import 'package:morpheme_http/morpheme_http.dart';

import '../../data/models/body/register_body.dart';
import '../entities/register_entity.dart';
import '../../data/models/body/list_company_body.dart';
import '../entities/list_company_entity.dart';

abstract class RegisterRepository {
  Future<Either<MorphemeFailure, ListCompanyEntity>> listCompany(
    ListCompanyBody body, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  });
  Future<Either<MorphemeFailure, RegisterEntity>> register(
    RegisterBody body, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  });
}
