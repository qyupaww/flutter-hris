import 'package:morpheme_http/morpheme_http.dart';

import 'package:morpheme_flutter_lite/features/history/history/data/models/body/history_body.dart';
import 'package:morpheme_flutter_lite/features/history/history/domain/entities/history_entity.dart';

abstract class HistoryRepository {
  Future<Either<MorphemeFailure, HistoryEntity>> history(
    HistoryBody body, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  });
}
