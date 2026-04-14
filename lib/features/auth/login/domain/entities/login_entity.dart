import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  const LoginEntity({this.data, this.meta});

  final DataLogin? data;
  final MetaLogin? meta;

  LoginEntity copyWith({DataLogin? data, MetaLogin? meta}) {
    return LoginEntity(data: data ?? this.data, meta: meta ?? this.meta);
  }

  @override
  List<Object?> get props => [data, meta];
}

class DataLogin extends Equatable {
  const DataLogin({this.token, this.user});

  final String? token;
  final UserLogin? user;

  DataLogin copyWith({String? token, UserLogin? user}) {
    return DataLogin(token: token ?? this.token, user: user ?? this.user);
  }

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

  UserLogin copyWith({
    String? avatarUrl,
    int? companyId,
    String? createdAt,
    String? division,
    String? email,
    String? fullName,
    int? id,
    String? nip,
    String? role,
    String? updatedAt,
  }) {
    return UserLogin(
      avatarUrl: avatarUrl ?? this.avatarUrl,
      companyId: companyId ?? this.companyId,
      createdAt: createdAt ?? this.createdAt,
      division: division ?? this.division,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      id: id ?? this.id,
      nip: nip ?? this.nip,
      role: role ?? this.role,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

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

  final int? code;
  final String? message;
  final String? status;

  MetaLogin copyWith({int? code, String? message, String? status}) {
    return MetaLogin(
      code: code ?? this.code,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [code, message, status];
}
