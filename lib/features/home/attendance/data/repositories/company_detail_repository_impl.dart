import 'package:morpheme_http/morpheme_http.dart';

import '../../domain/entities/company_detail_entity.dart';
import '../../domain/repositories/company_detail_repository.dart';
import '../../mapper.dart';
import '../datasources/company_detail_remote_data_source.dart';

class CompanyDetailRepositoryImpl implements CompanyDetailRepository {
  CompanyDetailRepositoryImpl({required this.remoteDataSource});

  final CompanyDetailRemoteDataSource remoteDataSource;

  @override
  Future<Either<MorphemeFailure, CompanyDetailEntity>> companyDetail(
    int companyId, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  }) async {
    try {
      final data = await remoteDataSource.companyDetail(
        companyId,
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
