part of 'attendance_today_bloc.dart';

abstract class AttendanceTodayState extends Equatable {
  const AttendanceTodayState();

  @override
  List<Object?> get props => [];

  void when({
    void Function(AttendanceTodayInitial state)? onInitial,
    void Function(AttendanceTodayLoading state)? onLoading,
    void Function(AttendanceTodayFailed state)? onFailed,
    void Function(AttendanceTodaySuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is AttendanceTodayInitial) {
      onInitial?.call(state);
    } else if (state is AttendanceTodayLoading) {
      onLoading?.call(state);
    } else if (state is AttendanceTodayFailed) {
      onFailed?.call(state);
    } else if (state is AttendanceTodaySuccess) {
      onSuccess?.call(state);
    }
  }
}

class AttendanceTodayInitial extends AttendanceTodayState {}

class AttendanceTodayLoading extends AttendanceTodayState {}

class AttendanceTodayFailed extends AttendanceTodayState {
  const AttendanceTodayFailed(this.failure);

  final MorphemeFailure failure;

  @override
  List<Object?> get props => [failure];
}

class AttendanceTodaySuccess extends AttendanceTodayState {
  const AttendanceTodaySuccess(this.data);

  final AttendanceTodayEntity data;

  @override
  List<Object?> get props => [data];
}
