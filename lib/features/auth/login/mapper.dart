import 'data/models/response/login_response.dart' as login_response;
import 'domain/entities/login_entity.dart' as login_entity;

extension LoginResponseMapper on login_response.LoginResponse {
  login_entity.LoginEntity toEntity() =>
      login_entity.LoginEntity(data: data?.toEntity(), meta: meta?.toEntity());
}

extension LoginEntityMapper on login_entity.LoginEntity {
  login_response.LoginResponse toResponse() => login_response.LoginResponse(
    data: data?.toResponse(),
    meta: meta?.toResponse(),
  );
}

extension DataLoginResponseMapper on login_response.DataLogin {
  login_entity.DataLogin toEntity() =>
      login_entity.DataLogin(token: token, user: user?.toEntity());
}

extension DataLoginEntityMapper on login_entity.DataLogin {
  login_response.DataLogin toResponse() =>
      login_response.DataLogin(token: token, user: user?.toResponse());
}

extension UserLoginResponseMapper on login_response.UserLogin {
  login_entity.UserLogin toEntity() => login_entity.UserLogin(
    avatarUrl: avatarUrl,
    companyId: companyId,
    createdAt: createdAt,
    division: division,
    email: email,
    fullName: fullName,
    id: id,
    nip: nip,
    role: role,
    updatedAt: updatedAt,
  );
}

extension UserLoginEntityMapper on login_entity.UserLogin {
  login_response.UserLogin toResponse() => login_response.UserLogin(
    avatarUrl: avatarUrl,
    companyId: companyId,
    createdAt: createdAt,
    division: division,
    email: email,
    fullName: fullName,
    id: id,
    nip: nip,
    role: role,
    updatedAt: updatedAt,
  );
}

extension MetaLoginResponseMapper on login_response.MetaLogin {
  login_entity.MetaLogin toEntity() =>
      login_entity.MetaLogin(code: code, message: message, status: status);
}

extension MetaLoginEntityMapper on login_entity.MetaLogin {
  login_response.MetaLogin toResponse() =>
      login_response.MetaLogin(code: code, message: message, status: status);
}
