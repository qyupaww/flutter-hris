import 'dart:io';

import 'package:morpheme_http/morpheme_http.dart';

import '../../domain/entities/attendance_today_entity.dart';
import '../../domain/entities/check_in_entity.dart';
import '../../domain/entities/check_out_entity.dart';
import '../../domain/repositories/attendance_repository.dart';
import '../../mapper.dart';
import '../datasources/attendance_remote_data_source.dart';
import '../models/body/check_in_body.dart';
import '../models/body/check_out_body.dart';

class AttendanceRepositoryImpl implements AttendanceRepository {
  AttendanceRepositoryImpl({required this.remoteDataSource});

  final AttendanceRemoteDataSource remoteDataSource;

  @override
  Future<Either<MorphemeFailure, String>> uploadImage(
    File imageFile, {
    Map<String, String>? headers,
  }) async {
    try {
      final data = await remoteDataSource.uploadImage(
        imageFile,
        headers: headers,
      );
      final url = data.imageUrl;
      if (url == null) {
        return Left(InternalFailure('Upload succeeded but no URL returned'));
      }
      return Right(url);
    } on MorphemeException catch (e) {
      return Left(e.toMorphemeFailure());
    } catch (e) {
      return Left(InternalFailure(e.toString()));
    }
  }

  @override
  Future<Either<MorphemeFailure, CheckInEntity>> checkIn(
    CheckInBody body, {
    Map<String, String>? headers,
  }) async {
    try {
      final data = await remoteDataSource.checkIn(body, headers: headers);
      return Right(CheckInResponseMapper(data).toEntity());
    } on MorphemeException catch (e) {
      return Left(e.toMorphemeFailure());
    } catch (e) {
      return Left(InternalFailure(e.toString()));
    }
  }

  @override
  Future<Either<MorphemeFailure, CheckOutEntity>> checkOut(
    CheckOutBody body, {
    Map<String, String>? headers,
  }) async {
    try {
      final data = await remoteDataSource.checkOut(body, headers: headers);
      return Right(CheckOutResponseMapper(data).toEntity());
    } on MorphemeException catch (e) {
      return Left(e.toMorphemeFailure());
    } catch (e) {
      return Left(InternalFailure(e.toString()));
    }
  }

  @override
  Future<Either<MorphemeFailure, AttendanceTodayEntity>> attendanceToday({
    Map<String, String>? headers,
  }) async {
    try {
      final data = await remoteDataSource.attendanceToday(headers: headers);
      return Right(AttendanceTodayResponseMapper(data).toEntity());
    } on MorphemeException catch (e) {
      return Left(e.toMorphemeFailure());
    } catch (e) {
      return Left(InternalFailure(e.toString()));
    }
  }
}
