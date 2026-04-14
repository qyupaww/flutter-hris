import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  const ProfileEntity({this.data, this.meta});

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

  final int? code;
  final String? message;
  final String? status;

  @override
  List<Object?> get props => [code, message, status];
}
