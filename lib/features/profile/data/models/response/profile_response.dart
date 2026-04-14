import 'dart:convert';

import 'package:equatable/equatable.dart';

class ProfileResponse extends Equatable {
  const ProfileResponse({this.data, this.meta});

  factory ProfileResponse.fromMap(Map<String, dynamic> map) {
    return ProfileResponse(
      data: map['data'] == null ? null : DataProfile.fromMap(map['data']),
      meta: map['meta'] == null ? null : MetaProfile.fromMap(map['meta']),
    );
  }

  factory ProfileResponse.fromJson(String source) =>
      ProfileResponse.fromMap(json.decode(source));

  final DataProfile? data;
  final MetaProfile? meta;

  @override
  List<Object?> get props => [data, meta];
}

class DataProfile extends Equatable {
  const DataProfile({
    this.avatarUrl,
    this.companyId,
    this.createdAt,
    this.division,
    this.email,
    this.fullName,
    this.id,
    this.nip,
    this.role,
    this.updatedAt,
  });

  factory DataProfile.fromMap(Map<String, dynamic> map) {
    return DataProfile(
      avatarUrl: map['avatar_url'],
      companyId: int.tryParse(map['company_id']?.toString() ?? ''),
      createdAt: map['created_at'],
      division: map['division'],
      email: map['email'],
      fullName: map['full_name'],
      id: int.tryParse(map['id']?.toString() ?? ''),
      nip: map['nip'],
      role: map['role'],
      updatedAt: map['updated_at'],
    );
  }

  final String? avatarUrl;
  final int? companyId;
  final String? createdAt;
  final String? division;
  final String? email;
  final String? fullName;
  final int? id;
  final String? nip;
  final String? role;
  final String? updatedAt;

  @override
  List<Object?> get props => [
    avatarUrl,
    companyId,
    createdAt,
    division,
    email,
    fullName,
    id,
    nip,
    role,
    updatedAt,
  ];
}

class MetaProfile extends Equatable {
  const MetaProfile({this.code, this.message, this.status});

  factory MetaProfile.fromMap(Map<String, dynamic> map) {
    return MetaProfile(
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
