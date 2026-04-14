import 'package:equatable/equatable.dart';

class ListCompanyEntity extends Equatable {
  const ListCompanyEntity({this.data, this.meta});

  final List<DataListCompany>? data;
  final MetaListCompany? meta;

  ListCompanyEntity copyWith({
    List<DataListCompany>? data,
    MetaListCompany? meta,
  }) {
    return ListCompanyEntity(data: data ?? this.data, meta: meta ?? this.meta);
  }

  @override
  List<Object?> get props => [data, meta];
}

class DataListCompany extends Equatable {
  const DataListCompany({
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

  DataListCompany copyWith({
    String? createdAt,
    int? id,
    double? latitude,
    double? longitude,
    int? maxRadius,
    String? name,
    String? updatedAt,
  }) {
    return DataListCompany(
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

class MetaListCompany extends Equatable {
  const MetaListCompany({this.code, this.message, this.status});

  final int? code;
  final String? message;
  final String? status;

  MetaListCompany copyWith({int? code, String? message, String? status}) {
    return MetaListCompany(
      code: code ?? this.code,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [code, message, status];
}
