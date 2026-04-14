import 'package:morpheme_http/morpheme_http.dart';
import 'package:morpheme_flutter_lite/core/endpoints/morpheme_endpoints.dart';

import 'package:morpheme_flutter_lite/features/history/history/data/models/body/history_body.dart';
import 'package:morpheme_flutter_lite/features/history/history/data/models/response/history_response.dart';

abstract class HistoryRemoteDataSource {
  Future<HistoryResponse> history(
    HistoryBody body, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  });
}

class HistoryRemoteDataSourceImpl implements HistoryRemoteDataSource {
  HistoryRemoteDataSourceImpl({required this.http});

  final MorphemeHttp http;

  @override
  Future<HistoryResponse> history(
    HistoryBody body, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  }) async {
    final response = await http.get(
      MorphemeEndpoints.history,
      body: body.toMap(),
      headers: headers,
      cacheStrategy: cacheStrategy ?? JustAsyncStrategy(),
    );
    return HistoryResponse.fromJson(response.body);
  }
}
