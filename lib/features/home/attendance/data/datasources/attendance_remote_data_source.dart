import 'dart:io';

import 'package:morpheme_http/morpheme_http.dart';
import 'package:morpheme_flutter_lite/core/endpoints/morpheme_endpoints.dart';

import '../models/body/check_in_body.dart';
import '../models/body/check_out_body.dart';
import '../models/response/attendance_today_response.dart';
import '../models/response/check_in_response.dart';
import '../models/response/check_out_response.dart';
import '../models/response/upload_image_response.dart';

abstract class AttendanceRemoteDataSource {
  Future<UploadImageResponse> uploadImage(
    File imageFile, {
    Map<String, String>? headers,
  });

  Future<CheckInResponse> checkIn(
    CheckInBody body, {
    Map<String, String>? headers,
  });

  Future<CheckOutResponse> checkOut(
    CheckOutBody body, {
    Map<String, String>? headers,
  });

  Future<AttendanceTodayResponse> attendanceToday({
    Map<String, String>? headers,
  });
}

class AttendanceRemoteDataSourceImpl implements AttendanceRemoteDataSource {
  AttendanceRemoteDataSourceImpl({required this.http});

  final MorphemeHttp http;

  @override
  Future<UploadImageResponse> uploadImage(
    File imageFile, {
    Map<String, String>? headers,
  }) async {
    final response = await http.postMultipart(
      MorphemeEndpoints.uploadImage,
      files: {
        'image': [imageFile],
      },
      body: {'type': 'attendance'},
      headers: headers,
    );
    return UploadImageResponse.fromJson(response.body);
  }

  @override
  Future<CheckInResponse> checkIn(
    CheckInBody body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.post(
      MorphemeEndpoints.checkIn,
      body: body.toMap(),
      headers: headers,
      cacheStrategy: JustAsyncStrategy(),
    );
    return CheckInResponse.fromJson(response.body);
  }

  @override
  Future<CheckOutResponse> checkOut(
    CheckOutBody body, {
    Map<String, String>? headers,
  }) async {
    final response = await http.post(
      MorphemeEndpoints.checkOut,
      body: body.toMap(),
      headers: headers,
      cacheStrategy: JustAsyncStrategy(),
    );
    return CheckOutResponse.fromJson(response.body);
  }

  @override
  Future<AttendanceTodayResponse> attendanceToday({
    Map<String, String>? headers,
  }) async {
    final response = await http.get(
      MorphemeEndpoints.attendanceToday,
      headers: headers,
      cacheStrategy: JustAsyncStrategy(),
    );
    return AttendanceTodayResponse.fromJson(response.body);
  }
}
