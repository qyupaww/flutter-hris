import 'package:morpheme_http/morpheme_http.dart';

import '../../domain/entities/register_entity.dart';
import '../models/body/register_body.dart';
import '../../domain/entities/list_company_entity.dart';
import '../../mapper.dart';
import '../../domain/repositories/register_repository.dart';
import '../datasources/register_remote_data_source.dart';
import '../models/body/list_company_body.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  RegisterRepositoryImpl({required this.remoteDataSource});
  final RegisterRemoteDataSource remoteDataSource;
  @override
  Future<Either<MorphemeFailure, ListCompanyEntity>> listCompany(
    ListCompanyBody body, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  }) async {
    try {
      final data = await remoteDataSource.listCompany(
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

  @override
  Future<Either<MorphemeFailure, RegisterEntity>> register(
    RegisterBody body, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  }) async {
    try {
      final data = await remoteDataSource.register(
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
