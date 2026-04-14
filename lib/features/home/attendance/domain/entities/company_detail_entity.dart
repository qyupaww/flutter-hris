import 'package:equatable/equatable.dart';

class CompanyDetailEntity extends Equatable {
  const CompanyDetailEntity({this.data, this.meta});

  final DataCompanyDetail? data;
  final MetaCompanyDetail? meta;

  CompanyDetailEntity copyWith({
    DataCompanyDetail? data,
    MetaCompanyDetail? meta,
  }) {
    return CompanyDetailEntity(
      data: data ?? this.data,
      meta: meta ?? this.meta,
    );
  }

  @override
  List<Object?> get props => [data, meta];
}

class DataCompanyDetail extends Equatable {
  const DataCompanyDetail({
    this.createdAt,
    this.id,
    this.latitude,
    this.longitude,
    this.maxRadius,
    this.name,
    this.updatedAt,
  });

  final String? createdAt;
  final int? id;
  final double? latitude;
  final double? longitude;
  final int? maxRadius;
  final String? name;
  final String? updatedAt;

  DataCompanyDetail copyWith({
    String? createdAt,
    int? id,
    double? latitude,
    double? longitude,
    int? maxRadius,
    String? name,
    String? updatedAt,
  }) {
    return DataCompanyDetail(
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      maxRadius: maxRadius ?? this.maxRadius,
      name: name ?? this.name,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    createdAt,
    id,
    latitude,
    longitude,
    maxRadius,
    name,
    updatedAt,
  ];
}

class MetaCompanyDetail extends Equatable {
  const MetaCompanyDetail({this.code, this.message, this.status});

  final int? code;
  final String? message;
  final String? status;

  MetaCompanyDetail copyWith({int? code, String? message, String? status}) {
    return MetaCompanyDetail(
      code: code ?? this.code,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [code, message, status];
}
