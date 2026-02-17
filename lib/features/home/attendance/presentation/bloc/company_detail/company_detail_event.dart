part of 'company_detail_bloc.dart';

@immutable
abstract class CompanyDetailEvent extends Equatable {
  const CompanyDetailEvent();
}

class FetchCompanyDetail extends CompanyDetailEvent {
  const FetchCompanyDetail(
    this.companyId, {
    this.headers,
    this.cacheStrategy,
    this.extra,
  });

  final int companyId;
  final Map<String, String>? headers;
  final CacheStrategy? cacheStrategy;
  final dynamic extra;

  @override
  List<Object?> get props => [companyId, headers, cacheStrategy, extra];
}

class CancelCompanyDetail extends CompanyDetailEvent {
  const CancelCompanyDetail({this.extra});

  final dynamic extra;

  @override
  List<Object?> get props => [extra];
}
