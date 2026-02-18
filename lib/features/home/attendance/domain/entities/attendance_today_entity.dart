import 'package:equatable/equatable.dart';

class AttendanceTodayEntity extends Equatable {
  const AttendanceTodayEntity({this.data, this.meta});

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

  final int? code;
  final String? message;
  final String? status;

  @override
  List<Object?> get props => [code, message, status];
}
