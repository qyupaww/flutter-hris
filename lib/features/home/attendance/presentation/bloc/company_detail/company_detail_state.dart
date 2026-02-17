part of 'company_detail_bloc.dart';

@immutable
abstract class CompanyDetailState extends Equatable {
  const CompanyDetailState();

  bool get isLoading => this is CompanyDetailLoading;
  bool get isSuccess => this is CompanyDetailSuccess;
  bool get isFailed => this is CompanyDetailFailed;
  bool get isCanceled => this is CompanyDetailCanceled;

  void when({
    void Function(CompanyDetailLoading state)? onLoading,
    void Function(CompanyDetailSuccess state)? onSuccess,
    void Function(CompanyDetailFailed state)? onFailed,
    void Function(CompanyDetailCanceled state)? onCanceled,
  }) {
    final state = this;
    if (state is CompanyDetailLoading) {
      onLoading?.call(state);
    } else if (state is CompanyDetailSuccess) {
      onSuccess?.call(state);
    } else if (state is CompanyDetailFailed) {
      onFailed?.call(state);
    } else if (state is CompanyDetailCanceled) {
      onCanceled?.call(state);
    }
  }
}

class CompanyDetailInitial extends CompanyDetailState {
  @override
  List<Object?> get props => [];
}

class CompanyDetailLoading extends CompanyDetailState {
  const CompanyDetailLoading(this.companyId, this.headers, this.extra);

  final int companyId;
  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [companyId, headers, extra];
}

class CompanyDetailSuccess extends CompanyDetailState {
  const CompanyDetailSuccess(
    this.companyId,
    this.headers,
    this.data,
    this.extra,
  );

  final int companyId;
  final Map<String, String>? headers;
  final CompanyDetailEntity data;
  final dynamic extra;

  @override
  List<Object?> get props => [companyId, headers, data, extra];
}

class CompanyDetailFailed extends CompanyDetailState {
  const CompanyDetailFailed(
    this.companyId,
    this.headers,
    this.failure,
    this.extra,
  );

  final int companyId;
  final Map<String, String>? headers;
  final MorphemeFailure failure;
  final dynamic extra;

  @override
  List<Object?> get props => [companyId, headers, failure, extra];
}

class CompanyDetailCanceled extends CompanyDetailState {
  const CompanyDetailCanceled(this.extra);

  final dynamic extra;

  @override
  List<Object?> get props => [extra];
}
