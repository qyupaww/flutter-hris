part of 'history_bloc.dart';

@immutable
abstract class HistoryState extends Equatable {
  bool get isInitial => this is HistoryInitial;
  bool get isLoading => this is HistoryLoading;
  bool get isFailed => this is HistoryFailed;
  bool get isSuccess => this is HistorySuccess;
  bool get isCanceled => this is HistoryCanceled;

  bool get isNotInitial => this is! HistoryInitial;
  bool get isNotLoading => this is! HistoryLoading;
  bool get isNotFailed => this is! HistoryFailed;
  bool get isNotSuccess => this is! HistorySuccess;
  bool get isNotCanceled => this is! HistoryCanceled;

  void when({
    void Function(HistoryInitial state)? onInitial,
    void Function(HistoryLoading state)? onLoading,
    void Function(HistoryFailed state)? onFailed,
    void Function(HistorySuccess state)? onSuccess,
    void Function(HistoryCanceled state)? onCanceled,
  }) {
    final state = this;
    if (state is HistoryInitial) {
      onInitial?.call(state);
    } else if (state is HistoryLoading) {
      onLoading?.call(state);
    } else if (state is HistoryFailed) {
      onFailed?.call(state);
    } else if (state is HistorySuccess) {
      onSuccess?.call(state);
    } else if (state is HistoryCanceled) {
      onCanceled?.call(state);
    }
  }

  Widget builder({
    Widget Function(HistoryInitial state)? onInitial,
    Widget Function(HistoryLoading state)? onLoading,
    Widget Function(HistoryFailed state)? onFailed,
    Widget Function(HistorySuccess state)? onSuccess,
    Widget Function(HistoryCanceled state)? onCanceled,

    Widget Function(HistoryState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is HistoryInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is HistoryLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is HistoryFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is HistorySuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else if (state is HistoryCanceled) {
      return onCanceled?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class HistoryInitial extends HistoryState {
  @override
  List<Object?> get props => [];
}

class HistoryLoading extends HistoryState {
  HistoryLoading(this.body, this.headers, this.extra);

  final HistoryBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}

class HistoryFailed extends HistoryState {
  HistoryFailed(this.body, this.headers, this.failure, this.extra);

  final HistoryBody body;
  final Map<String, String>? headers;
  final MorphemeFailure failure;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, failure, extra];
}

class HistoryCanceled extends HistoryState {
  HistoryCanceled(this.extra);

  final dynamic extra;

  @override
  List<Object?> get props => [extra];
}

class HistorySuccess extends HistoryState {
  HistorySuccess(this.body, this.headers, this.data, this.extra);

  final HistoryBody body;
  final Map<String, String>? headers;
  final HistoryEntity data;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, data, extra];
}
