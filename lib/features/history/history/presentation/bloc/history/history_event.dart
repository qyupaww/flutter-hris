part of 'history_bloc.dart';

@immutable
abstract class HistoryEvent extends Equatable {}

class FetchHistory extends HistoryEvent {
  FetchHistory(this.body, {this.headers, this.extra, this.cacheStrategy});

  final HistoryBody body;
  final Map<String, String>? headers;
  final dynamic extra;
  final CacheStrategy? cacheStrategy;

  @override
  List<Object?> get props => [body, headers, extra, cacheStrategy];
}

class CancelHistory extends HistoryEvent {
  CancelHistory({this.extra});

  final dynamic extra;

  @override
  List<Object?> get props => [extra];
}
