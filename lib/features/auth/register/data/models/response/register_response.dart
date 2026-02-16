import 'dart:convert';

import 'package:equatable/equatable.dart';

class RegisterResponse extends Equatable {
  const RegisterResponse({this.data, this.meta});

  factory RegisterResponse.fromMap(Map<String, dynamic> map) {
    return RegisterResponse(
      data: map['data'] == null ? null : DataRegister.fromMap(map['data']),
      meta: map['meta'] == null ? null : MetaRegister.fromMap(map['meta']),
    );
  }

  factory RegisterResponse.fromJson(String source) =>
      RegisterResponse.fromMap(json.decode(source));

  final DataRegister? data;
  final MetaRegister? meta;

  Map<String, dynamic> toMap() {
    return {'data': data?.toMap(), 'meta': meta?.toMap()};
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [data, meta];
}

class DataRegister extends Equatable {
  const DataRegister({this.token, this.user});

  factory DataRegister.fromMap(Map<String, dynamic> map) {
    return DataRegister(
      token: map['token'],
      user: map['user'] == null ? null : UserRegister.fromMap(map['user']),
    );
  }

  factory DataRegister.fromJson(String source) =>
      DataRegister.fromMap(json.decode(source));

  final String? token;
  final UserRegister? user;

  Map<String, dynamic> toMap() {
    return {'token': token, 'user': user?.toMap()};
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [token, user];
}

class UserRegister extends Equatable {
  const UserRegister({
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

  factory UserRegister.fromMap(Map<String, dynamic> map) {
    return UserRegister(
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

  factory UserRegister.fromJson(String source) =>
      UserRegister.fromMap(json.decode(source));

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

  Map<String, dynamic> toMap() {
    return {
      'avatar_url': avatarUrl,
      'company_id': companyId,
      'created_at': createdAt,
      'division': division,
      'email': email,
      'full_name': fullName,
      'id': id,
      'nip': nip,
      'role': role,
      'updated_at': updatedAt,
    };
  }

  String toJson() => json.encode(toMap());

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

class MetaRegister extends Equatable {
  const MetaRegister({this.code, this.message, this.status});

  factory MetaRegister.fromMap(Map<String, dynamic> map) {
    return MetaRegister(
      code: int.tryParse(map['code']?.toString() ?? ''),
      message: map['message'],
      status: map['status'],
    );
  }

  factory MetaRegister.fromJson(String source) =>
      MetaRegister.fromMap(json.decode(source));

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
