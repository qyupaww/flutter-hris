import 'package:morpheme_flutter_lite/features/home/attendance/data/models/response/company_detail_response.dart'
    as company_detail_response;
import 'package:morpheme_flutter_lite/features/home/attendance/domain/entities/company_detail_entity.dart'
    as company_detail_entity;
import 'package:morpheme_flutter_lite/features/home/attendance/data/models/response/check_in_response.dart'
    as check_in_response;
import 'package:morpheme_flutter_lite/features/home/attendance/domain/entities/check_in_entity.dart'
    as check_in_entity;
import 'package:morpheme_flutter_lite/features/home/attendance/data/models/response/check_out_response.dart'
    as check_out_response;
import 'package:morpheme_flutter_lite/features/home/attendance/domain/entities/check_out_entity.dart'
    as check_out_entity;
import 'package:morpheme_flutter_lite/features/home/attendance/data/models/response/attendance_today_response.dart'
    as attendance_today_response;
import 'package:morpheme_flutter_lite/features/home/attendance/domain/entities/attendance_today_entity.dart'
    as attendance_today_entity;

// ─── Company Detail ─────────────────────────────────────────

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

// ─── Check In ───────────────────────────────────────────────

extension CheckInResponseMapper on check_in_response.CheckInResponse {
  check_in_entity.CheckInEntity toEntity() => check_in_entity.CheckInEntity(
    data: data?.toEntity(),
    meta: meta?.toEntity(),
  );
}

extension DataCheckInResponseMapper on check_in_response.DataCheckIn {
  check_in_entity.DataCheckIn toEntity() => check_in_entity.DataCheckIn(
    date: date,
    checkInTime: checkInTime,
    status: status,
  );
}

extension MetaCheckInResponseMapper on check_in_response.MetaCheckIn {
  check_in_entity.MetaCheckIn toEntity() =>
      check_in_entity.MetaCheckIn(code: code, message: message, status: status);
}

// ─── Check Out ──────────────────────────────────────────────

extension CheckOutResponseMapper on check_out_response.CheckOutResponse {
  check_out_entity.CheckOutEntity toEntity() => check_out_entity.CheckOutEntity(
    data: data?.toEntity(),
    meta: meta?.toEntity(),
  );
}

extension DataCheckOutResponseMapper on check_out_response.DataCheckOut {
  check_out_entity.DataCheckOut toEntity() =>
      check_out_entity.DataCheckOut(checkOutTime: checkOutTime);
}

extension MetaCheckOutResponseMapper on check_out_response.MetaCheckOut {
  check_out_entity.MetaCheckOut toEntity() => check_out_entity.MetaCheckOut(
    code: code,
    message: message,
    status: status,
  );
}

// ─── Attendance Today ───────────────────────────────────────

extension AttendanceTodayResponseMapper
    on attendance_today_response.AttendanceTodayResponse {
  attendance_today_entity.AttendanceTodayEntity toEntity() =>
      attendance_today_entity.AttendanceTodayEntity(
        data: data?.toEntity(),
        meta: meta?.toEntity(),
      );
}

extension DataAttendanceTodayResponseMapper
    on attendance_today_response.DataAttendanceToday {
  attendance_today_entity.DataAttendanceToday toEntity() =>
      attendance_today_entity.DataAttendanceToday(
        checkInStatus: checkInStatus,
        checkInTime: checkInTime,
        checkOutStatus: checkOutStatus,
        checkOutTime: checkOutTime,
        isCheckedIn: isCheckedIn,
        isCheckedOut: isCheckedOut,
      );
}

extension MetaAttendanceTodayResponseMapper
    on attendance_today_response.MetaAttendanceToday {
  attendance_today_entity.MetaAttendanceToday toEntity() =>
      attendance_today_entity.MetaAttendanceToday(
        code: code,
        message: message,
        status: status,
      );
}
