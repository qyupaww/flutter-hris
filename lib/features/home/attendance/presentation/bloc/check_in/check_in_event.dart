part of 'check_in_bloc.dart';

abstract class CheckInEvent extends Equatable {
  const CheckInEvent();

  @override
  List<Object> get props => [];
}

class DoCheckIn extends CheckInEvent {
  const DoCheckIn(this.body);

  final CheckInBody body;

  @override
  List<Object> get props => [body];
}
