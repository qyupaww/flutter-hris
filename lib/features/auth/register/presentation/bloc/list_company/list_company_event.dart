part of 'list_company_bloc.dart';

@immutable
abstract class ListCompanyEvent extends Equatable {}

class FetchListCompany extends ListCompanyEvent {
  FetchListCompany(this.body, {this.headers, this.extra, this.cacheStrategy});

  final ListCompanyBody body;
  final Map<String, String>? headers;
  final dynamic extra;
  final CacheStrategy? cacheStrategy;

  @override
  List<Object?> get props => [body, headers, extra, cacheStrategy];
}

class CancelListCompany extends ListCompanyEvent {
  CancelListCompany({this.extra});

  final dynamic extra;

  @override
  List<Object?> get props => [extra];
}
