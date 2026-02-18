part of 'check_in_bloc.dart';

abstract class CheckInState extends Equatable {
  const CheckInState();

  @override
  List<Object?> get props => [];

  void when({
    void Function(CheckInInitial state)? onInitial,
    void Function(CheckInLoading state)? onLoading,
    void Function(CheckInFailed state)? onFailed,
    void Function(CheckInSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is CheckInInitial) {
      onInitial?.call(state);
    } else if (state is CheckInLoading) {
      onLoading?.call(state);
    } else if (state is CheckInFailed) {
      onFailed?.call(state);
    } else if (state is CheckInSuccess) {
      onSuccess?.call(state);
    }
  }
}

class CheckInInitial extends CheckInState {}

class CheckInLoading extends CheckInState {}

class CheckInFailed extends CheckInState {
  const CheckInFailed(this.failure);

  final MorphemeFailure failure;

  @override
  List<Object?> get props => [failure];
}

class CheckInSuccess extends CheckInState {
  const CheckInSuccess(this.data);

  final CheckInEntity data;

  @override
  List<Object?> get props => [data];
}
