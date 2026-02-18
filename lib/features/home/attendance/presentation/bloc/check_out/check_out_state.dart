part of 'check_out_bloc.dart';

abstract class CheckOutState extends Equatable {
  const CheckOutState();

  @override
  List<Object?> get props => [];

  void when({
    void Function(CheckOutInitial state)? onInitial,
    void Function(CheckOutLoading state)? onLoading,
    void Function(CheckOutFailed state)? onFailed,
    void Function(CheckOutSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is CheckOutInitial) {
      onInitial?.call(state);
    } else if (state is CheckOutLoading) {
      onLoading?.call(state);
    } else if (state is CheckOutFailed) {
      onFailed?.call(state);
    } else if (state is CheckOutSuccess) {
      onSuccess?.call(state);
    }
  }
}

class CheckOutInitial extends CheckOutState {}

class CheckOutLoading extends CheckOutState {}

class CheckOutFailed extends CheckOutState {
  const CheckOutFailed(this.failure);

  final MorphemeFailure failure;

  @override
  List<Object?> get props => [failure];
}

class CheckOutSuccess extends CheckOutState {
  const CheckOutSuccess(this.data);

  final CheckOutEntity data;

  @override
  List<Object?> get props => [data];
}
