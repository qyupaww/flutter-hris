import 'dart:convert';

import 'package:equatable/equatable.dart';

class CheckInResponse extends Equatable {
  const CheckInResponse({this.data, this.meta});

  factory CheckInResponse.fromMap(Map<String, dynamic> map) {
    return CheckInResponse(
      data: map['data'] == null ? null : DataCheckIn.fromMap(map['data']),
      meta: map['meta'] == null ? null : MetaCheckIn.fromMap(map['meta']),
    );
  }

  factory CheckInResponse.fromJson(String source) =>
      CheckInResponse.fromMap(json.decode(source));

  final DataCheckIn? data;
  final MetaCheckIn? meta;

  @override
  List<Object?> get props => [data, meta];
}

class DataCheckIn extends Equatable {
  const DataCheckIn({this.date, this.checkInTime, this.status});

  factory DataCheckIn.fromMap(Map<String, dynamic> map) {
    return DataCheckIn(
      date: map['date'],
      checkInTime: map['check_in_time'],
      status: map['status'],
    );
  }

  final String? date;
  final String? checkInTime;
  final String? status;

  @override
  List<Object?> get props => [date, checkInTime, status];
}

class MetaCheckIn extends Equatable {
  const MetaCheckIn({this.code, this.message, this.status});

  factory MetaCheckIn.fromMap(Map<String, dynamic> map) {
    return MetaCheckIn(
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
