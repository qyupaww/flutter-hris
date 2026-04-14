part of 'logout_bloc.dart';

@immutable
abstract class LogoutEvent extends Equatable {}

class FetchLogout extends LogoutEvent {
  FetchLogout({this.headers, this.extra});

  final Map<String, String>? headers;
  final dynamic extra;

  @override
  List<Object?> get props => [headers, extra];
}
