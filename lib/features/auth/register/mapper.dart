import 'data/models/response/list_company_response.dart'
    as list_company_response;
import 'domain/entities/list_company_entity.dart' as list_company_entity;
import 'data/models/response/register_response.dart' as register_response;
import 'domain/entities/register_entity.dart' as register_entity;

extension ListCompanyResponseMapper
    on list_company_response.ListCompanyResponse {
  list_company_entity.ListCompanyEntity toEntity() =>
      list_company_entity.ListCompanyEntity(
        data: data?.map((e) => e.toEntity()).toList(),
        meta: meta?.toEntity(),
      );
}

extension ListCompanyEntityMapper on list_company_entity.ListCompanyEntity {
  list_company_response.ListCompanyResponse toResponse() =>
      list_company_response.ListCompanyResponse(
        data: data?.map((e) => e.toResponse()).toList(),
        meta: meta?.toResponse(),
      );
}

extension DataListCompanyResponseMapper
    on list_company_response.DataListCompany {
  list_company_entity.DataListCompany toEntity() =>
      list_company_entity.DataListCompany(
        createdAt: createdAt,
        id: id,
        latitude: latitude,
        longitude: longitude,
        maxRadius: maxRadius,
        name: name,
        updatedAt: updatedAt,
      );
}

extension DataListCompanyEntityMapper on list_company_entity.DataListCompany {
  list_company_response.DataListCompany toResponse() =>
      list_company_response.DataListCompany(
        createdAt: createdAt,
        id: id,
        latitude: latitude,
        longitude: longitude,
        maxRadius: maxRadius,
        name: name,
        updatedAt: updatedAt,
      );
}

extension MetaListCompanyResponseMapper
    on list_company_response.MetaListCompany {
  list_company_entity.MetaListCompany toEntity() =>
      list_company_entity.MetaListCompany(
        code: code,
        message: message,
        status: status,
      );
}

extension MetaListCompanyEntityMapper on list_company_entity.MetaListCompany {
  list_company_response.MetaListCompany toResponse() =>
      list_company_response.MetaListCompany(
        code: code,
        message: message,
        status: status,
      );
}

extension RegisterResponseMapper on register_response.RegisterResponse {
  register_entity.RegisterEntity toEntity() => register_entity.RegisterEntity(
    data: data?.toEntity(),
    meta: meta?.toEntity(),
  );
}

extension RegisterEntityMapper on register_entity.RegisterEntity {
  register_response.RegisterResponse toResponse() =>
      register_response.RegisterResponse(
        data: data?.toResponse(),
        meta: meta?.toResponse(),
      );
}

extension DataRegisterResponseMapper on register_response.DataRegister {
  register_entity.DataRegister toEntity() =>
      register_entity.DataRegister(token: token, user: user?.toEntity());
}

extension DataRegisterEntityMapper on register_entity.DataRegister {
  register_response.DataRegister toResponse() =>
      register_response.DataRegister(token: token, user: user?.toResponse());
}

extension UserRegisterResponseMapper on register_response.UserRegister {
  register_entity.UserRegister toEntity() => register_entity.UserRegister(
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

extension UserRegisterEntityMapper on register_entity.UserRegister {
  register_response.UserRegister toResponse() => register_response.UserRegister(
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

extension MetaRegisterResponseMapper on register_response.MetaRegister {
  register_entity.MetaRegister toEntity() => register_entity.MetaRegister(
    code: code,
    message: message,
    status: status,
  );
}

extension MetaRegisterEntityMapper on register_entity.MetaRegister {
  register_response.MetaRegister toResponse() => register_response.MetaRegister(
    code: code,
    message: message,
    status: status,
  );
}
