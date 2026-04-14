import 'dart:convert';

import 'package:equatable/equatable.dart';

class LoginResponse extends Equatable {
  const LoginResponse({this.data, this.meta});

  factory LoginResponse.fromMap(Map<String, dynamic> map) {
    return LoginResponse(
      data: map['data'] == null ? null : DataLogin.fromMap(map['data']),
      meta: map['meta'] == null ? null : MetaLogin.fromMap(map['meta']),
    );
  }

  factory LoginResponse.fromJson(String source) =>
      LoginResponse.fromMap(json.decode(source));

  final DataLogin? data;
  final MetaLogin? meta;

  Map<String, dynamic> toMap() {
    return {'data': data?.toMap(), 'meta': meta?.toMap()};
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [data, meta];
}

class DataLogin extends Equatable {
  const DataLogin({this.token, this.user});

  factory DataLogin.fromMap(Map<String, dynamic> map) {
    return DataLogin(
      token: map['token'],
      user: map['user'] == null ? null : UserLogin.fromMap(map['user']),
    );
  }

  factory DataLogin.fromJson(String source) =>
      DataLogin.fromMap(json.decode(source));

  final String? token;
  final UserLogin? user;

  Map<String, dynamic> toMap() {
    return {'token': token, 'user': user?.toMap()};
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [token, user];
}

class UserLogin extends Equatable {
  const UserLogin({
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

  factory UserLogin.fromMap(Map<String, dynamic> map) {
    return UserLogin(
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

  factory UserLogin.fromJson(String source) =>
      UserLogin.fromMap(json.decode(source));

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

class MetaLogin extends Equatable {
  const MetaLogin({this.code, this.message, this.status});

  factory MetaLogin.fromMap(Map<String, dynamic> map) {
    return MetaLogin(
      code: int.tryParse(map['code']?.toString() ?? ''),
      message: map['message'],
      status: map['status'],
    );
  }

  factory MetaLogin.fromJson(String source) =>
      MetaLogin.fromMap(json.decode(source));

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
