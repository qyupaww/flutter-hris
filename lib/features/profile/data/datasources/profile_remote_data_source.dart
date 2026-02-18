import 'package:morpheme_http/morpheme_http.dart';
import 'package:morpheme_flutter_lite/core/endpoints/morpheme_endpoints.dart';

import '../models/response/profile_response.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileResponse> getProfile({
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  });
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  ProfileRemoteDataSourceImpl({required this.http});

  final MorphemeHttp http;

  @override
  Future<ProfileResponse> getProfile({
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  }) async {
    final response = await http.get(
      MorphemeEndpoints.profile,
      headers: headers,
      cacheStrategy: cacheStrategy ?? JustAsyncStrategy(),
    );
    return ProfileResponse.fromJson(response.body);
  }
}
