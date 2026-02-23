import 'package:equatable/equatable.dart';

class HistoryEntity extends Equatable {
  const HistoryEntity({this.data, this.meta});

  final List<DataHistory>? data;
  final MetaHistory? meta;

  HistoryEntity copyWith({List<DataHistory>? data, MetaHistory? meta}) {
    return HistoryEntity(data: data ?? this.data, meta: meta ?? this.meta);
  }

  @override
  List<Object?> get props => [data, meta];
}

class DataHistory extends Equatable {
  const DataHistory({
    this.checkInTime,
    this.checkOutTime,
    this.date,
    this.status,
  });

  final String? checkInTime;
  final String? checkOutTime;
  final DateTime? date;
  final String? status;

  DataHistory copyWith({
    String? checkInTime,
    String? checkOutTime,
    DateTime? date,
    String? status,
  }) {
    return DataHistory(
      checkInTime: checkInTime ?? this.checkInTime,
      checkOutTime: checkOutTime ?? this.checkOutTime,
      date: date ?? this.date,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [checkInTime, checkOutTime, date, status];
}

class MetaHistory extends Equatable {
  const MetaHistory({this.code, this.message, this.status});

  final int? code;
  final String? message;
  final String? status;

  MetaHistory copyWith({int? code, String? message, String? status}) {
    return MetaHistory(
      code: code ?? this.code,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [code, message, status];
}
