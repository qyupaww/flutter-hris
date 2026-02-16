import 'package:equatable/equatable.dart';

class ListCompanyBody extends Equatable {
  const ListCompanyBody({this.rawBody});

  final Map<String, dynamic>? rawBody;

  Map<String, dynamic> toMap() {
    return {if (rawBody?.isNotEmpty ?? false) ...rawBody ?? {}};
  }

  @override
  List<Object?> get props => [rawBody];
}
