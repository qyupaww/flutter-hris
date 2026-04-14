import 'dart:convert';

import 'package:equatable/equatable.dart';

class CompanyDetailResponse extends Equatable {
  const CompanyDetailResponse({this.data, this.meta});

  factory CompanyDetailResponse.fromMap(Map<String, dynamic> map) {
    return CompanyDetailResponse(
      data: map['data'] == null ? null : DataCompanyDetail.fromMap(map['data']),
      meta: map['meta'] == null ? null : MetaCompanyDetail.fromMap(map['meta']),
    );
  }

  factory CompanyDetailResponse.fromJson(String source) =>
      CompanyDetailResponse.fromMap(json.decode(source));

  final DataCompanyDetail? data;
  final MetaCompanyDetail? meta;

  Map<String, dynamic> toMap() {
    return {'data': data?.toMap(), 'meta': meta?.toMap()};
  }

  String toJson() => json.encode(toMap());

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

  factory DataCompanyDetail.fromMap(Map<String, dynamic> map) {
    return DataCompanyDetail(
      createdAt: map['created_at'],
      id: int.tryParse(map['id']?.toString() ?? ''),
      latitude: double.tryParse(map['latitude']?.toString() ?? ''),
      longitude: double.tryParse(map['longitude']?.toString() ?? ''),
      maxRadius: int.tryParse(map['max_radius']?.toString() ?? ''),
      name: map['name'],
      updatedAt: map['updated_at'],
    );
  }

  factory DataCompanyDetail.fromJson(String source) =>
      DataCompanyDetail.fromMap(json.decode(source));

  final String? createdAt;
  final int? id;
  final double? latitude;
  final double? longitude;
  final int? maxRadius;
  final String? name;
  final String? updatedAt;

  Map<String, dynamic> toMap() {
    return {
      'created_at': createdAt,
      'id': id,
      'latitude': latitude,
      'longitude': longitude,
      'max_radius': maxRadius,
      'name': name,
      'updated_at': updatedAt,
    };
  }

  String toJson() => json.encode(toMap());

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

  factory MetaCompanyDetail.fromMap(Map<String, dynamic> map) {
    return MetaCompanyDetail(
      code: int.tryParse(map['code']?.toString() ?? ''),
      message: map['message'],
      status: map['status'],
    );
  }

  factory MetaCompanyDetail.fromJson(String source) =>
      MetaCompanyDetail.fromMap(json.decode(source));

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
