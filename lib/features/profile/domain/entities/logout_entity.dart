import 'package:equatable/equatable.dart';

class LogoutEntity extends Equatable {
  const LogoutEntity({this.success = true});

  final bool success;

  @override
  List<Object?> get props => [success];
}
