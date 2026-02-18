import 'dart:convert';

import 'package:equatable/equatable.dart';

class AttendanceTodayResponse extends Equatable {
  const AttendanceTodayResponse({this.data, this.meta});

  factory AttendanceTodayResponse.fromMap(Map<String, dynamic> map) {
    return AttendanceTodayResponse(
      data: map['data'] == null
          ? null
          : DataAttendanceToday.fromMap(map['data']),
      meta: map['meta'] == null
          ? null
          : MetaAttendanceToday.fromMap(map['meta']),
    );
  }

  factory AttendanceTodayResponse.fromJson(String source) =>
      AttendanceTodayResponse.fromMap(json.decode(source));

  final DataAttendanceToday? data;
  final MetaAttendanceToday? meta;

  @override
  List<Object?> get props => [data, meta];
}

class DataAttendanceToday extends Equatable {
  const DataAttendanceToday({
    this.checkInStatus,
    this.checkInTime,
    this.checkOutStatus,
    this.checkOutTime,
    this.isCheckedIn,
    this.isCheckedOut,
  });

  factory DataAttendanceToday.fromMap(Map<String, dynamic> map) {
    return DataAttendanceToday(
      checkInStatus: map['check_in_status'],
      checkInTime: map['check_in_time'],
      checkOutStatus: map['check_out_status'],
      checkOutTime: map['check_out_time'],
      isCheckedIn: map['is_checked_in'],
      isCheckedOut: map['is_checked_out'],
    );
  }

  final String? checkInStatus;
  final String? checkInTime;
  final String? checkOutStatus;
  final String? checkOutTime;
  final bool? isCheckedIn;
  final bool? isCheckedOut;

  @override
  List<Object?> get props => [
    checkInStatus,
    checkInTime,
    checkOutStatus,
    checkOutTime,
    isCheckedIn,
    isCheckedOut,
  ];
}

class MetaAttendanceToday extends Equatable {
  const MetaAttendanceToday({this.code, this.message, this.status});

  factory MetaAttendanceToday.fromMap(Map<String, dynamic> map) {
    return MetaAttendanceToday(
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
