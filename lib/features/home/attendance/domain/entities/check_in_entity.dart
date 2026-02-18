import 'package:equatable/equatable.dart';

class CheckInEntity extends Equatable {
  const CheckInEntity({this.data, this.meta});

  final DataCheckIn? data;
  final MetaCheckIn? meta;

  @override
  List<Object?> get props => [data, meta];
}

class DataCheckIn extends Equatable {
  const DataCheckIn({this.date, this.checkInTime, this.status});

  final String? date;
  final String? checkInTime;
  final String? status;

  @override
  List<Object?> get props => [date, checkInTime, status];
}

class MetaCheckIn extends Equatable {
  const MetaCheckIn({this.code, this.message, this.status});

  final int? code;
  final String? message;
  final String? status;

  @override
  List<Object?> get props => [code, message, status];
}
