import 'package:morpheme_http/morpheme_http.dart';
import 'package:morpheme_flutter_lite/core/endpoints/morpheme_endpoints.dart';

import '../models/body/login_body.dart';
import '../models/response/login_response.dart';

abstract class LoginRemoteDataSource {
  Future<LoginResponse> login(
    LoginBody body, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  });
}

class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  LoginRemoteDataSourceImpl({required this.http});

  final MorphemeHttp http;

  @override
  Future<LoginResponse> login(
    LoginBody body, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  }) async {
    final response = await http.post(
      MorphemeEndpoints.login,
      body: body.toMap(),
      headers: headers,
      cacheStrategy: cacheStrategy ?? JustAsyncStrategy(),
    );
    return LoginResponse.fromJson(response.body);
  }
}
