import 'package:morpheme_flutter_lite/features/home/attendance/data/models/response/company_detail_response.dart'
    as company_detail_response;
import 'package:morpheme_flutter_lite/features/home/attendance/domain/entities/company_detail_entity.dart'
    as company_detail_entity;

extension CompanyDetailResponseMapper
    on company_detail_response.CompanyDetailResponse {
  company_detail_entity.CompanyDetailEntity toEntity() =>
      company_detail_entity.CompanyDetailEntity(
        data: data?.toEntity(),
        meta: meta?.toEntity(),
      );
}

extension DataCompanyDetailResponseMapper
    on company_detail_response.DataCompanyDetail {
  company_detail_entity.DataCompanyDetail toEntity() =>
      company_detail_entity.DataCompanyDetail(
        createdAt: createdAt,
        id: id,
        latitude: latitude,
        longitude: longitude,
        maxRadius: maxRadius,
        name: name,
        updatedAt: updatedAt,
      );
}

extension MetaCompanyDetailResponseMapper
    on company_detail_response.MetaCompanyDetail {
  company_detail_entity.MetaCompanyDetail toEntity() =>
      company_detail_entity.MetaCompanyDetail(
        code: code,
        message: message,
        status: status,
      );
}
