import 'package:morpheme_http/morpheme_http.dart';
import 'package:morpheme_flutter_lite/core/endpoints/morpheme_endpoints.dart';

import '../models/response/company_detail_response.dart';

abstract class CompanyDetailRemoteDataSource {
  Future<CompanyDetailResponse> companyDetail(
    int companyId, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  });
}

class CompanyDetailRemoteDataSourceImpl
    implements CompanyDetailRemoteDataSource {
  CompanyDetailRemoteDataSourceImpl({required this.http});

  final MorphemeHttp http;

  @override
  Future<CompanyDetailResponse> companyDetail(
    int companyId, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  }) async {
    final response = await http.get(
      MorphemeEndpoints.companyDetail(companyId),
      headers: headers,
      cacheStrategy: cacheStrategy ?? AsyncOrCacheStrategy(),
    );
    return CompanyDetailResponse.fromJson(response.body);
  }
}
