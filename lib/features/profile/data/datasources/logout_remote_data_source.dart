import 'package:morpheme_http/morpheme_http.dart';
import 'package:morpheme_flutter_lite/core/endpoints/morpheme_endpoints.dart';
import '../models/body/logout_body.dart';
import '../models/response/logout_response.dart';

abstract class LogoutRemoteDataSource {
  Future<LogoutResponse> logout({
    LogoutBody? body,
    Map<String, String>? headers,
  });
}

class LogoutRemoteDataSourceImpl implements LogoutRemoteDataSource {
  LogoutRemoteDataSourceImpl({required this.http});

  final MorphemeHttp http;

  @override
  Future<LogoutResponse> logout({
    LogoutBody? body,
    Map<String, String>? headers,
  }) async {
    final response = await http.post(
      MorphemeEndpoints.logout,
      body: body?.toMap(),
      headers: headers,
    );
    return LogoutResponse.fromJson(response.body);
  }
}
