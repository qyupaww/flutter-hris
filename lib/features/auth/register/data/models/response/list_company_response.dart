import 'dart:convert';

import 'package:equatable/equatable.dart';

class ListCompanyResponse extends Equatable {
  const ListCompanyResponse({this.data, this.meta});

  factory ListCompanyResponse.fromMap(Map<String, dynamic> map) {
    return ListCompanyResponse(
      data: map['data'] is List
          ? List.from(
              (map['data'] as List)
                  .where((element) => element != null)
                  .map((e) => DataListCompany.fromMap(e)),
            )
          : null,
      meta: map['meta'] == null ? null : MetaListCompany.fromMap(map['meta']),
    );
  }

  factory ListCompanyResponse.fromJson(String source) =>
      ListCompanyResponse.fromMap(json.decode(source));

  final List<DataListCompany>? data;
  final MetaListCompany? meta;

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

  factory DataListCompany.fromMap(Map<String, dynamic> map) {
    return DataListCompany(
      createdAt: map['created_at'],
      id: int.tryParse(map['id']?.toString() ?? ''),
      latitude: double.tryParse(map['latitude']?.toString() ?? ''),
      longitude: double.tryParse(map['longitude']?.toString() ?? ''),
      maxRadius: int.tryParse(map['max_radius']?.toString() ?? ''),
      name: map['name'],
      updatedAt: map['updated_at'],
    );
  }

  factory DataListCompany.fromJson(String source) =>
      DataListCompany.fromMap(json.decode(source));

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

class MetaListCompany extends Equatable {
  const MetaListCompany({this.code, this.message, this.status});

  factory MetaListCompany.fromMap(Map<String, dynamic> map) {
    return MetaListCompany(
      code: int.tryParse(map['code']?.toString() ?? ''),
      message: map['message'],
      status: map['status'],
    );
  }

  factory MetaListCompany.fromJson(String source) =>
      MetaListCompany.fromMap(json.decode(source));

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
