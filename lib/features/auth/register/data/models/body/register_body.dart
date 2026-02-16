import 'package:equatable/equatable.dart';

class RegisterBody extends Equatable {
  const RegisterBody({
    this.rawBody,

    this.companyId,
    this.division,
    this.email,
    this.fullName,
    this.nip,
    this.password,
  });

  final Map<String, dynamic>? rawBody;
  final int? companyId;
  final String? division;
  final String? email;
  final String? fullName;
  final String? nip;
  final String? password;

  Map<String, dynamic> toMap() {
    return {
      if (rawBody?.isNotEmpty ?? false) ...rawBody ?? {},
      if (companyId != null) 'company_id': companyId,
      if (division != null) 'division': division,
      if (email != null) 'email': email,
      if (fullName != null) 'full_name': fullName,
      if (nip != null) 'nip': nip,
      if (password != null) 'password': password,
    };
  }

  @override
  List<Object?> get props => [
    rawBody,
    companyId,
    division,
    email,
    fullName,
    nip,
    password,
  ];
}
