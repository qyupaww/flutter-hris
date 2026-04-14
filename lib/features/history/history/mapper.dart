import 'data/models/response/history_response.dart' as history_response;
import 'domain/entities/history_entity.dart' as history_entity;

extension HistoryResponseMapper on history_response.HistoryResponse {
  history_entity.HistoryEntity toEntity() => history_entity.HistoryEntity(
    data: data?.map((e) => e.toEntity()).toList(),
    meta: meta?.toEntity(),
  );
}

extension HistoryEntityMapper on history_entity.HistoryEntity {
  history_response.HistoryResponse toResponse() =>
      history_response.HistoryResponse(
        data: data?.map((e) => e.toResponse()).toList(),
        meta: meta?.toResponse(),
      );
}

extension DataHistoryResponseMapper on history_response.DataHistory {
  history_entity.DataHistory toEntity() => history_entity.DataHistory(
    checkInTime: checkInTime,
    checkOutTime: checkOutTime,
    date: date,
    status: status,
  );
}

extension DataHistoryEntityMapper on history_entity.DataHistory {
  history_response.DataHistory toResponse() => history_response.DataHistory(
    checkInTime: checkInTime,
    checkOutTime: checkOutTime,
    date: date,
    status: status,
  );
}

extension MetaHistoryResponseMapper on history_response.MetaHistory {
  history_entity.MetaHistory toEntity() =>
      history_entity.MetaHistory(code: code, message: message, status: status);
}

extension MetaHistoryEntityMapper on history_entity.MetaHistory {
  history_response.MetaHistory toResponse() => history_response.MetaHistory(
    code: code,
    message: message,
    status: status,
  );
}
