import 'package:morpheme_http/morpheme_http.dart';

import '../models/body/register_body.dart';
import '../models/response/register_response.dart';
import 'package:morpheme_flutter_lite/core/endpoints/morpheme_endpoints.dart';

import '../models/body/list_company_body.dart';
import '../models/response/list_company_response.dart';

abstract class RegisterRemoteDataSource {
  Future<RegisterResponse> register(
    RegisterBody body, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  });
  Future<ListCompanyResponse> listCompany(
    ListCompanyBody body, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  });
}

class RegisterRemoteDataSourceImpl implements RegisterRemoteDataSource {
  RegisterRemoteDataSourceImpl({required this.http});

  final MorphemeHttp http;

  @override
  Future<ListCompanyResponse> listCompany(
    ListCompanyBody body, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  }) async {
    final response = await http.get(
      MorphemeEndpoints.listCompany,
      body: body.toMap(),
      headers: headers,
      cacheStrategy: cacheStrategy ?? AsyncOrCacheStrategy(),
    );
    return ListCompanyResponse.fromJson(response.body);
  }

  @override
  Future<RegisterResponse> register(
    RegisterBody body, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  }) async {
    final response = await http.post(
      MorphemeEndpoints.register,
      body: body.toMap(),
      headers: headers,
      cacheStrategy: cacheStrategy ?? JustAsyncStrategy(),
    );
    return RegisterResponse.fromJson(response.body);
  }
}
