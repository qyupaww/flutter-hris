import 'package:morpheme_http/morpheme_http.dart';

import '../entities/company_detail_entity.dart';

abstract class CompanyDetailRepository {
  Future<Either<MorphemeFailure, CompanyDetailEntity>> companyDetail(
    int companyId, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  });
}
