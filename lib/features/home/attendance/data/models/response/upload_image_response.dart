import 'dart:convert';

import 'package:equatable/equatable.dart';

class UploadImageResponse extends Equatable {
  const UploadImageResponse({this.data, this.meta});

  factory UploadImageResponse.fromMap(Map<String, dynamic> map) {
    return UploadImageResponse(
      data: map['data'] != null ? Map<String, dynamic>.from(map['data']) : null,
      meta: map['meta'] == null ? null : MetaUpload.fromMap(map['meta']),
    );
  }

  factory UploadImageResponse.fromJson(String source) =>
      UploadImageResponse.fromMap(json.decode(source));

  final Map<String, dynamic>? data;
  final MetaUpload? meta;

  String? get imageUrl {
    if (data == null) return null;
    return data!['url'] ??
        data!['image_url'] ??
        data!['file_url'] ??
        data!.values.firstOrNull?.toString();
  }

  @override
  List<Object?> get props => [data, meta];
}

class MetaUpload extends Equatable {
  const MetaUpload({this.code, this.message, this.status});

  factory MetaUpload.fromMap(Map<String, dynamic> map) {
    return MetaUpload(
      code: int.tryParse(map['code']?.toString() ?? ''),
      message: map['message'],
      status: map['status'],
    );
  }

  final int? code;
  final String? message;
  final String? status;

  @override
  List<Object?> get props => [code, message, status];
}
