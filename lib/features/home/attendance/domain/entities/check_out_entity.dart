import 'package:equatable/equatable.dart';

class CheckOutEntity extends Equatable {
  const CheckOutEntity({this.data, this.meta});

  final DataCheckOut? data;
  final MetaCheckOut? meta;

  @override
  List<Object?> get props => [data, meta];
}

class DataCheckOut extends Equatable {
  const DataCheckOut({this.checkOutTime});

  final String? checkOutTime;

  @override
  List<Object?> get props => [checkOutTime];
}

class MetaCheckOut extends Equatable {
  const MetaCheckOut({this.code, this.message, this.status});

  final int? code;
  final String? message;
  final String? status;

  @override
  List<Object?> get props => [code, message, status];
}
