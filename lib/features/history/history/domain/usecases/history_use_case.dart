import 'package:morpheme_http/morpheme_http.dart';

import 'package:morpheme_flutter_lite/features/history/history/data/models/body/history_body.dart';
import 'package:morpheme_flutter_lite/features/history/history/domain/entities/history_entity.dart';
import 'package:morpheme_flutter_lite/features/history/history/domain/repositories/history_repository.dart';

class HistoryUseCase implements UseCase<HistoryEntity, HistoryBody> {
  HistoryUseCase({required this.repository});

  final HistoryRepository repository;

  @override
  Future<Either<MorphemeFailure, HistoryEntity>> call(
    HistoryBody body, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  }) {
    return repository.history(
      body,
      headers: headers,
      cacheStrategy: cacheStrategy,
    );
  }
}
