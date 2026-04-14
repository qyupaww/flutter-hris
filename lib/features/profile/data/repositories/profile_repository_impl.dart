import 'package:morpheme_http/morpheme_http.dart';

import '../../mapper.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_data_source.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({required this.remoteDataSource});

  final ProfileRemoteDataSource remoteDataSource;

  @override
  Future<Either<MorphemeFailure, ProfileEntity>> getProfile({
    Map<String, String>? headers,
  }) async {
    try {
      final data = await remoteDataSource.getProfile(headers: headers);
      return Right(data.toEntity());
    } on MorphemeException catch (e) {
      return Left(e.toMorphemeFailure());
    } catch (e) {
      return Left(InternalFailure(e.toString()));
    }
  }
}
