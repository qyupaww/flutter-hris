part of 'logout_bloc.dart';

@immutable
abstract class LogoutState extends Equatable {
  void when({
    void Function(LogoutInitial state)? onInitial,
    void Function(LogoutLoading state)? onLoading,
    void Function(LogoutFailed state)? onFailed,
    void Function(LogoutSuccess state)? onSuccess,
  }) {
    final state = this;
    if (state is LogoutInitial) {
      onInitial?.call(state);
    } else if (state is LogoutLoading) {
      onLoading?.call(state);
    } else if (state is LogoutFailed) {
      onFailed?.call(state);
    } else if (state is LogoutSuccess) {
      onSuccess?.call(state);
    }
  }

  Widget builder({
    Widget Function(LogoutInitial state)? onInitial,
    Widget Function(LogoutLoading state)? onLoading,
    Widget Function(LogoutFailed state)? onFailed,
    Widget Function(LogoutSuccess state)? onSuccess,
    Widget Function(LogoutState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is LogoutInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is LogoutLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is LogoutFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is LogoutSuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class LogoutInitial extends LogoutState {
  @override
  List<Object?> get props => [];
}

class LogoutLoading extends LogoutState {
  LogoutLoading(this.headers, this.extra);

  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [headers, extra];
}

class LogoutFailed extends LogoutState {
  LogoutFailed(this.headers, this.failure, this.extra);

  final Map<String, String>? headers;
  final MorphemeFailure failure;
  final dynamic extra;

  @override
  List<Object?> get props => [headers, failure, extra];
}

class LogoutSuccess extends LogoutState {
  LogoutSuccess(this.headers, this.data, this.extra);

  final Map<String, String>? headers;
  final LogoutEntity data;
  final dynamic extra;

  @override
  List<Object?> get props => [headers, data, extra];
}
