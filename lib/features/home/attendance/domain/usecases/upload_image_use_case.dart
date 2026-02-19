import 'dart:io';

import 'package:morpheme_http/morpheme_http.dart';

import '../repositories/attendance_repository.dart';

class UploadImageUseCase implements UseCase<String, File> {
  UploadImageUseCase({required this.repository});

  final AttendanceRepository repository;

  @override
  Future<Either<MorphemeFailure, String>> call(
    File imageFile, {
    Map<String, String>? headers,
    CacheStrategy? cacheStrategy,
  }) {
    return repository.uploadImage(imageFile, headers: headers);
  }
}
