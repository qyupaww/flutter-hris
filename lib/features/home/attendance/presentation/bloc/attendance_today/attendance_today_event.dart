part of 'attendance_today_bloc.dart';

abstract class AttendanceTodayEvent extends Equatable {
  const AttendanceTodayEvent();

  @override
  List<Object> get props => [];
}

class FetchAttendanceToday extends AttendanceTodayEvent {}
