import 'dart:io';

import 'package:morpheme_http/morpheme_http.dart';

import '../entities/attendance_today_entity.dart';
import '../entities/check_in_entity.dart';
import '../entities/check_out_entity.dart';
import '../../data/models/body/check_in_body.dart';
import '../../data/models/body/check_out_body.dart';

abstract class AttendanceRepository {
  Future<Either<MorphemeFailure, String>> uploadImage(
    File imageFile, {
    Map<String, String>? headers,
  });

  Future<Either<MorphemeFailure, CheckInEntity>> checkIn(
    CheckInBody body, {
    Map<String, String>? headers,
  });

  Future<Either<MorphemeFailure, CheckOutEntity>> checkOut(
    CheckOutBody body, {
    Map<String, String>? headers,
  });

  Future<Either<MorphemeFailure, AttendanceTodayEntity>> attendanceToday({
    Map<String, String>? headers,
  });
}
