import 'dart:convert';

import 'package:equatable/equatable.dart';

class HistoryResponse extends Equatable {
  const HistoryResponse({this.data, this.meta});

  factory HistoryResponse.fromMap(Map<String, dynamic> map) {
    return HistoryResponse(
      data: map['data'] is List
          ? List.from(
              (map['data'] as List)
                  .where((element) => element != null)
                  .map((e) => DataHistory.fromMap(e)),
            )
          : null,
      meta: map['meta'] == null ? null : MetaHistory.fromMap(map['meta']),
    );
  }

  factory HistoryResponse.fromJson(String source) =>
      HistoryResponse.fromMap(json.decode(source));

  final List<DataHistory>? data;
  final MetaHistory? meta;

  Map<String, dynamic> toMap() {
    return {
      'data': data?.map((e) => e.toMap()).toList(),
      'meta': meta?.toMap(),
    };
  }

  String toJson() => json.encode(toMap());

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

  factory DataHistory.fromMap(Map<String, dynamic> map) {
    return DataHistory(
      checkInTime: map['check_in_time'],
      checkOutTime: map['check_out_time'],
      date: DateTime.tryParse(map['date'] ?? ''),
      status: map['status'],
    );
  }

  factory DataHistory.fromJson(String source) =>
      DataHistory.fromMap(json.decode(source));

  final String? checkInTime;
  final String? checkOutTime;
  final DateTime? date;
  final String? status;

  Map<String, dynamic> toMap() {
    return {
      'check_in_time': checkInTime,
      'check_out_time': checkOutTime,
      'date': date?.toIso8601String(),
      'status': status,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [checkInTime, checkOutTime, date, status];
}

class MetaHistory extends Equatable {
  const MetaHistory({this.code, this.message, this.status});

  factory MetaHistory.fromMap(Map<String, dynamic> map) {
    return MetaHistory(
      code: int.tryParse(map['code']?.toString() ?? ''),
      message: map['message'],
      status: map['status'],
    );
  }

  factory MetaHistory.fromJson(String source) =>
      MetaHistory.fromMap(json.decode(source));

  final int? code;
  final String? message;
  final String? status;

  Map<String, dynamic> toMap() {
    return {'code': code, 'message': message, 'status': status};
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [code, message, status];
}
