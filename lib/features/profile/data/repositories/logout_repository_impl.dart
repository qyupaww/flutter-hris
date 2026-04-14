import 'package:morpheme_http/morpheme_http.dart';
import '../../domain/entities/logout_entity.dart';
import '../../domain/repositories/logout_repository.dart';
import '../datasources/logout_remote_data_source.dart';
import '../models/body/logout_body.dart';

class LogoutRepositoryImpl implements LogoutRepository {
  LogoutRepositoryImpl({required this.remoteDataSource});

  final LogoutRemoteDataSource remoteDataSource;

  @override
  Future<Either<MorphemeFailure, LogoutEntity>> logout({
    Map<String, String>? headers,
  }) async {
    try {
      final data = await remoteDataSource.logout(
        body: const LogoutBody(),
        headers: headers,
      );
      // Assuming successful response means success
      return Right(LogoutEntity(success: data.meta?.code == 200));
    } on MorphemeException catch (e) {
      return Left(e.toMorphemeFailure());
    } catch (e) {
      return Left(InternalFailure(e.toString()));
    }
  }
}
