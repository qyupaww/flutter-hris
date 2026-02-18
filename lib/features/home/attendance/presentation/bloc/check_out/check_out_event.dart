part of 'check_out_bloc.dart';

abstract class CheckOutEvent extends Equatable {
  const CheckOutEvent();

  @override
  List<Object> get props => [];
}

class DoCheckOut extends CheckOutEvent {
  const DoCheckOut(this.body);

  final CheckOutBody body;

  @override
  List<Object> get props => [body];
}
