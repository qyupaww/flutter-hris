part of 'list_company_bloc.dart';

@immutable
abstract class ListCompanyState extends Equatable {
  bool get isInitial => this is ListCompanyInitial;
  bool get isLoading => this is ListCompanyLoading;
  bool get isFailed => this is ListCompanyFailed;
  bool get isSuccess => this is ListCompanySuccess;
  bool get isCanceled => this is ListCompanyCanceled;

  bool get isNotInitial => this is! ListCompanyInitial;
  bool get isNotLoading => this is! ListCompanyLoading;
  bool get isNotFailed => this is! ListCompanyFailed;
  bool get isNotSuccess => this is! ListCompanySuccess;
  bool get isNotCanceled => this is! ListCompanyCanceled;

  void when({
    void Function(ListCompanyInitial state)? onInitial,
    void Function(ListCompanyLoading state)? onLoading,
    void Function(ListCompanyFailed state)? onFailed,
    void Function(ListCompanySuccess state)? onSuccess,
    void Function(ListCompanyCanceled state)? onCanceled,
  }) {
    final state = this;
    if (state is ListCompanyInitial) {
      onInitial?.call(state);
    } else if (state is ListCompanyLoading) {
      onLoading?.call(state);
    } else if (state is ListCompanyFailed) {
      onFailed?.call(state);
    } else if (state is ListCompanySuccess) {
      onSuccess?.call(state);
    } else if (state is ListCompanyCanceled) {
      onCanceled?.call(state);
    }
  }

  Widget builder({
    Widget Function(ListCompanyInitial state)? onInitial,
    Widget Function(ListCompanyLoading state)? onLoading,
    Widget Function(ListCompanyFailed state)? onFailed,
    Widget Function(ListCompanySuccess state)? onSuccess,
    Widget Function(ListCompanyCanceled state)? onCanceled,

    Widget Function(ListCompanyState state)? onStateBuilder,
  }) {
    final state = this;
    final defaultWidget = onStateBuilder?.call(this) ?? const SizedBox.shrink();

    if (state is ListCompanyInitial) {
      return onInitial?.call(state) ?? defaultWidget;
    } else if (state is ListCompanyLoading) {
      return onLoading?.call(state) ?? defaultWidget;
    } else if (state is ListCompanyFailed) {
      return onFailed?.call(state) ?? defaultWidget;
    } else if (state is ListCompanySuccess) {
      return onSuccess?.call(state) ?? defaultWidget;
    } else if (state is ListCompanyCanceled) {
      return onCanceled?.call(state) ?? defaultWidget;
    } else {
      return defaultWidget;
    }
  }
}

class ListCompanyInitial extends ListCompanyState {
  @override
  List<Object?> get props => [];
}

class ListCompanyLoading extends ListCompanyState {
  ListCompanyLoading(this.body, this.headers, this.extra);

  final ListCompanyBody body;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, extra];
}

class ListCompanyFailed extends ListCompanyState {
  ListCompanyFailed(this.body, this.headers, this.failure, this.extra);

  final ListCompanyBody body;
  final Map<String, String>? headers;
  final MorphemeFailure failure;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, failure, extra];
}

class ListCompanyCanceled extends ListCompanyState {
  ListCompanyCanceled(this.extra);

  final dynamic extra;

  @override
  List<Object?> get props => [extra];
}

class ListCompanySuccess extends ListCompanyState {
  ListCompanySuccess(this.body, this.headers, this.data, this.extra);

  final ListCompanyBody body;
  final Map<String, String>? headers;
  final ListCompanyEntity data;
  final dynamic extra;

  @override
  List<Object?> get props => [body, headers, data, extra];
}
