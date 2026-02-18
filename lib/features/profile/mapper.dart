import 'package:morpheme_flutter_lite/features/profile/data/models/response/profile_response.dart'
    as profile_response;
import 'package:morpheme_flutter_lite/features/profile/domain/entities/profile_entity.dart'
    as profile_entity;

extension ProfileResponseMapper on profile_response.ProfileResponse {
  profile_entity.ProfileEntity toEntity() => profile_entity.ProfileEntity(
    data: data?.toEntity(),
    meta: meta?.toEntity(),
  );
}

extension DataProfileResponseMapper on profile_response.DataProfile {
  profile_entity.DataProfile toEntity() => profile_entity.DataProfile(
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

extension MetaProfileResponseMapper on profile_response.MetaProfile {
  profile_entity.MetaProfile toEntity() =>
      profile_entity.MetaProfile(code: code, message: message, status: status);
}
