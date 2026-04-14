import 'dart:convert';

import 'package:equatable/equatable.dart';

class CheckOutResponse extends Equatable {
  const CheckOutResponse({this.data, this.meta});

  factory CheckOutResponse.fromMap(Map<String, dynamic> map) {
    return CheckOutResponse(
      data: map['data'] == null ? null : DataCheckOut.fromMap(map['data']),
      meta: map['meta'] == null ? null : MetaCheckOut.fromMap(map['meta']),
    );
  }

  factory CheckOutResponse.fromJson(String source) =>
      CheckOutResponse.fromMap(json.decode(source));

  final DataCheckOut? data;
  final MetaCheckOut? meta;

  @override
  List<Object?> get props => [data, meta];
}

class DataCheckOut extends Equatable {
  const DataCheckOut({this.checkOutTime});

  factory DataCheckOut.fromMap(Map<String, dynamic> map) {
    return DataCheckOut(checkOutTime: map['check_out_time']);
  }

  final String? checkOutTime;

  @override
  List<Object?> get props => [checkOutTime];
}

class MetaCheckOut extends Equatable {
  const MetaCheckOut({this.code, this.message, this.status});

  factory MetaCheckOut.fromMap(Map<String, dynamic> map) {
    return MetaCheckOut(
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
