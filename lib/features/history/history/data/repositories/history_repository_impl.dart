import 'package:morpheme_http/morpheme_http.dart';

import 'package:morpheme_flutter_lite/features/history/history/domain/entities/history_entity.dart';
import 'package:morpheme_flutter_lite/features/history/history/mapper.dart';
import 'package:morpheme_flutter_lite/features/history/history/domain/repositories/history_repository.dart';
import 'package:morpheme_flutter_lite/features/history/history/data/datasources/history_remote_data_source.dart';
import 'package:morpheme_flutter_lite/features/history/history/data/models/body/history_body.dart';

class HistoryRepositoryImpl implements HistoryRepository {
  HistoryRepositoryImpl({required this.remoteDataSource});

  final HistoryRemoteDataSource remoteDataSource;

  @override
  Future<Either<MorphemeFailure, HistoryEntity>> history(
    HistoryBody body, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  }) async {
    try {
      final data = await remoteDataSource.history(
        body,
        headers: headers,
        cacheStrategy: cacheStrategy,
      );
      return Right(data.toEntity());
    } on MorphemeException catch (e) {
      return Left(e.toMorphemeFailure());
    } catch (e) {
      return Left(InternalFailure(e.toString()));
    }
  }
}
