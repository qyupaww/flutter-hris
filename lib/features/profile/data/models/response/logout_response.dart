import 'dart:convert';
import 'package:equatable/equatable.dart';

class LogoutResponse extends Equatable {
  const LogoutResponse({this.meta});

  factory LogoutResponse.fromMap(Map<String, dynamic> map) {
    return LogoutResponse(
      meta: map['meta'] == null ? null : MetaLogout.fromMap(map['meta']),
    );
  }

  factory LogoutResponse.fromJson(String source) =>
      LogoutResponse.fromMap(json.decode(source));

  final MetaLogout? meta;

  Map<String, dynamic> toMap() {
    return {'meta': meta?.toMap()};
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [meta];
}

class MetaLogout extends Equatable {
  const MetaLogout({this.code, this.message, this.status});

  factory MetaLogout.fromMap(Map<String, dynamic> map) {
    return MetaLogout(
      code: int.tryParse(map['code']?.toString() ?? ''),
      message: map['message'],
      status: map['status'],
    );
  }

  final int? code;
  final String? message;
  final String? status;

  Map<String, dynamic> toMap() {
    return {'code': code, 'message': message, 'status': status};
  }

  @override
  List<Object?> get props => [code, message, status];
}
